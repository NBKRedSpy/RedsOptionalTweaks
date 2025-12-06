# Plan: Add Feature Force-Disable System

## Goal
Create a non-persistent force-disable mechanism to disable features without modifying user's saved ModConfig settings, controlled by a bundled JSON file.

## Analysis
- **Target properties**: All `ModConfig` properties containing "enable" (e.g., `EnableMouseQuickTossKey`, `EnableHoldToReload`, etc.)
- **Key constraint**: Cannot modify `ModConfig.cs` properties or `Mcm/McmConfiguration.cs`
- **Persistence requirement**: Force-disables must not save to user's config file
- **Source**: Bundled JSON file in build output
- **Functionality**: Can only **disable** features, not force-enable them

## Implementation Plan

### 1. Create Force-Disable Configuration File
**File**: `FeatureDisable.json` (root of project)

```json
{
  "EnableMouseQuickTossKey": false,
  "EnableShipSpeedBoost": false,
  "EnableHoldToReload": false,
  "EnableSplitStacksKeys": false,
  "EnableRecycleHotkey": false,
  "EnableStackTotalInventoryCount": false,
  "EnableImplantIndicator": false
}
```

- `false` = force-disable the feature regardless of user config
- `true` = use user's config value (no override)

### 2. Create Force-Disable Manager Class
**File**: `FeatureDisableManager.cs`

```csharp
public class FeatureDisableManager
{
    private Dictionary<string, bool> _disableFlags;
    private string _disableFilePath;
    
    public FeatureDisableManager(string disableFilePath);
    public void LoadDisableFlags();
    public bool IsForceDisabled(string propertyName);
    public bool IsFeatureEnabled(string propertyName, bool configValue);
}
```

**Key methods**:
- `LoadDisableFlags()`: Deserialize JSON from bundled file
- `IsForceDisabled()`: Return true if feature is force-disabled
- `IsFeatureEnabled()`: Return `!IsForceDisabled(propertyName) && configValue` (force-disable takes precedence)

### 3. Modify `Plugin.cs` Integration
**File**: `Plugin.cs`

Add after config load in `AfterConfig()`:

```csharp
public static FeatureDisableManager DisableManager { get; private set; }

[Hook(ModHookType.AfterConfigsLoaded)]
public static void AfterConfig(IModContext context)
{
    // ...existing code...
    Config = new ModConfig(ConfigDirectories.ConfigPath).LoadConfig();
    
    // NEW: Load feature force-disable flags
    string disablePath = Path.Combine(
        Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location),
        "FeatureDisable.json"
    );
    DisableManager = new FeatureDisableManager(disablePath);
    DisableManager.LoadDisableFlags();
    
    // ...rest of existing code...
}
```

### 4. Update All Harmony Prepare() Methods
**Pattern to apply in all patch files**:

**Before**:
```csharp
public static bool Prepare()
{
    return Plugin.Config.EnableMouseQuickTossKey;
}
```

**After**:
```csharp
public static bool Prepare()
{
    return Plugin.DisableManager.IsFeatureEnabled(
        nameof(ModConfig.EnableMouseQuickTossKey),
        Plugin.Config.EnableMouseQuickTossKey
    );
}
```

**Files to update**:
- `Patches/DragController_Update_Patch.cs`
- `Patches/HoldToReload/DungeonGameMode_Update_Patch.cs`
- `Patches/HoldToReload/Player_NextTurnStarted_Patch.cs`
- `Patches/HoldToReload/Player_ProcessActionPoint_Patch.cs`
- `Patches/HoldToReload/PlayerCommandQueue_Add_Patch.cs`
- `Patches/HoldToReload/PlayerInteractionSystem_ProcessCmd_Patch.cs`
- `Patches/HoldToReload/PlayerInteractionSystem_ProcessInput_Patch.cs`
- `Patches/ImplantIndicator/CorpseInspectWindow_RefreshImplantsWarning_Patch.cs`
- `Patches/ImplantIndicator/MonsterInspectWindow_RefreshImplantsWarning_Patch.cs`
- `Patches/RecycleHotkey/ScreenWithShipCargo_Configure_Patch.cs`
- `Patches/SplitStackHotkeys/ContextMenuSplitStacksButton_Start_Patch.cs`
- `Patches/StackTotalInventoryCount/ItemSlot_LateUpdate_Patch.cs`

### 5. Update Non-Harmony Patches
**File**: `Plugin.cs` - `ApplyNonHarmonyPatches()`

**Before**:
```csharp
if (Config.EnableShipSpeedBoost)
{
    Data.Global.DistanceToHours /= Config.ShipSpeedIncrease;
}
```

**After**:
```csharp
if (DisableManager.IsFeatureEnabled(
    nameof(ModConfig.EnableShipSpeedBoost), 
    Config.EnableShipSpeedBoost))
{
    Data.Global.DistanceToHours /= Config.ShipSpeedIncrease;
}
```

### 6. Update .csproj Build Configuration
**File**: `RedsOptionalTweaks.csproj`

Add to existing `<ItemGroup>`:

```xml
<None Include="FeatureDisable.json">
  <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
</None>
```

Ensures JSON file is copied to `bin/Debug/net48` and Steam Workshop folder.

## Error Handling

### FeatureDisableManager Constructor
- If `FeatureDisable.json` missing: Log warning, treat all features as enabled (no force-disables)
- If JSON parse fails: Log error, treat all features as enabled

### Plugin.AfterConfig()
- Wrap disable flag loading in try-catch
- On failure: Log error and continue with normal config behavior

## Testing
See `Testing.md` in project root for testing checklist.

## Benefits
- ✅ Author can force-disable buggy features without user intervention
- ✅ Zero persistence side effects
- ✅ No changes to existing config system
- ✅ Transparent to MCM UI (shows user's saved preference)
- ✅ Follows existing `Prepare()` pattern
- ✅ Cannot accidentally force-enable features (safety constraint)

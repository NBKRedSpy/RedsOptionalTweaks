# RedsOptionalTweaks - AI Coding Guide

## Project Overview
This is a **Harmony mod** for the game **Quasimorph**. The mod provides optional gameplay tweaks configurable through MCM (Mod Configuration Menu), 
using regular method patchs as well as  IL patching to modify game behavior.

- This is Harmony, not HarmonyX.  Do not use the HarmonyX specific APIs.
- When creating a new CodeInstruction Call, use the CodeInstruction.Call method instead of creating a new CodeInstruction manually.

## C# styles
- Follows standard C# conventions (PascalCase for types/methods, camelCase for variables)
- Uses `var` for local variable declarations when the type is obvious from the right-hand side
- Inline if with return statements for simple conditions

## Architecture

### Core Components
- **Plugin.cs**: Entry point with `[Hook(ModHookType.AfterConfigsLoaded)]` - patches applied after configs load
- **ModConfig.cs**: Feature flags and settings, serialized to `AppData/../Quasimorph_ModConfigs/{ModName}/config.json`
- **Mcm/McmConfiguration.cs**: The GUI for MCM configuration, mirrors `ModConfig.cs`
- **FeatureDisable.json**: The override flags for disabling features without changing main config.  Each feature's enable property in the ModConfig.cs has a corresponding flag in this file.  Defaults to true.
- **Patches/**: Feature-specific Harmony patches organized by subdirectory (HoldToReload, ImplantIndicator, RecycleHotkey, etc.)
- **Utils/**: Shared utilities for logging, transpiling, and Unity component injection

### Mod Loading Flow
1. Game calls `AfterConfig()` hook in Plugin.cs
2. Version compatibility check (min 0.9.6)
3. Config loaded from persistent folder (creates default if missing)
4. MCM configuration UI registered
5. Non-Harmony patches applied (e.g., ship speed boost via `Data.Global.DistanceToHours`)
6. Harmony patches applied via `PatchAll()`

## Critical Patterns

### IL Transpiler Pattern
Most patches use **transpilers** (not Prefix/Postfix) to modify game IL directly:
- Use `CodeMatcher` from Harmony for pattern matching
- Store original IL in `OriginalIL/*.il` files for reference during development
- Example: `DragController_Update_Patch` replaces hardcoded `KeyCode.LeftControl` check with custom key binding

**Key transpiler utilities** (`Utils/TranspileUtils.cs`):
- `MatchVariable()`: Match IL instructions by local variable type and index
- `LogIL()`: Debug helper to dump IL to file for analysis

### Unity Component Injection Pattern
For features needing Unity `Update()` callbacks where the target object does not have a suitable `Update()` function, use `UpdateComponent<T>`:
```csharp
// From RecycleHotkey feature
ShipCargoUpdateComponent.CreateComponent<ShipCargoUpdateComponent>(__instance);
```
- Attach custom MonoBehaviour to existing game objects
- Handles lifecycle (prevents duplicate components, cleanup on destroy)
- See `Utils/UpdateComponent.cs` and usage in `ShipCargoUpdateComponent.cs`

## Development Workflows

### Building and Testing
- **Build**: `dotnet build` (or F5 in VS) - outputs to `bin/Debug/net48/`
- **Auto-Deploy**: Post-build event copies to Steam Workshop folder: `Steam/steamapps/workshop/content/2059170/{SteamId}/`
- **Manual Testing**: Run game, enable mod in mod manager, test feature toggles in MCM
- **Steam ID**: Set in `.csproj` `<SteamId>` property (currently `3589610029`)

### Adding a New Feature Enable Flag 
* A patch class will have a `_Patch.cs` suffix.  There may be many _patch.cs files in a single feature folder.
* The functionality will be the name of the folder the patch is in. For example, if the patch is in `Patches/ImplantIndicator/`, the feature name is `ImplantIndicator`.  
* Add a new property in `ModConfig.cs`, using the feature name and prefix with "Enable", and defaulting to false.  For example: `public bool Enable{FeatureName} { get; set; } = false;`
* Create a Prepare() as defined in the Feature Toggle Pattern above.
* Add an entry in the MCM configuration UI in `Mcm/McmConfiguration.cs` in the `Configure()` method.  For example:
```csharp
    CreateConfigProperty(nameof(ModConfig.Enable{FeatureName}), "Enables {FeatureName summary}",
        header: "<{FeatureName friendly header text}"),
```
* If the Patch classes in the feature folder do not have Prepare() methods, add them now to check the config flag.  For example:
```csharp
        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.Enable{FeatureName}),
                Plugin.Config.Enable{FeatureName});
        }
```
* Add a `_README.md` in the feature folder documenting the feature's purpose, implementation details, and any interactions between multiple patches

### IL Patching Debugging
When writing transpilers:
1. Use `TranspileUtils.LogIL()` to dump original IL to file
2. Store reference IL in `OriginalIL/{ClassName}.il`
3. Use CodeMatcher with specific instruction patterns (see `DragController_Update_Patch` line 67-77)
4. Test that patch conditionally applies based on config flag
5. Use CodeMatcher instead of looping through instructions manually.
6. Use `typeof` and `nameof` for type/method references to avoid hardcoding strings.

## Project-Specific Conventions

### Config Persistence
- Configs stored **outside** game's AppData folder (Quasimorph syncs/overwrites that folder)
- Location: `AppData/../Quasimorph_ModConfigs/{ModName}/`
- Managed by `ConfigDirectories.cs` and `PersistentConfig<T>`
- JSON format with enum string conversion via `StringEnumConverter`

### Harmony Patch Organization
- One feature per subdirectory in `Patches/`
- Complex features (e.g., HoldToReload) may patch **multiple methods** - document interactions in `_README.md`
- Patch naming: `{TargetClass}_{TargetMethod}_Patch.cs`
- Always try-catch Harmony methods and log errors to `Plugin.Logger`
- Use one class per class method target.
- **All patches in a feature folder share the same feature flag** - all must implement `Prepare()` with identical logic

### Game-Specific Dependencies
- **Assembly-CSharp**: Main game DLL, **publicized** via `BepInEx.AssemblyPublicizer.MSBuild`
- **MCM.dll**: Optional dependency for config UI (checked at runtime)
- References resolved from `$(ManagedPath)` (auto-detected from Steam registry or fallback paths)

### Multi-Turn Command Queue Pattern
Features like HoldToReload require **multiple patches** due to Quasimorph's turn-based command queuing:
- Commands queued in advance (movement, actions)
- Patches needed at: command add, turn start, action point processing, input handling
- See `Patches/HoldToReload/_README.md` for detailed rationale

## Key Files Reference
- **Plugin.cs**: Mod initialization, version checks, Harmony `PatchAll()`
- **ModConfig.cs**: All feature flags and settings (source of truth)
- **Mcm/McmConfiguration.cs**: In-game UI configuration (mirrors ModConfig)
- **Utils/TranspileUtils.cs**: IL manipulation helpers
- **RedsOptionalTweaks.csproj**: Build configuration, Steam Workshop deployment

## Common Pitfalls
- **Forgetting `Prepare()` method** - patch will always apply even if disabled
- **Missing try-catch in `Prepare()`** - failures silently disable the patch without logging
- **Inconsistent feature flags** - all patches in a feature folder must check the same flag
- Not using `<Private>False</Private>` in references - causes DLL conflicts
- Hardcoding KeyCodes instead of using config values
- Missing error handling in `Prepare()`, `Transpiler()`, `Prefix()`, and `Postfix()` methods
- Not using the `$(ManagedPath)` variable for assembly references in the .csproj file
- Not documenting multi-patch features in `_README.md`

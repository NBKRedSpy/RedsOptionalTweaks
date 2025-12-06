# RedsOptionalTweaks - AI Coding Guide

## Project Overview
This is a **BepInEx/Harmony mod** for the game **Quasimorph**. The mod provides optional gameplay tweaks configurable through MCM (Mod Configuration Menu), using regular method patchs as well as  IL patching to modify game behavior.

## C# styles
- Follows standard C# conventions (PascalCase for types/methods, camelCase for variables)
- Uses `var` for local variable declarations when the type is obvious from the right-hand side
- Inline if with return statements for simple conditions

## Architecture

### Core Components
- **Plugin.cs**: Entry point with `[Hook(ModHookType.AfterConfigsLoaded)]` - patches applied after configs load
- **ModConfig.cs**: Feature flags and settings, serialized to `AppData/../Quasimorph_ModConfigs/{ModName}/config.json`
- **Patches/**: Feature-specific Harmony patches organized by subdirectory (HoldToReload, ImplantIndicator, RecycleHotkey, etc.)
- **Mcm/**: MCM integration for in-game configuration UI
- **Utils/**: Shared utilities for logging, transpiling, and Unity component injection

### Mod Loading Flow
1. Game calls `AfterConfig()` hook in Plugin.cs
2. Version compatibility check (min 0.9.6)
3. Config loaded from persistent folder (creates default if missing)
4. MCM configuration UI registered
5. Non-Harmony patches applied (e.g., ship speed boost via `Data.Global.DistanceToHours`)
6. Harmony patches applied via `PatchAll()`

## Critical Patterns

### Feature Toggle Pattern
**Every patch class** uses `Prepare()` to conditionally enable based on config:
```csharp
[HarmonyPatch(typeof(DragController), nameof(DragController.Update))]
public static class DragController_Update_Patch
{
    public static bool Prepare()
    {
        return Plugin.Config.EnableMouseQuickTossKey; // Feature flag from config
    }
}
```

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

### Adding New Features
1. Add feature flag to `ModConfig.cs` (with default value)
2. Create patch class in `Patches/{FeatureName}/`
3. Implement `Prepare()` method checking config flag
4. Add MCM UI entry in `Mcm/McmConfiguration.cs` `Configure()` method
5. If complex, document patch strategy in `_README.md` (see HoldToReload example)

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
- Forgetting `Prepare()` method - patch will always apply even if disabled
- Not using `<Private>False</Private>` in references - causes DLL conflicts
- Hardcoding KeyCodes instead of using config values
- Missing error handling in `Prepare()`, `Transpiler()`, `Prefix()`, and `Postfix()` methods
- Not using the `$(ManagedPath)` variable for assembly references in the .csproj file

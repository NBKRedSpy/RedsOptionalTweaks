# Feature Force-Disable Testing Checklist

## Overview
This document contains the testing plan for the Feature Force-Disable system that allows the mod author to disable features without affecting user configurations.

## Prerequisites
- Build completes successfully
- `FeatureDisable.json` is copied to output directory (`bin/Debug/net48` or `bin/Release/net48`)
- `FeatureDisable.json` is deployed to Steam Workshop folder

## Test Cases

### 1. Missing Configuration File (Graceful Degradation)
**Steps**:
1. Delete or rename `FeatureDisable.json` from the mod's directory
2. Launch the game with the mod enabled
3. Enable a feature in MCM (e.g., `EnableHoldToReload`)
4. Test the feature works normally

**Expected Result**:
- Warning logged about missing `FeatureDisable.json`
- All features work according to user's config settings
- No crashes or errors

### 2. All Features Allowed (Default State)
**Setup**: Set all properties in `FeatureDisable.json` to `true`

**Steps**:
1. Enable multiple features in MCM
2. Test each feature functions correctly

**Expected Result**:
- All features work according to user's saved preferences
- No behavior changes from normal operation

### 3. Force-Disable Single Feature
**Setup**: Set `EnableHoldToReload: false` in `FeatureDisable.json`, leave others at `true`

**Steps**:
1. In MCM, enable `EnableHoldToReload` 
2. Save configuration
3. Restart or reload mod
4. Verify user's `config.json` shows `EnableHoldToReload: true`
5. Test holding reload key in-game

**Expected Result**:
- Hold-to-reload functionality does NOT work
- User's `config.json` still shows `EnableHoldToReload: true` (unchanged)
- MCM shows the feature as enabled
- Other features work normally

### 4. Force-Disable Multiple Features
**Setup**: Set multiple features to `false` in `FeatureDisable.json`:
```json
{
  "EnableHoldToReload": false,
  "EnableImplantIndicator": false,
  "EnableMouseQuickTossKey": false
}
```

**Steps**:
1. Enable all three features in MCM
2. Save and reload
3. Test each disabled feature

**Expected Result**:
- All force-disabled features are non-functional
- User's config file remains unchanged
- Features not listed or set to `true` work normally

### 5. Configuration Persistence Verification
**Steps**:
1. Set `EnableShipSpeedBoost: false` in `FeatureDisable.json`
2. Enable `EnableShipSpeedBoost` in MCM
3. Save configuration
4. Close game
5. Check `AppData/../Quasimorph_ModConfigs/RedsOptionalTweaks/config.json`
6. Restart game

**Expected Result**:
- User's `config.json` shows `EnableShipSpeedBoost: true`
- Feature remains disabled in-game despite saved preference
- No corruption or modification of other config values

### 6. Build Deployment Verification
**Steps**:
1. Clean build solution
2. Check `bin/Debug/net48/` for `FeatureDisable.json`
3. Check Steam Workshop folder for `FeatureDisable.json`

**Expected Result**:
- `FeatureDisable.json` present in both locations
- File contents match source file

### 7. Invalid JSON Handling
**Setup**: Corrupt `FeatureDisable.json` with invalid JSON syntax

**Steps**:
1. Break JSON syntax (e.g., remove closing brace)
2. Launch game with mod

**Expected Result**:
- Error logged about JSON parse failure
- All features default to user's config settings (no force-disables)
- No crashes

### 8. Non-Harmony Patch Verification
**Setup**: Set `EnableShipSpeedBoost: false` in `FeatureDisable.json`

**Steps**:
1. Enable `EnableShipSpeedBoost` in MCM with speed multiplier
2. Check ship travel speed in-game

**Expected Result**:
- Ship speed remains at default (boost not applied)
- Confirms non-Harmony patches also respect force-disable

### 9. Hot Reload Scenario (If Applicable)
**Steps**:
1. Start game with features enabled
2. Modify `FeatureDisable.json` to disable a feature
3. Reload mod (if supported) or restart game

**Expected Result**:
- Changes take effect on reload
- No config corruption

### 10. MCM UI Consistency Check
**Setup**: Force-disable `EnableRecycleHotkey` via `FeatureDisable.json`

**Steps**:
1. Open MCM in-game
2. Check `EnableRecycleHotkey` setting display
3. Toggle setting and save

**Expected Result**:
- MCM shows user's saved preference (may show as enabled)
- Feature remains non-functional regardless of MCM setting
- Changes to MCM setting are saved to user config but have no effect

## Performance Tests

### 11. Load Time Impact
**Steps**:
1. Measure mod load time without `FeatureDisable.json`
2. Measure mod load time with `FeatureDisable.json`

**Expected Result**:
- Negligible difference in load time (< 50ms)

### 12. Runtime Performance
**Steps**:
1. Profile frame time with multiple Harmony patches active
2. Compare with force-disabled features

**Expected Result**:
- Force-disabled features should not execute their patch logic
- No performance overhead from disabled features

## Edge Cases

### 13. Property Name Mismatch
**Setup**: Add non-existent property to `FeatureDisable.json`:
```json
{
  "EnableNonExistentFeature": false
}
```

**Steps**:
1. Load game
2. Check logs

**Expected Result**:
- Warning logged about unknown property (optional)
- No crashes or errors
- Existing features unaffected

### 14. Type Mismatch in JSON
**Setup**: Use wrong data type in `FeatureDisable.json`:
```json
{
  "EnableHoldToReload": "false"
}
```

**Steps**:
1. Launch game

**Expected Result**:
- JSON parser handles gracefully (depends on deserializer)
- Feature defaults to enabled state if parse fails
- Error logged

## Regression Tests

### 15. Existing Features Still Work
**Steps**:
1. Deploy with `FeatureDisable.json` (all `true`)
2. Test all existing features
3. Compare behavior to version without disable system

**Expected Result**:
- No functional regressions
- All features work identically to previous version

## Notes
- Test on both Debug and Release builds
- Test with Steam Workshop deployment
- Verify log output for all error conditions
- Document any unexpected behavior or edge cases discovered

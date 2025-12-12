using ModConfigMenu;
using ModConfigMenu.Contracts;
using ModConfigMenu.Implementations;
using ModConfigMenu.Objects;
using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace RedsOptionalTweaks.Mcm
{
    internal class McmConfiguration : McmConfigurationBase
    {
        private const string SplitStacksHotkeyHeader = "Split Stacks Hotkeys";

        public McmConfiguration(ModConfig config) : base (config) { }

        public override void Configure()
        {

            ModConfig defaults = new ModConfig();
            ModConfig config = (ModConfig)Config;


            List<IConfigValue> configValues =
            [
                CreateRestartMessage(),

                new ConfigValue("__NoneNote", "Any hotkey can be disabled by setting the key to 'None'", "NOTE"),

                #region Augment Indicator
                CreateConfigProperty(nameof(ModConfig.EnableImplantIndicator), "Enableds recoloring the augment indicator on the " +
                    "creature window if there is an implant.",
                    header: "Augment Indicator"),

                CreateConfigProperty(nameof(ModConfig.ImplantIndicatorColor), "The color to use for the implant indicator",
                    header: "Augment Indicator"),

                #endregion


                #region Hold to Reload
                CreateConfigProperty(nameof(ModConfig.EnableHoldToReload),
                    "Enables holding the reload key to continuously reload weapons.",
                    header: "Hold to Reload"),
                #endregion

                #region Mouse Quick Toss Rebind

                CreateConfigProperty(nameof(ModConfig.EnableMouseQuickTossKey), "Enables rebinding the mouse transfer key.",
                    header: "Mouse Quick Toss Rebind"),

                CreateEnumDropdown<KeyCode>(nameof(ModConfig.MouseQuickTossKey),
                    "The key to use to transfer items via mouse. The game uses the control key.\n" + KeyCodeAlphaNote,
                    "Mouse Quick Toss Key", "Mouse Quick Toss Rebind", sort: true),

                #endregion

                #region QMeter Visual
                CreateConfigProperty(nameof(ModConfig.EnableQMeterVisual),
                    "When in a raid, changes the QMorphos state name to yellow when above 800. This matches the music intensity change in the game at this level.",
                    header: "QMeter Visual"),
                #endregion

                #region Show Experience Maxed
                    CreateConfigProperty(nameof(ModConfig.EnableShowExpMaxed),
                    "Adds an astrisk to the Experience Gaining Item tooltip to indicate that the merc has the perk, but is already at max level",
                    header: "Show Experience Maxed"),
                #endregion

                #region Show Station Info
                CreateConfigProperty(nameof(ModConfig.EnableShowStationInfo),
                    "Enables the ability to see station trade info on mission nodes by holding Alt.",
                    header: "Show Station Info"),
                #endregion

                #region Ship Speed Boost

                CreateConfigProperty(nameof(ModConfig.EnableShipSpeedBoost),
                    "Enables a boost to ship speed.", header: "Ship Speed Boost"),

                CreateConfigProperty(nameof(ModConfig.ShipSpeedIncrease),
                    "The multiplier to increase ship speed by.  Default is 2.0x.",
                    1.0f, 20.0f, "Ship Speed Increase Multiplier", "Ship Speed Boost"),
                #endregion

                #region Stack Total Inventory Count
                CreateConfigProperty(nameof(ModConfig.EnableStackTotalInventoryCount),
                    """
                    When holding the alt key, the count on stacks will show the total amount of that item owned. 
                    This is identical to the number that is shown in the item's tooltip
                    """,
                    header: "Stack Total Inventory Count"),

                CreateEnumDropdown<KeyCode>(nameof(ModConfig.StackTotalInventoryCountKey),
                    "The key to hold to show the total inventory count on stacks.  Default is Left Alt.\n" + KeyCodeAlphaNote,
                    header: "Stack Total Inventory Count", sort: true),

                CreateConfigProperty(nameof(ModConfig.StackTotalInventoryLowCountColor),
                    "The color to use when the total amount owned for an item is below the configured threshold",
                    "Low Count Color",
                    header: "Stack Total Inventory Count"),

                CreateConfigProperty(nameof(ModConfig.StackTotalInventoryLowCountThreshold),
                    """
                    The threshold below which the total inventory count color will change to the low count color.
                    Set to zero to not change the color.
                    """,
                    0, 1000, "Low Count Threshold", "Stack Total Inventory Count"),

                #endregion

                #region Split Stacks Hotkeys
                CreateConfigProperty(nameof(ModConfig.EnableSplitStacksKeys), "Enables the hotkey functionality for splitting stacks in the context menu.",
                    header: "Split Stacks Hotkeys"),

                CreateEnumDropdown<KeyCode>(nameof(ModConfig.ReduceAmountKey),
                    "The key to decrease the split amount (move slider left).",
                    "Reduce Split Amount Key", "Split Stacks Hotkeys"),

                CreateEnumDropdown<KeyCode>(nameof(ModConfig.IncreaseAmountKey),
                    "The key to increase the split amount (move slider right).",
                    "Increase Split Amount Key", "Split Stacks Hotkeys"),

                CreateConfigProperty(nameof(ModConfig.RepeatDelaySeconds),
                    "How many seconds to wait before repeating when holding the increase/decrease keys.",
                    0.05f, 1.0f, "Split Amount Repeat Delay (seconds)", SplitStacksHotkeyHeader),
                .. CreateAmountPresets(config.AmountPresets),

                #endregion

                #region Recycle Hotkey
                CreateConfigProperty(nameof(ModConfig.EnableRecycleHotkey),
                    "Enables a hotkey to recycle items from the inventory screen.  This allows the user to hold down the recycle key " +
                    "(defaults to R) to move items directly to the recycler in the inventory screen.",
                    header: "Recycle Hotkey"),

                CreateEnumDropdown<KeyCode>(nameof(ModConfig.RecycleHotkey),
                    "The key to use to recycle items from the inventory screen.",
                    "Recycle Hotkey", "Recycle Hotkey"),

                #endregion

            ];

            string disabledItems = Plugin.DisableManager.GetDisabledItemNames();

            if(!string.IsNullOrEmpty(disabledItems))
            {
                configValues.Insert(0, new ConfigValue("__Disabled Note", $"<color=#FF0000>The following items have been temporarily disabled due to known issues:  '{disabledItems}'</color>", "Disabled"));
            }

            ModConfigMenuAPI.RegisterModConfig("Red's Optional Tweaks", configValues, OnSave);
        }

        protected override bool OnSave(Dictionary<string, object> currentConfig, out string feedbackMessage)
        {
            SetAmountPresets(currentConfig, out feedbackMessage);
            return base.OnSave(currentConfig, out feedbackMessage);

        }

        private const string PropertyPrefix = "AmountPresets_";

        /// <summary>
        /// Converts the config's amoutn presets dictionary to a list of up to 5 entries.
        /// </summary>
        /// <param name="amountPresets"></param>
        /// <returns></returns>
        private List<IConfigValue> CreateAmountPresets(List<(KeyCode Key, int Amount)> amountPresets)
        {
            List<IConfigValue> configValues = new();
            

            var presetDefaults = new ModConfig().AmountPresets;

            if(presetDefaults.Count != amountPresets.Count)
            {
                throw new ApplicationException($"The preset amounts must match the default count of {presetDefaults.Count}");
            }

            const string presetsHeader = $"{SplitStacksHotkeyHeader} - Amount Presets";

            var keycodeNames = Enum.GetNames(typeof(KeyCode)).OrderBy(x => x).ToList<object>(); 
            for (int i = 0; i < amountPresets.Count; i++)
            {

                IConfigValue dropDown = new DropdownConfig($"{PropertyPrefix}Key_{i}", amountPresets[i].Key.ToString(), presetsHeader,
                    presetDefaults[i].Key.ToString(), "The key to use this amount preset", $"Preset Key {i + 1}", keycodeNames);
                configValues.Add(dropDown);

                IConfigValue intValue = new ConfigValue($"{PropertyPrefix}Value_{i}", amountPresets[i].Amount,presetsHeader, presetDefaults[i].Amount, 
                    $"The amount for preset {i+1}", $"Preset Amount {i+1}", null,min: 1, max: 100 );
                configValues.Add(intValue); 
            }
            return configValues;
        }


        /// <summary>
        /// Sets the current config's AmmountPresets from the OnSave dictionary.
        /// </summary>
        /// <param name="currentConfig"></param>
        private bool SetAmountPresets(Dictionary<string, object> currentConfig, out string feedbackMessage)
        {

            try
            {

                List<(KeyCode Key, int Amount)> newPresets = new();
                for (int i = 0; ; i++)
                {
                    string keyProperty = $"{PropertyPrefix}Key_{i}";
                    string valueProperty = $"{PropertyPrefix}Value_{i}";
                    if (!currentConfig.ContainsKey(keyProperty) || !currentConfig.ContainsKey(valueProperty))
                    {
                        //No more presets to process.
                        break;  
                    }

                    KeyCode key = (KeyCode)Enum.Parse(typeof(KeyCode), (string)currentConfig[keyProperty]);
                    int amount = Convert.ToInt32(currentConfig[valueProperty]);
                    newPresets.Add((key, amount));
                }

                ((ModConfig)Config).AmountPresets = newPresets;
            }
            catch (Exception ex)
            {
                feedbackMessage = $"Error saving Amount Presets: {ex.Message}";
                return false;
            }

            feedbackMessage = null;
            return true;
        }


    }
}

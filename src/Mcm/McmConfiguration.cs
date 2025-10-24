﻿using HarmonyLib;
using ModConfigMenu;
using ModConfigMenu.Contracts;
using ModConfigMenu.Implementations;
using ModConfigMenu.Objects;
using System;
using System.CodeDom;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml;
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

                CreateConfigProperty(nameof(ModConfig.EnableMouseQuickTossKey), "Enables rebinding the mouse transfer key.",
                    header: "Mouse Quick Toss Rebind"),

                CreateEnumDropdown<KeyCode>(nameof(ModConfig.MouseQuickTossKey),
                    "The key to use to transfer items via mouse. The game uses the control key.\n" + KeyCodeAlphaNote,
                    "Mouse Quick Toss Key", "Mouse Quick Toss Rebind", sort: true),

                CreateConfigProperty(nameof(ModConfig.EnableShipSpeedBoost),
                    "Enables a boost to ship speed.", header: "Ship Speed Boost"),

                CreateConfigProperty(nameof(ModConfig.ShipSpeedIncrease),
                    "The multiplier to increase ship speed by.  Default is 2.0x.",
                    "Ship Speed Increase Multiplier",
                    1.0f, 20.0f, "Ship Speed Boost"),

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
                    "Split Amount Repeat Delay (seconds)",
                    0.05f, 1.0f, SplitStacksHotkeyHeader),
                .. CreateAmountPresets(config.AmountPresets),
            ];

            ModConfigMenuAPI.RegisterModConfig("Red's Misc Tweaks", configValues, OnSave);
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

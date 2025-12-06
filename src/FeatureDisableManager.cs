using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RedsOptionalTweaks
{
    /// <summary>
    /// Manages feature force-disable flags from a bundled JSON file.
    /// Allows mod author to disable features without affecting user's saved config.
    /// </summary>
    public class FeatureDisableManager
    {
        private Dictionary<string, bool> _disableFlags;
        private string _disableFilePath;

        public FeatureDisableManager(string disableFilePath)
        {
            _disableFilePath = disableFilePath;
            _disableFlags = new Dictionary<string, bool>();
        }

        /// <summary>
        /// Loads the disable flags from the JSON file.
        /// If file is missing or invalid, logs warning and defaults to no disables (all features enabled).
        /// </summary>
        public void LoadDisableFlags()
        {
            try
            {
                if (!File.Exists(_disableFilePath))
                {
                    Plugin.Logger.LogWarning($"FeatureDisable.json not found at '{_disableFilePath}'. All features will respect user config.");
                    return;
                }

                var json = File.ReadAllText(_disableFilePath);
                _disableFlags = JsonConvert.DeserializeObject<Dictionary<string, bool>>(json) ?? new Dictionary<string, bool>();

                string disabledItems = GetDisabledItemNames();

                if(!string.IsNullOrEmpty(disabledItems))
                {
                    Plugin.Logger.LogWarning($"The following features are force-disabled by the mod author: {disabledItems}");
                }
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Failed to load FeatureDisable.json. All features will respect user config.");
                _disableFlags = new Dictionary<string, bool>();
            }
        }

        /// <summary>
        /// Returns a comma-separated list of the names of all items that are currently disabled.
        /// </summary>
        /// <returns>A string containing the names of all disabled items, separated by commas. Returns an empty string if no
        /// items are disabled.</returns>
        public string GetDisabledItemNames()
        {
            var disabledItems = _disableFlags
                .Where(kv => kv.Value == false)
                .Select(kv => kv.Key)
                .ToList();
            return string.Join(", ", disabledItems);
        }

        /// <summary>
        /// Checks if a feature is force-disabled by the author.
        /// </summary>
        /// <param name="propertyName">The ModConfig property name (e.g., "EnableHoldToReload")</param>
        /// <returns>True if the feature is force-disabled, false otherwise</returns>
        public bool IsForceDisabled(string propertyName)
        {
            if (_disableFlags.TryGetValue(propertyName, out var isEnabled))
            {
                return !isEnabled; // If flag is false, feature is force-disabled
            }
            return false; // Not in dictionary = not force-disabled
        }

        /// <summary>
        /// Determines if a feature should be enabled based on author override and user config.
        /// Force-disable takes precedence over user config.
        /// </summary>
        /// <param name="propertyName">The ModConfig property name (e.g., "EnableHoldToReload")</param>
        /// <param name="configValue">The user's configured value from ModConfig</param>
        /// <returns>True if feature should be enabled, false if disabled</returns>
        public bool IsFeatureEnabled(string propertyName, bool configValue)
        {
            if (IsForceDisabled(propertyName))
            {
                return false; // Author override disables feature
            }
            return configValue; // Use user's config value
        }
    }
}

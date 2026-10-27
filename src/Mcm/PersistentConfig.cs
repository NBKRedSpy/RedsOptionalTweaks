using Newtonsoft.Json;
using System;
using System.CodeDom;
using System.IO;
using UnityEngine;
using System.Collections.Generic;
using Newtonsoft.Json.Converters;




namespace RedsOptionalTweaks.Mcm
{
    public class PersistentConfig<T> : ISave where T : PersistentConfig<T>
    {
        [JsonIgnore]
        public string ConfigPath { get; protected set; }

        /// <summary>
        /// Json Serializer Settings to use when serializing/deserializing the config.  
        /// </summary>

        public static JsonSerializerSettings SerializerSettings { get; set; } = new JsonSerializerSettings()
        {
            Converters = new List<JsonConverter>()
                {
                    new StringEnumConverter(),
                },
                ObjectCreationHandling = ObjectCreationHandling.Replace,
                Formatting = Formatting.Indented,
        };

        public PersistentConfig()
        {

        }

        public PersistentConfig(string configPath)
        {
            ConfigPath = configPath;
        }

        /// <summary>
        /// Invoked during the LoadConfig call.  Is called before any logic in LoadConfig occurs.
        /// Any config upgrade code should be implemented here.
        /// </summary>
        protected virtual void UpgradeConfig()
        {
            // Override this method to implement config upgrade logic if needed.
        }

        public T LoadConfig()
        {
            T config;

            if (File.Exists(ConfigPath))
            {
                UpgradeConfig();

                try
                {
                    string sourceJson = File.ReadAllText(ConfigPath);
                    config = JsonConvert.DeserializeObject<T>(sourceJson, SerializerSettings);
                    config.ConfigPath = ConfigPath;

                    //Add any new elements that have been added since the last mod version the user had.
                    string upgradeConfig = JsonConvert.SerializeObject(config, SerializerSettings);

                    if (upgradeConfig != sourceJson)
                    {
                        Plugin.Logger.Log("Updating config with missing elements");
                        config.Save();
                    }


                    return config;
                }
                catch (Exception ex)
                {
                    Plugin.Logger.LogError(ex, "Error parsing configuration.  Ignoring config file and using defaults");

                    //Not overwriting in case the user just made a typo.
                    config = (T)Activator.CreateInstance(typeof(T), ConfigPath);
                    return config;
                }
            }
            else
            {
                config = (T)Activator.CreateInstance(typeof(T), ConfigPath);

                string json = JsonConvert.SerializeObject(config, SerializerSettings);
                File.WriteAllText(ConfigPath, json);

                return config;
            }


        }

        public void Save()
        {
            try
            {
                string json = JsonConvert.SerializeObject(this, SerializerSettings);
                File.WriteAllText(ConfigPath, json);
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex);
            }
        }
    }
}
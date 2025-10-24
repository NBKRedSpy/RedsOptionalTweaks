using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MGSC;
using RedsOptionalTweaks.Mcm;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using UnityEngine;
using System.Runtime.CompilerServices;

namespace RedsOptionalTweaks
{
    public class ModConfig : PersistentConfig<ModConfig>
    {

        public ModConfig()
        {
            
        }

        public ModConfig(string configPath) : base(configPath) { }

        /// <summary>
        /// The Key to use to transfer items via mouse.  Game defaults to control key.
        /// </summary>
        [JsonConverter(typeof(StringEnumConverter))]
        public KeyCode MouseQuickTossKey { get; set; } = KeyCode.Mouse2;

        /// <summary>
        /// If true, enables the mouse transfer key functionality.
        /// </summary>
        public bool EnableMouseQuickTossKey { get; set; } = false;


        #region Ship Speed Boost

        public bool EnableShipSpeedBoost { get; set; } = false;

        public float ShipSpeedIncrease { get; set; } = 2.0f;
        #endregion

        #region Context Menu Split Stack Settings

        /// <summary>
        /// If true, enables the hotkey functionality for splitting stacks in the context menu.
        /// </summary>
        public bool EnableSplitStacksKeys { get; set; } = false;


        /// <summary>
        /// The presets for amounts to split via hotkey in the context menu split stack slider.
        /// </summary>
        public List<(KeyCode Key, int Amount)> AmountPresets { get; set; } = new()
            {
                new (KeyCode.Alpha1, 10),
                new (KeyCode.Alpha2, 5),
                new (KeyCode.Alpha3, 1),
                new (KeyCode.Alpha4, 1),
                new (KeyCode.Alpha5, 1)
            };

        /// <summary>
        /// Increases the split amount on the left side.
        /// </summary>
        public KeyCode ReduceAmountKey { get; set; } = KeyCode.A;

        /// <summary>
        /// Increases the split amount on the right side.   
        /// </summary>
        public KeyCode IncreaseAmountKey { get; set; } = KeyCode.D;


        /// <summary>
        /// How many times to repeat per second when holding the increase/decrease keys.
        /// </summary>
        public float RepeatDelaySeconds { get; set; } = 0.125f;   

        #endregion
      
    }
}

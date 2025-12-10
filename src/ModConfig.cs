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

        #region Hold To Reload
        /// <summary>
        /// Enables the ability to hold the reload key to continiously reload weapons while it is held.
        /// </summary>
        public bool EnableHoldToReload { get; set; } = false;
        #endregion

        public bool EnableShowExpMaxed { get; set; } = false;   


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


        #region Recycle Hotkey
        public bool EnableRecycleHotkey { get; set; }

        public KeyCode RecycleHotkey { get; set; } = KeyCode.R;

        #endregion

        #region Stack Total Inventory Count


        //TODO:  I should just change these into objects at some point and clean this up.
        //  Will need to update the MCM code to handle that.
        //  It's ugly, but works.

        /// <summary>
        /// Enables the ability to see total stacks in inventory stacks.
        /// </summary>
        public bool EnableStackTotalInventoryCount { get; set; }

        public KeyCode StackTotalInventoryCountKey { get; set; } = KeyCode.LeftAlt;

        public string StackTotalInventoryLowCountColor { get; set; } = "#00FF00";  //green

        /// <summary>
        /// The threshold for coloring the count to indicate there is a low amount of that resource.
        /// </summary>
        public int StackTotalInventoryLowCountThreshold { get; set; } = 20;    

        #endregion

        #region Implant Indicator

        public bool EnableImplantIndicator { get; set; }

        public string ImplantIndicatorColor { get; set; } = "#00FF00";  //green

        [JsonIgnore]
        private Color _implantIndicatorUnityColor;


        /// <summary>
        /// Translates the hex based color required by MCM to a Unity color.
        /// </summary>
        [JsonIgnore]
        public Color ImplantIndicatorUnityColor
        {
            get { 
                if(_implantIndicatorUnityColor == default)
                {
                    if (ColorUtility.TryParseHtmlString(ImplantIndicatorColor, out Color color))
                    {
                        _implantIndicatorUnityColor = color;
                    }
                    else
                    {
                        Plugin.Logger.Log($"Unable to parse color {ImplantIndicatorColor}");
                    }
                }

                return _implantIndicatorUnityColor;
            }
        }

        #endregion


        public ModConfig()
        {

        }

        public ModConfig(string configPath) : base(configPath) { }

    }
}

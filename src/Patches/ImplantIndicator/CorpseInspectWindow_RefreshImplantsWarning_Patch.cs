using HarmonyLib;
using MGSC;
using RedsOptionalTweaks.Patches.RecycleHotkey;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.ImplantIndicator
{
    /// <summary>
    /// Recolors the implant dot to green if there is at least one implant installed.
    /// Handles the coloring if the creature is dead (corpse window).
    /// </summary>
    internal static class CorpseInspectWindow_RefreshImplantsWarning_Patch
    {

        private static Color DefaultColor { get; set; } = Color.black;


        public static bool Prepare()
        {
            return Plugin.Config.EnableAugmentIndicator;
        }

        /// <summary>
        /// Attaches the Recycling hotkey functionality to the Arsenal screen.
        /// </summary>

        [HarmonyPatch(typeof(CorpseInspectWindow), nameof(CorpseInspectWindow.RefreshImplantsWarning))]
        public static class ScreenWithShipCargo_Configure_Patch
        {
            public static void Postfix(CorpseInspectWindow __instance)
            {
                bool hasImplants = AugmentationSystem.HasAnyInstalledImplants(__instance._corpseStorage.CreatureData);

                if (DefaultColor == Color.black)
                {
                   DefaultColor = __instance._implantsWarning.color;
                }
                __instance._implantsWarning.color = hasImplants ? Plugin.Config.ImplantIndicatorUnityColor : DefaultColor;
            }
        }
    }
}

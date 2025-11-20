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
    internal static class MonsterInspectWindow_RefreshImplantsWarning_Patch
    {

        private static Color DefaultColor { get; set; } = Color.black;

        /// <summary>
        /// Attaches the Recycling hotkey functionality to the Arsenal screen.
        /// </summary>

        [HarmonyPatch(typeof(MonsterInspectWindow), nameof(MonsterInspectWindow.RefreshImplantsWarning))]
        public static class ScreenWithShipCargo_Configure_Patch
        {
            public static void Postfix(MonsterInspectWindow __instance)
            {
                bool hasImplants = AugmentationSystem.HasAnyInstalledImplants(__instance._inspectedCreature.CreatureData);

                if (DefaultColor == Color.black)
                {
                   DefaultColor = __instance._implantsWarning.color;
                }
                __instance._implantsWarning.color = hasImplants ? Color.green : DefaultColor;
            }
        }
    }
}

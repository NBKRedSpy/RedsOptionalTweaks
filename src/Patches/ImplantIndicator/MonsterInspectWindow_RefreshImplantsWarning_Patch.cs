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
    /// Handles the coloring if the creature is alive.
    /// </summary>

    [HarmonyPatch(typeof(MonsterInspectWindow), nameof(MonsterInspectWindow.RefreshImplantsWarning))]
    public static class MonsterInspectWindow_RefreshImplantsWarning_Patch
    {
        private static Color DefaultColor { get; set; } = Color.black;

        public static bool Prepare()
        {

            try
            {
                return Plugin.Config.EnableImplantIndicator;
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Error in MonsterInspectWindow.RefreshImplantsWarning.Prepare");
                return false;
            }
        }

        public static void Postfix(MonsterInspectWindow __instance)
        {
            try
            {

                bool hasImplants = AugmentationSystem.HasAnyInstalledImplants(__instance._inspectedCreature.CreatureData);

                if (DefaultColor == Color.black)
                {
                    DefaultColor = __instance._implantsWarning.color;
                }

                __instance._implantsWarning.color = hasImplants ? Plugin.Config.ImplantIndicatorUnityColor : DefaultColor;

            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Error in MonsterInspectWindow.RefreshImplantsWarning.Postfix");
            }

        }
    }
}

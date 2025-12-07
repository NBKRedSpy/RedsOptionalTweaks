using HarmonyLib;
using MGSC;
using RedsOptionalTweaks.Patches.RecycleHotkey;
using RedsOptionalTweaks.Utils;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;

namespace RedsOptionalTweaks.Patches.ImplantIndicator
{

    /// <summary>
    /// Recolors the implant dot to green if there is at least one implant installed.
    /// Handles the coloring if the creature is alive.
    /// </summary>
    /// 
    //Unfortunately, unlike HarmonyX, HarmonyLib does not support multiple targets via attributes.
    //  The commented out attributes is to make harmony text searches easier when maintaining the mod.
    //
    //[HarmonyPatch(typeof(MonsterInspectWindow), nameof(MonsterInspectWindow.RefreshImplantsWarning))]
    //[HarmonyPatch(typeof(CorpseInspectWindow), nameof(CorpseInspectWindow.RefreshImplantsWarning))]

    [HarmonyPatch]
    public static class Multiple_RefreshImplantsWarning_Patch
    {
        private static Color DefaultColor { get; set; } = Color.black;

        public static bool Prepare()
        {
            try
            {
                return Plugin.DisableManager.IsFeatureEnabled(
                    nameof(ModConfig.EnableImplantIndicator),
                    Plugin.Config.EnableImplantIndicator);
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Error in MonsterInspectWindow.RefreshImplantsWarning.Prepare");
                return false;
            }
        }

        /// <summary>
        /// Unfortunately, unlike HarmonyX, HarmonyLib does not support multiple targets via attributes.
        /// </summary>
        /// <returns></returns>
        static IEnumerable<MethodBase> TargetMethods()
        {

            yield return (MethodBase)AccessTools.Method(typeof(CorpseInspectWindow), nameof(CorpseInspectWindow.RefreshImplantsWarning));
            yield return AccessTools.Method(typeof(MonsterInspectWindow), nameof(MonsterInspectWindow.RefreshImplantsWarning));
        }

        
        private static MaskedSprite MaskedSprite { get; set; } = null;

        /// <summary>
        /// Handles the implant indicator logic for both the CorpseInspectWindow and MonsterInspectWindow.  
        /// </summary>
        /// <param name="__instance"></param>
        public static void Postfix(object __instance)
        {
            try
            {

                CreatureData creatureData;
                Image image;

                if (__instance is CorpseInspectWindow corpseWindow)
                {
                    creatureData = corpseWindow._corpseStorage.CreatureData;
                    image = corpseWindow._implantsWarning;
                }
                else if( __instance is MonsterInspectWindow monsterWindow)
                {
                    creatureData = monsterWindow._inspectedCreature.CreatureData;
                    image = monsterWindow._implantsWarning;
                }
                else
                {
                    throw new InvalidDataException("Instance is neither CorpseInspectWindow nor MonsterInspectWindow");
                }

                bool hasImplants = AugmentationSystem.HasAnyInstalledImplants(creatureData);

                if (MaskedSprite == null)
                {
                   MaskedSprite = new MaskedSprite(image, Plugin.Config.ImplantIndicatorUnityColor);

                }

                MaskedSprite.ApplyMask(image, !hasImplants);

                return;

            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Error in MonsterInspectWindow.RefreshImplantsWarning.Postfix");
            }

        }


       
    }
}

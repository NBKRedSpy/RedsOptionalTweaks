using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RedsOptionalTweaks.Patches.MercenaryClassOutOfDate
{
    [HarmonyPatch(typeof(MercenaryClassIcon), nameof(MercenaryClassIcon.OnPointerExit))]
    public static class MercenaryClassIcon_OnPointerExit_Patch
    {
        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableShowMercenaryClassOutOfDate),
                Plugin.Config.EnableShowMercenaryClassOutOfDate);
        }

        public static void Postfix(MercenaryClassIcon __instance)
        {
            MercenaryClassIcon_Initialize_Patch.UpdateSelectionBorder(__instance, __instance._mercenary);
        }   
    }
}

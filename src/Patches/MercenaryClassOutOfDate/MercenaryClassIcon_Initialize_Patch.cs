using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using MGSC;
using UnityEngine;
using UnityEngine.UI;

namespace RedsOptionalTweaks.Patches.MercenaryClassOutOfDate
{
    [HarmonyPatch(typeof(MercenaryClassIcon), nameof(MercenaryClassIcon.Initialize))]
    public static class MercenaryClassIcon_Initialize_Patch
    {
        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableShowMercenaryClassOutOfDate),
                Plugin.Config.EnableShowMercenaryClassOutOfDate);
        }

        private static void Postfix(MercenaryClassIcon __instance, Mercenary mercenary)
        {
        
            UpdateSelectionBorder(__instance, mercenary);   
        }

        public static void UpdateSelectionBorder(MercenaryClassIcon __instance, Mercenary mercenary)
        {
            if (HasClassMismatch(mercenary))
            {
                __instance._selectionBorder.gameObject.SetActive(value: true);
            }
        }

        public static bool HasClassMismatch(Mercenary mercenary)
        {
            if (mercenary == null || mercenary.CreatureData == null || mercenary.CreatureData.Perks == null || string.IsNullOrEmpty(mercenary.MercClassId))
            {
                return false;
            }

            MercenaryClassRecord template = Data.MercenaryClasses.GetRecord(mercenary.MercClassId);
            if (Plugin.State != null)
            {
                MagnumProjects magnumProjects = Plugin.State.Get<MagnumProjects>();
                if (magnumProjects != null)
                {
                    MagnumProject project = magnumProjects.Get(mercenary.MercClassId);
                    if (project != null && project.CustomRecord is MercenaryClassRecord customClassRecord)
                    {
                        template = customClassRecord;
                    }
                }
            }

            if (template == null)
            {
                return false;
            }

            List<string> templatePerkIds = template.PerkIds ?? new List<string>();
            List<string> currentPerkIds = mercenary.CreatureData.Perks
                .Where(p => p != null && (p.PerkType == PerkType.Passive || p.PerkType == PerkType.Trigger))
                .Select(p => FormatHelper.ClearPerkGrades(p.PerkId))
                .ToList();

            if (templatePerkIds.Count == 0 && currentPerkIds.Count == 0)
            {
                return false;
            }

            if (currentPerkIds.Count != templatePerkIds.Count)
            {
                return true;
            }

            for (int i = 0; i < templatePerkIds.Count; i++)
            {
                if (FormatHelper.ClearPerkGrades(templatePerkIds[i]) != currentPerkIds[i])
                {
                    return true;
                }
            }

            return false;
        }
    }
}

using HarmonyLib;
using MGSC;
using RedsOptionalTweaks.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using System.Runtime.Remoting.Messaging;
using System.Text;
using UnityEngine;
using static HarmonyLib.Code;
using static Unity.IO.LowLevel.Unsafe.AsyncReadManagerMetrics;

namespace RedsOptionalTweaks.Patches.DurabilityDelta
{
    [HarmonyPatch(typeof(ItemTooltipBuilder), nameof(ItemTooltipBuilder.InitBreakable))]
    public static class ItemTooltipBuilder_InitBreakable_Patch
    {

        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableShowDurabilityDelta),
                Plugin.Config.EnableShowDurabilityDelta);
        }


        [CopyWarning(typeof(ItemTooltipBuilder), nameof(ItemTooltipBuilder.InitBreakable),
            "A copy and paste of the function to add a new line.")]
        public static bool Prefix(ItemTooltipBuilder __instance, BreakableItemRecord record, BreakableItemComponent breakable, 
            BreakableItemComponent breakableEquiped)
        {
            if (record.Unbreakable) return true; //Use the game's default

            //Use the game's default
            if (breakable == null) return true;  

            //This overrides the game's default tooltip.  
            //  It's the same code, but adds the delta.  And the text is centralized in the GetDurabilityText function instead of repeating.
            __instance._factory.AddPanelToTooltip().SetIcon("common_condition").LocalizeName("tooltip.Condition")
                .SetValue(GetDurabilityText(breakable).WrapInColor(Colors.DarkYellow))
                .If(breakableEquiped != null && !breakableEquiped.Unbreakable, delegate (TooltipProperty p)
                {
                    p.SetValue(GetDurabilityText(breakable).WrapInColor(Colors.AltGreen)).SetComparsionValue(GetDurabilityText(breakableEquiped).WrapInColor(Colors.DarkYellow)).Compare(breakable.Durability, breakableEquiped.Durability);
                });

            return false;
        }

        /// <summary>
        /// Creates the common durability text for the tooltip, including the delta if applicable.
        /// </summary>
        /// <param name="breakable"></param>
        /// <returns></returns>
        private static string GetDurabilityText(BreakableItemComponent breakable)
        {

            StringBuilder sb = new StringBuilder();

            sb.Append(breakable.Durability);

            if(breakable.Durability != breakable.MaxDurabilityWithPenalty)
            {
                sb.Append($"<size=6>{breakable.Durability - breakable.MaxDurabilityWithPenalty}</size> ");
            }

            sb.Append( $"/ {breakable.MaxDurabilityWithPenalty}");

            if(breakable.MaxDurabilityWithPenalty != breakable.MaxDurability)
            {
                sb.Append($"<size=6>{breakable.MaxDurabilityWithPenalty - breakable.MaxDurability}</size>");
            }

            return sb.ToString();
        }

    }
}

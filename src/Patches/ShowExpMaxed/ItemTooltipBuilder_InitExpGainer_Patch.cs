using HarmonyLib;
using MGSC;
using RedsOptionalTweaks.Utils;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.HoldToReload
{

    /// <summary>
    /// Adds an astrisk to a perk gainer tooltip for a perk that the merc has, but cannot upgrade further.
    /// The purpose is to indicate that the player that the exp gainer will have no effect if used.
    /// maxed
    /// </summary>
    [HarmonyPatch(typeof(ItemTooltipBuilder), nameof(ItemTooltipBuilder.InitExpGainer))]
    public static class ItemTooltipBuilder_InitExpGainer_Patch
    {
        public static bool Prepare()
        {

            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableShowExpMaxed),
                Plugin.Config.EnableShowExpMaxed);
        }

        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {

            var original = instructions.ToList();

            //Goal, replace the WrapInColor call with our own method call.
            // there is only one Color.wite call in this method, so we can use that to find the location.

            //Find the code below:
            //text4 = text4.WrapInColor(Colors.White);
            //IL_00dc: ldloc.s 6
            //IL_00de: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_White()
            //IL_00e3: call string MGSC.FormatHelper::WrapInColor(string, valuetype [UnityEngine.CoreModule]UnityEngine.Color)
            //IL_00e8: stloc.s 6

            //TranspileUtils.LogIL(original, @"C:\work\original.il");

            var result = new CodeMatcher(original)
                .MatchStartForward(

                    TranspileUtils.MatchVariable(OpCodes.Ldloc_S, 6, typeof(string)),
                    new CodeMatch(OpCodes.Call, AccessTools.PropertyGetter(typeof(Colors), nameof(Colors.White))),
                    new CodeMatch(OpCodes.Call, AccessTools.Method(typeof(FormatHelper), nameof(FormatHelper.WrapInColor), 
                        new[] { typeof(string), typeof(Color) }))
                )
                .ThrowIfInvalid("Unable to find the WrapInColor call")
                .Advance(1)

                //tooltip = stack 6.  Still on stack.
                // mercenary = args 2
                // PerkTag is stack 5
                .Insert(
                    CodeInstruction.LoadArgument(2), //load mercenary
                    CodeInstruction.LoadLocal(5), //load ToolTag
                    CodeInstruction.Call(() => AddMaxUpgradeAsterisk(default!, default!, default!))
                    )
                .InstructionEnumeration().ToList();


            //Utils.TranspileUtils.LogIL(result, @"C:\work\s.il");
            return result;
        }

        /// <summary>
        /// If the perk gainer's target perk for the merc is maxed, add an asterisk to the tooltip.
        /// </summary>
        /// <param name="tooltipText"></param>
        /// <param name="mercenary"></param>
        /// <param name="perkIdWithoutGrades"></param>
        /// <returns></returns>
        private static string AddMaxUpgradeAsterisk(string tooltipText, Mercenary mercenary, string perkIdWithoutGrades)
        {
            foreach (Perk perk in mercenary.CreatureData.Perks)
            {

                //Reusing the game's logic to map a PerkTag to a Perk.
                //	A perk tag indicates the perk's category like "Sharpshooter", while a perk id is a
                //	specific perk levellike "Sharpshooter_basic"

                //When a perk is upgraded, the perk changes to a different perk object (and thus id).
                //  This allows perks to add entirely new functionality on upgrade.  Usually it just adds new abilities and upgrades exist
                //  perk stats.

                //Translates the PerkId to the PerkTag.
                ParseHelper.GetGradeByPerkId(perk.PerkId, out var _, out var perkTag, out var _);
                if (perkTag == perkIdWithoutGrades)
                {
                    //Perk is found and is at max.
                    if(string.IsNullOrEmpty(perk.NextPerkId)) tooltipText += "*";
                    break;
                }
            }

            return tooltipText;
        }   
    }
}

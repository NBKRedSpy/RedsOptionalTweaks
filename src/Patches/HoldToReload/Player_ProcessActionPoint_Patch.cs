using HarmonyLib;
using MGSC;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using static HarmonyLib.Code;

namespace RedsOptionalTweaks.Patches.HoldToReload
{
    /// <summary>
    /// Handles allowing hold to reload when the player sees a monster, but skipped an action.
    /// </summary>
    [HarmonyPatch(typeof(Player), nameof(Player.ProcessActionPoint))]
    public class Player_ProcessActionPoint_Patch
    {
        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableHoldToReload),
                Plugin.Config.EnableHoldToReload);
        }

        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            var original = instructions.ToList();

            //IMPORTANT NOTE:  This only handles allowing a reload while skipping an action while
            //  the player sees a monster.  
            //  * This intentionally does not change the player stopping when an enemy is first seen for the turn.
            //  * This does not change that the game will not allow more than one square movement while a monster is seen.

            //Goal: Do not clear the queue if reload is held and the player skipped the last action

            // Replace this call with our check.  There is only one call to IsSeeMonsters in this function.
            // Original IL:
            // IL_0136: call bool MGSC.CreatureSystem::IsSeeMonsters(class MGSC.Creatures, class MGSC.MapGrid)

            var result = new CodeMatcher(original)
                .MatchEndForward(
                    CodeMatch.Calls(() => CreatureSystem.IsSeeMonsters(default,default))
                    )
                .ThrowIfInvalid("Unable to find the IsSeeMonsters call.")
                .SetInstruction(CodeInstruction.Call(typeof(Player_ProcessActionPoint_Patch), nameof(IsSeeMonstersClearQueue)))
                .InstructionEnumeration().ToList();
            return result;
        }

        private static bool IsSeeMonstersClearQueue(Creatures creatures, MapGrid mapGrid)
        {
            return !InputController.Instance.IsKey("ReloadWeapon") && CreatureSystem.IsSeeMonsters(creatures, mapGrid);
        }   
    }
}

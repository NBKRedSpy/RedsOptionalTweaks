using HarmonyLib;
using MGSC;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.HoldToReload
{

    /// <summary>
    /// Handles not clearing the command queue if the reload key is held.
    /// Targets the ReloadWeapon command section.
    /// </summary>
    [HarmonyPatch(typeof(PlayerInteractionSystem), nameof(PlayerInteractionSystem.ProcessCmd))]
    public static class PlayerInteractionSystem_ProcessCmd_Patch
    {

        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableHoldToReload),
                Plugin.Config.EnableHoldToReload);
        }

        /// <summary>
        /// Handles two areas: 
        ///     Prevent the reload command from clearing the command queue when reload is held
        /// </summary>
        /// <param name="instructions"></param>
        /// <returns></returns>
        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            var original = instructions.ToList();



            //Goal:  Change the reload section to not clear the command queue if reload is held.
            //  Replace the 'true' value with false if reload is held.

            //Original IL:
            // IL_0256: call void MGSC.PlayerInteractionSystem::Reload(class MGSC.Creatures, class MGSC.BasePickupItem)
            // // 		clearCmdQueue = true;
            // IL_025b: ldarg.s clearCmdQueue   //This is an output ref
            // IL_025d: ldc.i4.1                //Remove 
            //IL_025e: stind.i1

            var result = new CodeMatcher(original)
                .MatchEndForward(
                    //Find the Reload call.  There is only Reload() in the entire function.
                    new CodeMatch(OpCodes.Call, AccessTools.Method(typeof(PlayerInteractionSystem), 
                        nameof(PlayerInteractionSystem.Reload))),
                    //Find the clearCmdQueue set
                    new CodeMatch(OpCodes.Ldarg_S),
                    new CodeMatch(OpCodes.Ldc_I4_1)
                    )
                .ThrowIfInvalid("Unable to find the reload clear flag")
                //Replace the 'true' with the result of our method
                .SetInstruction(CodeInstruction.Call(typeof(PlayerInteractionSystem_ProcessCmd_Patch), nameof(GetClearQueueForReload)))
                .InstructionEnumeration().ToList();

            return result;
        }

        /// <summary>
        /// If the reload key is held, do not clear the command queue on reload.
        /// </summary>
        /// <param name="clearCmdQueue"></param>
        /// <returns></returns>
        public static bool GetClearQueueForReload()
        {

            InputController inputController = InputController.Instance;

            //The keyup is required or queued movement will stopped on key release.
            return !(inputController.IsKey(Plugin.ReloadCommandKey) || inputController.IsKeyUp(Plugin.ReloadCommandKey));
        }

    }
}

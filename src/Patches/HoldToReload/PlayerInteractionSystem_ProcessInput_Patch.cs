using HarmonyLib;
using MGSC;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;

namespace RedsOptionalTweaks.Patches.HoldToReload
{
    [HarmonyPatch(typeof(PlayerInteractionSystem), nameof(PlayerInteractionSystem.ProcessInput))]
    public static class PlayerInteractionSystem_ProcessInput_Patch
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


            //Goal: Handle the Skip Turn specific branch to add a reload command if reload is held.
            //There is only one SkipTurn call in the function.


            //Target IL:
            // IL_00a8: callvirt instance void MGSC.Player::SkipTurn()
            // IL_00ad: br IL_026d

            var result = new CodeMatcher(original).MatchEndForward(
                    //Find the SkipTurn call.  There is only one SkipTurn() in the entire function.
                    CodeMatch.Calls(() => new Player().SkipTurn())
                )
                .ThrowIfInvalid("Unable to find the SkipTurn call")
                .Advance(1)
                .Insert(CodeInstruction.Call(typeof(PlayerInteractionSystem_ProcessInput_Patch), nameof(PlayerInteractionSystem_ProcessInput_Patch.AddReloadCommandIfHeld)))
                .InstructionEnumeration().ToList();

            return result;
        }

        /// <summary>
        /// Adds a reload command if the reload key is held.
        /// </summary>

        private static void AddReloadCommandIfHeld()
        {
            InputController inputController = SingletonMonoBehaviour<InputController>.Instance;
            bool reloadWeapon = inputController.IsKey(Plugin.ReloadCommandKey);
            if (!reloadWeapon) return;


            PlayerCommandQueue cmdQueue = Plugin.State.Get<PlayerCommandQueue>(); 

            if (!cmdQueue._commands.Any(x => x is ReloadCurrentWeaponCommand || x is ReloadWeaponCommand))
            {
                cmdQueue.AddFirst(new ReloadWeaponCommand());
            }
        }   
    }
}

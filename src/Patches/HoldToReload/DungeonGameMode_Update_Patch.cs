using HarmonyLib;
using MGSC;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using UnityEngine;
using static UnityEngine.UI.Image;

namespace RedsOptionalTweaks.Patches.HoldToReload
{
    /// <summary>
    /// Handles not clearing the command queue if the reload key is held.
    /// There are actually two checks in this same area.  This handles the Update method only.
    /// </summary>
    [HarmonyPatch(typeof(DungeonGameMode), nameof(DungeonGameMode.Update))]
    public static class DungeonGameMode_Update_Patch
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

            try
            {

                //Goal: Change the IL to not clear the queue if the reload key is down.
                //There is only one Input.anyKeyDown in this method.
                var result = new CodeMatcher(original)
                    .MatchEndForward(
                        //new CodeMatch(OpCodes.Call,   AccessTools.Method(typeof(Input), nameof(Input.anyKeyDown)))
                        new CodeMatch(OpCodes.Call, AccessTools.PropertyGetter(typeof(Input), nameof(Input.anyKeyDown)))
                        )
                    .ThrowIfInvalid("Unable to find the key down")
                    .RemoveInstruction()
                    .Insert(CodeInstruction.Call(() => ClearQueueCheck()))
                    .InstructionEnumeration().ToList();


                //Utils.TranspileUtils.LogIL(result, @"C:\work\s.il");
                return result;

            }
            catch (System.Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Failed to transpile DungeonGameMode.Update.  Using original code instead.");
                return original;
            }
        }

        private static bool ClearQueueCheck()
        {
            return Input.anyKeyDown && !InputController.Instance.IsKey(Plugin.ReloadCommandKey);
        }
    }
}

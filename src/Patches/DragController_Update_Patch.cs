using HarmonyLib;
using MGSC;
using RedsOptionalTweaks.OriginalIL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using static HarmonyLib.Code;

namespace RedsOptionalTweaks.Patches
{


    /// <summary>
    /// Creates a patch to allow rebinding the mouse quick toss key.
    /// </summary>
    [HarmonyPatch(typeof(DragController), nameof(DragController.Update))]   
    public static class DragController_Update_Patch
    {
        public static bool Prepare()
        {
            try
            {
                return Plugin.Config.EnableMouseQuickTossKey;
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Error in DragController_Update_Patch.Prepare");
                return false;
            }
        }


        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            try
            {


                // Original IL.  Target is to replace the KeyCode.LeftControl check with a call to our custom method.
                //		// else if (SingletonMonoBehaviour<GameSettings>.Instance.FastToss && !Input.GetMouseButton(0) && !IsDragging && InputHelper.GetKey(KeyCode.LeftControl))
                //		IL_0192: br.s IL_01df
                //
                //		IL_0194: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.GameSettings>::get_Instance()
                //		IL_0199: callvirt instance bool MGSC.GameSettings::get_FastToss()
                //		IL_019e: brfalse.s IL_01df
                //
                //		IL_01a0: ldc.i4.0
                //		IL_01a1: call bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButton(int32)
                //		IL_01a6: brtrue.s IL_01df
                //
                //		// (no C# code)
                //		IL_01a8: ldarg.0
                //		IL_01a9: call instance bool MGSC.DragController::get_IsDragging()
                //		IL_01ae: brtrue.s IL_01df
                //
                //		// ItemSlot itemSlot2 = RaycastSlotUnderCursor();
                //====== Replace these two lines to use IsCustomKeyPressed instead. =======
                //		IL_01b0: ldc.i4 306
                //		IL_01b5: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)

                var codes = new List<CodeInstruction>(instructions);

                //Utils.LogIL(codes, @"c:\work\DragController_Update_OriginalIL.il");

                var results = new CodeMatcher(codes)
                    .MatchEndForward(
                        new CodeMatch(OpCodes.Call, AccessTools.PropertyGetter(typeof(SingletonMonoBehaviour<GameSettings>), nameof(SingletonMonoBehaviour<GameSettings>.Instance))),
                        new CodeMatch(OpCodes.Callvirt, AccessTools.PropertyGetter(typeof(GameSettings), nameof(GameSettings.FastToss))),
                        new CodeMatch(OpCodes.Brfalse_S),
                        new CodeMatch(OpCodes.Ldc_I4_0),
                        new CodeMatch(OpCodes.Call, AccessTools.Method(typeof(Input), nameof(Input.GetMouseButton), new[] { typeof(int) })),
                        new CodeMatch(OpCodes.Brtrue_S),
                        new CodeMatch(OpCodes.Ldarg_0),
                        new CodeMatch(OpCodes.Call, AccessTools.PropertyGetter(typeof(DragController), nameof(DragController.IsDragging))),
                        new CodeMatch(OpCodes.Brtrue_S),
                        new CodeMatch(OpCodes.Ldc_I4, 306),
                        new CodeMatch(OpCodes.Call, AccessTools.Method(typeof(InputHelper), nameof(InputHelper.GetKey), new[] { typeof(KeyCode) }))
                    )
                    .ThrowIfNotMatch("Failed to match IL pattern in DragController.Update for MouseQuickTossKey patch.")
                    .Advance(-1) // Move to ldc.i4 306
                    // Remove ldc.i4 306 (KeyCode.LeftControl)
                    .RemoveInstruction()
                    // Replace call to InputHelper.GetKey with call to IsCustomKeyPressed
                    .SetInstruction(new CodeInstruction(OpCodes.Call, AccessTools.Method(typeof(DragController_Update_Patch), "IsCustomKeyPressed")))
                    .InstructionEnumeration()
                    .ToList();


                //Utils.LogIL(results, @"c:\work\DragController_Update_TranspiledIL.il");
                return results;
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Error in DragController_Update_Patch.Transpiler");
                return instructions;
            }
        }

        private static bool IsCustomKeyPressed()
        {
            return InputHelper.GetKey(Plugin.Config.MouseQuickTossKey);
        }
    }
}

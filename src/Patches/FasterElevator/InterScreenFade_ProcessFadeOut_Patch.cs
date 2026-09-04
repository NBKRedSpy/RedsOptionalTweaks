using HarmonyLib;
using MGSC;
using System;
using System.Collections;
using TMPro;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.FasterElevator
{

    /// <summary>
    /// Alters the speed of the elevator animation to make the entry and exit faster.
    /// </summary>
    [HarmonyPatch(typeof(InteractElevator), nameof(InteractElevator.Show))]
    public static class InteractElevator_Show_Patch
    {
        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableFasterElevator),
                Plugin.Config.EnableFasterElevator);
        }

        public static void Prefix(InteractElevator __instance, ref Action finishCallback)
        {
            //NOTE - Setting the timescale from start to finish of the animation had
            //  compatibility issues.  So changing move speed to elevator and changing timescale of the
            //  elevator animation only when the animation is playing.

            // Always setting this doesn't affect anything.
            __instance.movePlayerDuration = .1f;

            // FrameAnimation can't be speed up before Unity 5.0.  Using a time hack.
            __instance.liftAnimator.OnAnimationStarted += () => { Time.timeScale = 10f; };
            __instance.liftAnimator.OnAnimationEnded += () => { Time.timeScale = 1f; };
        }
    }



}

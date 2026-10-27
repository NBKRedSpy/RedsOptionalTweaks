using HarmonyLib;
using MGSC;
using System;

namespace RedsOptionalTweaks.Patches.ShowCapsuleAmount
{
    /// <summary>
    /// Adds the amount of capsule drops that are currently available to the Call Capsule button.
    /// </summary>
    [HarmonyPatch(typeof(ManageRaidScreen), nameof(ManageRaidScreen.OnEnable))]
    public class ManageRaidScreen_OnEnable_Patch
    {

        private static string CapsuleLocalizationKey = null;

        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableShowCapsuleAmount),
                Plugin.Config.EnableShowCapsuleAmount);
        }

        public static void Postfix(ManageRaidScreen __instance)
        {

            AutonomousCapsuleDepartment department = __instance._magnumSpaceship.GetDepartment<AutonomousCapsuleDepartment>();
            if (department == null) return;

            if (String.IsNullOrEmpty(CapsuleLocalizationKey))
            {
                CapsuleLocalizationKey = __instance._capsuleButton._captionTag;
            }

            __instance._capsuleButton.SetRawCaption($"{Localization.Get(CapsuleLocalizationKey)} " +
                $"({__instance._magnumSpaceship.AutonomousCapsuleChargesCount - department._chargesOnCooldown.Count} / {__instance._magnumSpaceship.AutonomousCapsuleChargesCount})");
        }
    }


}


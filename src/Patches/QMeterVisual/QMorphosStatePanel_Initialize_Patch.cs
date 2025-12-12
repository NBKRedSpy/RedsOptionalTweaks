using HarmonyLib;
using MGSC;

namespace RedsOptionalTweaks.Patches.QMeterVisual
{

    /// <summary>
    /// Changes the name of the Qmorphos state to yellow when above 800.
    /// This is to match the music intensity change in the game when at this level.
    /// </summary>
    [HarmonyPatch(typeof(QMorphosStatePanel), nameof(QMorphosStatePanel.Initialize))]
    public class QMorphosStatePanel_Initialize_Patch
    {

        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableQMeterVisual),
                Plugin.Config.EnableQMeterVisual);
        }

        public static void Postfix(QMorphosStatePanel __instance)
        {
            //To prevent the text being added over and over.  The color tags are "<color=...>" 
            //  and currently the game does not color the TMP text.

            if (__instance._currentVal >= 800 && !__instance._stage.text.Contains("<"))
            {
                __instance._stage.text = $"{__instance._stage.text}".WrapInColor(Colors.Yellow);

                Localization.ActualizeFontAndSize(__instance._stage);

            }
        }
    }
}

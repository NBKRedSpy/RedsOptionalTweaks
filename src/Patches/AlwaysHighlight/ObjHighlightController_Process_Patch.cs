using HarmonyLib;
using MGSC;

namespace RedsOptionalTweaks.Patches.AlwaysHighlight
{
    [HarmonyPatch(typeof(ObjHighlightController), nameof(ObjHighlightController.Process))]
    public static class ObjHighlightController_Process_Patch
    {
        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableAlwaysHighlight),
                Plugin.Config.EnableAlwaysHighlight);
        }

        public static void Prefix(ObjHighlightController __instance, ref bool altPressed)
        {
            altPressed = true;

        }
    }
}

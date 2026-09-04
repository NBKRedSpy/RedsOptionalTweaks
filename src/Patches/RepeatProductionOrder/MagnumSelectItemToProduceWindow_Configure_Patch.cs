using HarmonyLib;
using MGSC;

namespace RedsOptionalTweaks.Patches.RepeatProductionOrder
{
    /// <summary>
    /// Checks if the user held down the shift key they chose to start a new production.
    /// </summary>
    [HarmonyPatch(typeof(MagnumSelectItemToProduceWindow), nameof(MagnumSelectItemToProduceWindow.Configure))]
    public class MagnumSelectItemToProduceWindow_Configure_Patch
    {

        public static bool AutoOpenPreviousRecipe = false;

        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableRepeatProductionOrder),
                Plugin.Config.EnableRepeatProductionOrder);
        }

        public static void Postfix(MagnumSelectItemToProduceWindow __instance)
        {

            AutoOpenPreviousRecipe = InputHelper.GetKey(UnityEngine.KeyCode.LeftShift);
        }
    }


}

using HarmonyLib;
using MGSC;
using UnityEngine;
using UnityEngine.EventSystems;

namespace RedsOptionalTweaks.Patches.RepeatProductionOrder
{
    /// <summary>
    /// Adds "right click to repeat" functionality to the production screen's slot.
    /// </summary>
    [HarmonyPatch(typeof(QueuedProductionPanel), nameof(QueuedProductionPanel.OnPointerClick))]
    public class QueuedProductionPanel_OnPointerClick_Patch
    {

        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableRepeatProductionOrder),
                Plugin.Config.EnableRepeatProductionOrder) && Plugin.Config.RightClickToRepeatProductionOrder;
        }

        public static void Prefix(PointerEventData eventData)
        {
            MagnumSelectItemToProduceWindow_Configure_Patch.AutoOpenPreviousRecipe |= (eventData.button == PointerEventData.InputButton.Right);
        }
    }


}

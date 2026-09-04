using HarmonyLib;
using MGSC;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace RedsOptionalTweaks.Patches.RepeatProductionOrder
{
    /// <summary>
    /// If the user held shift, the "amount" dialog will be auto opened, using the reciept that was last queued on this production line.
    [HarmonyPatch(typeof(MagnumSelectItemToProduceWindow), nameof(MagnumSelectItemToProduceWindow.Process))]
    public class MagnumSelectItemToProduceWindow_Process_Patch
    {

        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableRepeatProductionOrder),
                Plugin.Config.EnableRepeatProductionOrder);
        }

        public static void Prefix(MagnumSelectItemToProduceWindow __instance)
        {
            if (!MagnumSelectItemToProduceWindow_Configure_Patch.AutoOpenPreviousRecipe) return;

            __instance.AllReceiptsButtonOnClick(null, 1);
        }


        public static void Postfix(MagnumSelectItemToProduceWindow __instance)
        {
            if (!MagnumSelectItemToProduceWindow_Configure_Patch.AutoOpenPreviousRecipe) return;

            MagnumSelectItemToProduceWindow_Configure_Patch.AutoOpenPreviousRecipe = false;


            //Find the last queued item for this line.
            List<ProduceOrder> productionLine = __instance._magnumCargo.ItemProduceOrders[__instance._lineIndex];

            if (productionLine?.Count <= 0) return;

            string recipeId = productionLine.Last().OrderId;


            //Get the base receipt id as the UI uses the unmodified ID and then on queue, changes it to the modified version.
            recipeId = Regex.Replace(recipeId, "_custom$", "");

            int recipeIndex =  __instance._receipts.FindIndex(x => x.OutputItem == recipeId);
            
            //TODO:  Check for custom...
            if (recipeIndex < 0) return;

            //Select the recipe.  Have to call SelectReceipt first as the UI panels are dynamically allocated.
            __instance.SelectReceipt(recipeIndex);
            __instance.GetPanel(recipeIndex).OnPointerClick(null);
        }
    }


}

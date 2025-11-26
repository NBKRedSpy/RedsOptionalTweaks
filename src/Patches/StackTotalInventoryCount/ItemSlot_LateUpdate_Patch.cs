using HarmonyLib;
using MGSC;
using System;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.StackTotalInventoryCount
{
    [HarmonyPatch(typeof(ItemSlot), nameof(ItemSlot.LateUpdate))]
    public class ItemSlot_LateUpdate_Patch
    {
        public static bool Prepare()
        {
            try
            {
                return Plugin.Config.EnableStackTotalInventoryCount;
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError(ex, $"Error in ItemSlot_LateUpdate_Patch.Prepare");
                return false;
            }
        }   

        public static void Postfix(ItemSlot __instance)
        {

            if (__instance.Item is not null)
            {

                KeyCode key = Plugin.Config.StackTotalInventoryCountKey;

                //Restore original count using the game's logic.
                //COPY WARNING: ItemSlot.Initialize method code.  This if LeftAlt is identical to the code at the end of the method.
                if (Input.GetKeyUp(key))
                {
                    if (__instance.Item.Is<WeaponRecord>())
                    {
                        WeaponComponent weaponComponent = __instance.Item.Comp<WeaponComponent>();
                        __instance._count.text = ((!weaponComponent.RequireAmmo) ? string.Empty : (weaponComponent.CurrentAmmo + "/" + weaponComponent.MaxAmmo));
                    }
                    else
                    {
                        __instance._count.text = ((__instance.Item.StackCount > 1) ? __instance.Item.StackCount.ToString() : string.Empty);
                    }
                }
                else if (Input.GetKey(key))
                {
                    State state = Bootstrap._state;
                    int count = ItemInteractionSystem.Count(state.Get<Mercenaries>(), state.Get<MagnumCargo>(), __instance.Item.Id);
                    __instance._count.text = count.ToString();

                    Localization.ActualizeFontAndSize(__instance._count, TextContext.SmallNumbers);
                }
            }

        }
    }
}

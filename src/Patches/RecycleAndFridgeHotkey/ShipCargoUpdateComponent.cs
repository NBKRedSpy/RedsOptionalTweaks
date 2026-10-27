using MGSC;
using RedsOptionalTweaks.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.RecycleAndFridgeHotkey
{
    /// <summary>
    /// Moves items to the recycler when the hotkey is pressed.
    /// </summary>
    internal class ShipCargoUpdateComponent: UpdateComponent<ScreenWithShipCargo>
    {
        static ShipCargoUpdateComponent()
        {
            InternalComponentId = "ShipCargoUpdateComponent";
        }

        public override void Update()
        {
            try
            {

                if(!Input.anyKey || Plugin.State.Get<SpaceGameMode>() == null || UI.Drag.IsDragging) return;

                //Check for hot key and only run in space mode.
                MagnumCargo magnumCargo = Plugin.State.Get<MagnumCargo>();

                if (magnumCargo == null) return;

                ItemStorage targetStorage = null;

                //There isn't an existing method to check if a tab/storage is available.
                //  The tab is just not shown.
                if (InputHelper.GetKey(Plugin.Config.RecycleHotkey))
                {
                    targetStorage = magnumCargo.RecyclingStorage;
                    if (targetStorage == null || !Plugin.State.Get<MagnumProgression>().HasStoreConstructorDepartment ||
                        magnumCargo.RecyclingInProgress) return;  //Recycler not available.

                }
                else if (InputHelper.GetKey(Plugin.Config.FreezerHotkey))
                {
                    targetStorage = magnumCargo.FridgeStorage;
                    if (targetStorage == null || !Plugin.State.Get<MagnumProgression>().HasStoreFridge) return;  //Recycler not available.
                }
                else
                {
                    return;
                }


                DragController drag = UI.Drag;

                if (drag.IsDragging)
                {
                    drag.EndDrag();
                    return;
                }
                
                ItemSlot itemSlot = drag.RaycastSlotUnderCursor();

                //No item or the item is already in the target storage.
                if (itemSlot == null || itemSlot.Storage == targetStorage) return;

                MoveItem(itemSlot.Item, targetStorage);
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError($"Error in ShipCargoUpdateComponent.Update: {ex}");
            }
        }

        private void MoveItem(BasePickupItem item, ItemStorage itemStorage)
        {

            //Currently only protects against recycling a quest item.
            if (!Component.CanDropItemInStorage(item, itemStorage))
            {
                return;
            }

            bool placed = false;

            if (itemStorage.TryPutItem(item, CellPosition.Zero))
            {
                placed = true;
            }

            if (!placed && itemStorage != Component._magnumCargo.FridgeStorage)
            {
                itemStorage.ExpandHeightAndPutItem(item);
                placed = true;
            }

            if(placed)
            {
                Component.RefreshView();
            }
        }
    }
}

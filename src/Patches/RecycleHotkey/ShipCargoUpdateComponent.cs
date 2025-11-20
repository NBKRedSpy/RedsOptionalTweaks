using MGSC;
using RedsOptionalTweaks.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.RecycleHotkey
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
                //Check for hot key and only run in space mode.
                if (!Input.GetKey(Plugin.Config.RecycleHotkey) || Plugin.State.Get<SpaceGameMode>() == null) return;

                MagnumCargo magnumCargo = Plugin.State.Get<MagnumCargo>();

                if (magnumCargo == null) return;

                ItemStorage recycler = magnumCargo.RecyclingStorage;

                if (recycler == null || !Plugin.State.Get<MagnumProgression>().HasStoreConstructorDepartment ||
                    magnumCargo.RecyclingInProgress) return;  //Recycler not available.

                DragController drag = UI.Drag;

                if (drag.IsDragging)
                {
                    drag.EndDrag();
                    return;
                }
                
                ItemSlot itemSlot = drag.RaycastSlotUnderCursor();

                //No item or the item is already in the recycler.
                if (itemSlot == null || itemSlot.Storage == recycler) return;


                BasePickupItem item = itemSlot.Item;
                itemSlot.Item = null;

                //Debug - I don't think this is required any more..
                itemSlot.Storage.Remove(itemSlot.Item);

                //SoundController_PlayUiSound__Patch.DisableSound = true;

                recycler.ExpandHeightAndPutItem(item);

                //SoundController_PlayUiSound__Patch.DisableSound = false;

                drag._refreshCallback?.Invoke();

                //The game code does this.  It has something to do with canceling or resetting a drag and drop that is in progress.
                drag._clickTimer.Pause();
            }
            catch (Exception ex)
            {
                Plugin.Logger.LogError($"Error in ShipCargoUpdateComponent.Update: {ex}");
            }
        }
    }
}

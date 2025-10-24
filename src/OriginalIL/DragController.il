.class public auto ansi beforefieldinit MGSC.DragController
	extends [UnityEngine.CoreModule]UnityEngine.MonoBehaviour
{
	// Fields
	.field private static literal float32 DOUBLECLICK_MAX_DURATION = float32(0.12)
	.field private class [UnityEngine.CoreModule]UnityEngine.RectTransform _dragTarget
	.custom instance void [UnityEngine.CoreModule]UnityEngine.SerializeField::.ctor() = (
		01 00 00 00
	)
	.field private class [UnityEngine.UI]UnityEngine.UI.Image _dragItemIcon
	.custom instance void [UnityEngine.CoreModule]UnityEngine.SerializeField::.ctor() = (
		01 00 00 00
	)
	.field private float32 _takeItemPauseAfter
	.custom instance void [UnityEngine.CoreModule]UnityEngine.SerializeField::.ctor() = (
		01 00 00 00
	)
	.field private initonly class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> _raycastResultsCache
	.field private initonly class MGSC.Timer _clickTimer
	.field private initonly class MGSC.Timer _pauseTimer
	.field private bool _isActive
	.field private valuetype MGSC.DragMode _dragMode
	.field private valuetype MGSC.DragReloadMode _reloadMode
	.field private class MGSC.SpaceTime _spaceTime
	.field private class [UnityEngine.CoreModule]UnityEngine.RectTransform _screenRoot
	.field private class [UnityEngine.UI]UnityEngine.UI.GraphicRaycaster _raycaster
	.field private class MGSC.Mercenary _mercenary
	.field private class MGSC.PerkFactory _perkFactory
	.field private class MGSC.BasePickupItem _draggableItem
	.field private class MGSC.ItemSlot _slotUnderCursorWhenMouseDown
	.field private class MGSC.ItemStorage _lastStorage
	.field private valuetype MGSC.CellPosition _specPosition
	.field private float32 _pauseDuration
	.field private class [mscorlib]System.Action _refreshCallback
	.field private class [mscorlib]System.Action`1<class MGSC.BasePickupItem> _dropOutsideCallback
	.field private class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> _interactionCallback
	.field private class [mscorlib]System.Action`1<class MGSC.ItemSlot> _controlClickCallback
	.field private class [mscorlib]System.Action`1<class MGSC.ItemSlot> _showContextMenuCallback
	.field private class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemStorage> _shiftClickToStorageCallback
	.field private class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemTab> _shiftClickToTabCallback
	.field private class [mscorlib]System.Func`1<bool> _canBeginDragCallback
	.field private class MGSC.ItemSlot '<SlotUnderCursor>k__BackingField'
	.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)

	// Methods
	.method public hidebysig specialname 
		instance bool get_IsDragging () cil managed 
	{
		// Method begins at RVA 0xc5fdf
		// Header size: 1
		// Code size: 10 (0xa)
		.maxstack 8

		// return _dragMode != DragMode.None;
		IL_0000: ldarg.0
		IL_0001: ldfld valuetype MGSC.DragMode MGSC.DragController::_dragMode
		IL_0006: ldc.i4.0
		IL_0007: cgt.un
		IL_0009: ret
	} // end of method DragController::get_IsDragging

	.method public hidebysig specialname 
		instance class MGSC.BasePickupItem get_DraggableItem () cil managed 
	{
		// Method begins at RVA 0xc5fea
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		// return _draggableItem;
		IL_0000: ldarg.0
		IL_0001: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0006: ret
	} // end of method DragController::get_DraggableItem

	.method public hidebysig specialname 
		instance class MGSC.ItemSlot get_SlotUnderCursor () cil managed 
	{
		.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0xc5ff2
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		// return <SlotUnderCursor>k__BackingField;
		IL_0000: ldarg.0
		IL_0001: ldfld class MGSC.ItemSlot MGSC.DragController::'<SlotUnderCursor>k__BackingField'
		IL_0006: ret
	} // end of method DragController::get_SlotUnderCursor

	.method private hidebysig specialname 
		instance void set_SlotUnderCursor (
			class MGSC.ItemSlot 'value'
		) cil managed 
	{
		.custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
			01 00 00 00
		)
		// Method begins at RVA 0xc5ffa
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// <SlotUnderCursor>k__BackingField = value;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class MGSC.ItemSlot MGSC.DragController::'<SlotUnderCursor>k__BackingField'
		// }
		IL_0007: ret
	} // end of method DragController::set_SlotUnderCursor

	.method public hidebysig 
		instance void Initialize (
			class [UnityEngine.CoreModule]UnityEngine.RectTransform screenRoot,
			class [UnityEngine.UI]UnityEngine.UI.GraphicRaycaster raycaster
		) cil managed 
	{
		// Method begins at RVA 0xc6003
		// Header size: 1
		// Code size: 15 (0xf)
		.maxstack 8

		// _screenRoot = screenRoot;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [UnityEngine.CoreModule]UnityEngine.RectTransform MGSC.DragController::_screenRoot
		// _raycaster = raycaster;
		IL_0007: ldarg.0
		IL_0008: ldarg.2
		IL_0009: stfld class [UnityEngine.UI]UnityEngine.UI.GraphicRaycaster MGSC.DragController::_raycaster
		// }
		IL_000e: ret
	} // end of method DragController::Initialize

	.method public hidebysig 
		instance void Enable (
			class MGSC.SpaceTime spaceTime,
			class MGSC.Mercenary mercenary,
			class MGSC.PerkFactory perkFactory,
			valuetype MGSC.DragReloadMode reloadMode
		) cil managed 
	{
		// Method begins at RVA 0xc6013
		// Header size: 1
		// Code size: 37 (0x25)
		.maxstack 8

		// _isActive = true;
		IL_0000: ldarg.0
		IL_0001: ldc.i4.1
		IL_0002: stfld bool MGSC.DragController::_isActive
		// _spaceTime = spaceTime;
		IL_0007: ldarg.0
		IL_0008: ldarg.1
		IL_0009: stfld class MGSC.SpaceTime MGSC.DragController::_spaceTime
		// _mercenary = mercenary;
		IL_000e: ldarg.0
		IL_000f: ldarg.2
		IL_0010: stfld class MGSC.Mercenary MGSC.DragController::_mercenary
		// _perkFactory = perkFactory;
		IL_0015: ldarg.0
		IL_0016: ldarg.3
		IL_0017: stfld class MGSC.PerkFactory MGSC.DragController::_perkFactory
		// _reloadMode = reloadMode;
		IL_001c: ldarg.0
		IL_001d: ldarg.s reloadMode
		IL_001f: stfld valuetype MGSC.DragReloadMode MGSC.DragController::_reloadMode
		// }
		IL_0024: ret
	} // end of method DragController::Enable

	.method public hidebysig 
		instance void Disable () cil managed 
	{
		// Method begins at RVA 0xc603c
		// Header size: 12
		// Code size: 105 (0x69)
		.maxstack 2

		// _isActive = false;
		IL_0000: ldarg.0
		IL_0001: ldc.i4.0
		IL_0002: stfld bool MGSC.DragController::_isActive
		// _spaceTime = null;
		IL_0007: ldarg.0
		IL_0008: ldnull
		IL_0009: stfld class MGSC.SpaceTime MGSC.DragController::_spaceTime
		// _mercenary = null;
		IL_000e: ldarg.0
		IL_000f: ldnull
		IL_0010: stfld class MGSC.Mercenary MGSC.DragController::_mercenary
		// _perkFactory = null;
		IL_0015: ldarg.0
		IL_0016: ldnull
		IL_0017: stfld class MGSC.PerkFactory MGSC.DragController::_perkFactory
		// if (IsDragging)
		IL_001c: ldarg.0
		IL_001d: call instance bool MGSC.DragController::get_IsDragging()
		IL_0022: brfalse.s IL_0030

		// ReturnToOriginalStorage();
		IL_0024: ldarg.0
		IL_0025: call instance void MGSC.DragController::ReturnToOriginalStorage()
		// ResetDragState();
		IL_002a: ldarg.0
		IL_002b: call instance void MGSC.DragController::ResetDragState()

		// SetDropOutsideCallback(null);
		IL_0030: ldarg.0
		IL_0031: ldnull
		IL_0032: call instance void MGSC.DragController::SetDropOutsideCallback(class [mscorlib]System.Action`1<class MGSC.BasePickupItem>)
		// SetRefreshCallback(null);
		IL_0037: ldarg.0
		IL_0038: ldnull
		IL_0039: call instance void MGSC.DragController::SetRefreshCallback(class [mscorlib]System.Action)
		// SetInteractionCallback(null);
		IL_003e: ldarg.0
		IL_003f: ldnull
		IL_0040: call instance void MGSC.DragController::SetInteractionCallback(class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>)
		// SetCanBeginDragCallback(null);
		IL_0045: ldarg.0
		IL_0046: ldnull
		IL_0047: call instance void MGSC.DragController::SetCanBeginDragCallback(class [mscorlib]System.Func`1<bool>)
		// SetControlClickCallback(null);
		IL_004c: ldarg.0
		IL_004d: ldnull
		IL_004e: call instance void MGSC.DragController::SetControlClickCallback(class [mscorlib]System.Action`1<class MGSC.ItemSlot>)
		// SetShowContextMenuCallback(null);
		IL_0053: ldarg.0
		IL_0054: ldnull
		IL_0055: call instance void MGSC.DragController::SetShowContextMenuCallback(class [mscorlib]System.Action`1<class MGSC.ItemSlot>)
		// SetShiftClickToStorageCallback(null);
		IL_005a: ldarg.0
		IL_005b: ldnull
		IL_005c: call instance void MGSC.DragController::SetShiftClickToStorageCallback(class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemStorage>)
		// SetShiftClickToTabCallback(null);
		IL_0061: ldarg.0
		IL_0062: ldnull
		IL_0063: call instance void MGSC.DragController::SetShiftClickToTabCallback(class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemTab>)
		// }
		IL_0068: ret
	} // end of method DragController::Disable

	.method public hidebysig 
		instance void SetDropOutsideCallback (
			class [mscorlib]System.Action`1<class MGSC.BasePickupItem> callback
		) cil managed 
	{
		// Method begins at RVA 0xc60b1
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// _dropOutsideCallback = callback;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [mscorlib]System.Action`1<class MGSC.BasePickupItem> MGSC.DragController::_dropOutsideCallback
		// }
		IL_0007: ret
	} // end of method DragController::SetDropOutsideCallback

	.method public hidebysig 
		instance void SetRefreshCallback (
			class [mscorlib]System.Action callback
		) cil managed 
	{
		// Method begins at RVA 0xc60ba
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// _refreshCallback = callback;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		// }
		IL_0007: ret
	} // end of method DragController::SetRefreshCallback

	.method public hidebysig 
		instance void SetInteractionCallback (
			class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> callback
		) cil managed 
	{
		// Method begins at RVA 0xc60c3
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// _interactionCallback = callback;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		// }
		IL_0007: ret
	} // end of method DragController::SetInteractionCallback

	.method public hidebysig 
		instance void SetCanBeginDragCallback (
			class [mscorlib]System.Func`1<bool> callback
		) cil managed 
	{
		// Method begins at RVA 0xc60cc
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// _canBeginDragCallback = callback;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [mscorlib]System.Func`1<bool> MGSC.DragController::_canBeginDragCallback
		// }
		IL_0007: ret
	} // end of method DragController::SetCanBeginDragCallback

	.method public hidebysig 
		instance void SetControlClickCallback (
			class [mscorlib]System.Action`1<class MGSC.ItemSlot> callback
		) cil managed 
	{
		// Method begins at RVA 0xc60d5
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// _controlClickCallback = callback;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [mscorlib]System.Action`1<class MGSC.ItemSlot> MGSC.DragController::_controlClickCallback
		// }
		IL_0007: ret
	} // end of method DragController::SetControlClickCallback

	.method public hidebysig 
		instance void SetShowContextMenuCallback (
			class [mscorlib]System.Action`1<class MGSC.ItemSlot> callback
		) cil managed 
	{
		// Method begins at RVA 0xc60de
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// _showContextMenuCallback = callback;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [mscorlib]System.Action`1<class MGSC.ItemSlot> MGSC.DragController::_showContextMenuCallback
		// }
		IL_0007: ret
	} // end of method DragController::SetShowContextMenuCallback

	.method public hidebysig 
		instance void SetShiftClickToStorageCallback (
			class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemStorage> callback
		) cil managed 
	{
		// Method begins at RVA 0xc60e7
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// _shiftClickToStorageCallback = callback;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemStorage> MGSC.DragController::_shiftClickToStorageCallback
		// }
		IL_0007: ret
	} // end of method DragController::SetShiftClickToStorageCallback

	.method public hidebysig 
		instance void SetShiftClickToTabCallback (
			class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemTab> callback
		) cil managed 
	{
		// Method begins at RVA 0xc60f0
		// Header size: 1
		// Code size: 8 (0x8)
		.maxstack 8

		// _shiftClickToTabCallback = callback;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemTab> MGSC.DragController::_shiftClickToTabCallback
		// }
		IL_0007: ret
	} // end of method DragController::SetShiftClickToTabCallback

	.method public hidebysig 
		instance void SlotClicked (
			class MGSC.ItemSlot itemSlot,
			[out] bool& interrupt
		) cil managed 
	{
		// Method begins at RVA 0xc60f9
		// Header size: 1
		// Code size: 32 (0x20)
		.maxstack 8

		// interrupt = false;
		IL_0000: ldarg.2
		IL_0001: ldc.i4.0
		IL_0002: stind.i1
		// if (IsDragging)
		IL_0003: ldarg.0
		IL_0004: call instance bool MGSC.DragController::get_IsDragging()
		IL_0009: brfalse.s IL_001f

		// interrupt = true;
		IL_000b: ldarg.2
		IL_000c: ldc.i4.1
		IL_000d: stind.i1
		// itemSlot?.OnPointerMove(null);
		IL_000e: ldarg.1
		IL_000f: brfalse.s IL_0018

		IL_0011: ldarg.1
		IL_0012: ldnull
		IL_0013: call instance void MGSC.ItemSlot::OnPointerMove(class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData)

		// EndDrag(itemSlot);
		IL_0018: ldarg.0
		IL_0019: ldarg.1
		IL_001a: call instance void MGSC.DragController::EndDrag(class MGSC.ItemSlot)

		// }
		IL_001f: ret
	} // end of method DragController::SlotClicked

	.method public hidebysig 
		instance void TabClicked (
			class MGSC.ItemTab itemTab,
			[out] bool& interrupt
		) cil managed 
	{
		// Method begins at RVA 0xc611c
		// Header size: 12
		// Code size: 255 (0xff)
		.maxstack 4
		.locals init (
			[0] class MGSC.ItemStorage
		)

		// interrupt = false;
		IL_0000: ldarg.2
		IL_0001: ldc.i4.0
		IL_0002: stind.i1
		// if (!IsDragging)
		IL_0003: ldarg.0
		IL_0004: call instance bool MGSC.DragController::get_IsDragging()
		IL_0009: brtrue.s IL_000c

		// }
		IL_000b: ret

		// interrupt = true;
		IL_000c: ldarg.2
		IL_000d: ldc.i4.1
		IL_000e: stind.i1
		// ItemStorage lastStorage = _lastStorage;
		IL_000f: ldarg.0
		IL_0010: ldfld class MGSC.ItemStorage MGSC.DragController::_lastStorage
		IL_0015: stloc.0
		// if (itemTab.DropItemInTab(_draggableItem))
		IL_0016: ldarg.1
		IL_0017: ldarg.0
		IL_0018: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_001d: callvirt instance bool MGSC.ItemTab::DropItemInTab(class MGSC.BasePickupItem)
		IL_0022: brfalse IL_00c7

		// if (InputHelper.GetKey(KeyCode.LeftShift) && !InputHelper.GetKey(KeyCode.LeftControl))
		IL_0027: ldc.i4 304
		IL_002c: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_0031: brfalse.s IL_0082

		IL_0033: ldc.i4 306
		IL_0038: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_003d: brtrue.s IL_0082

		// _shiftClickToTabCallback?.Invoke(_draggableItem.Id, lastStorage, itemTab);
		IL_003f: ldarg.0
		IL_0040: ldfld class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemTab> MGSC.DragController::_shiftClickToTabCallback
		IL_0045: dup
		IL_0046: brtrue.s IL_004b

		// (no C# code)
		IL_0048: pop
		IL_0049: br.s IL_005d

		IL_004b: ldarg.0
		IL_004c: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0051: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_0056: ldloc.0
		IL_0057: ldarg.1
		// _interactionCallback?.Invoke(InventoryInteractionType.ShiftClick);
		IL_0058: callvirt instance void class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemTab>::Invoke(!0, !1, !2)

		IL_005d: ldarg.0
		IL_005e: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_0063: dup
		IL_0064: brtrue.s IL_0069

		// (no C# code)
		IL_0066: pop
		IL_0067: br.s IL_006f

		IL_0069: ldc.i4.8
		// _refreshCallback?.Invoke();
		IL_006a: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_006f: ldarg.0
		IL_0070: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_0075: dup
		IL_0076: brtrue.s IL_007b

		// (no C# code)
		IL_0078: pop
		IL_0079: br.s IL_0094

		IL_007b: callvirt instance void [mscorlib]System.Action::Invoke()
		// _interactionCallback?.Invoke(InventoryInteractionType.DropInTab);
		IL_0080: br.s IL_0094

		IL_0082: ldarg.0
		IL_0083: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_0088: dup
		IL_0089: brtrue.s IL_008e

		// (no C# code)
		IL_008b: pop
		IL_008c: br.s IL_0094

		IL_008e: ldc.i4.6
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_008f: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_0094: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0099: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_009e: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_00a3: ldc.i4.1
		IL_00a4: ldarg.0
		IL_00a5: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_00aa: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// _refreshCallback?.Invoke();
		IL_00af: ldarg.0
		IL_00b0: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_00b5: dup
		IL_00b6: brtrue.s IL_00bb

		// (no C# code)
		IL_00b8: pop
		IL_00b9: br.s IL_00c0

		// ResetDragState();
		IL_00bb: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_00c0: ldarg.0
		IL_00c1: call instance void MGSC.DragController::ResetDragState()
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
		IL_00c6: ret

		IL_00c7: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_00cc: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_00d1: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
		IL_00d6: ldc.i4.0
		IL_00d7: ldc.r4 0.0
		IL_00dc: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// ReturnToOriginalStorage();
		IL_00e1: ldarg.0
		IL_00e2: call instance void MGSC.DragController::ReturnToOriginalStorage()
		// _refreshCallback?.Invoke();
		IL_00e7: ldarg.0
		IL_00e8: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_00ed: dup
		IL_00ee: brtrue.s IL_00f3

		// (no C# code)
		IL_00f0: pop
		IL_00f1: br.s IL_00f8

		// ResetDragState();
		IL_00f3: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_00f8: ldarg.0
		IL_00f9: call instance void MGSC.DragController::ResetDragState()
		// (no C# code)
		IL_00fe: ret
	} // end of method DragController::TabClicked

	.method public hidebysig 
		instance void ManualSlotInteract (
			class MGSC.ItemSlot itemSlot
		) cil managed 
	{
		// Method begins at RVA 0xc6227
		// Header size: 1
		// Code size: 18 (0x12)
		.maxstack 8

		// _showContextMenuCallback?.Invoke(itemSlot);
		IL_0000: ldarg.0
		IL_0001: ldfld class [mscorlib]System.Action`1<class MGSC.ItemSlot> MGSC.DragController::_showContextMenuCallback
		IL_0006: dup
		IL_0007: brtrue.s IL_000b

		// }
		IL_0009: pop
		IL_000a: ret

		// (no C# code)
		IL_000b: ldarg.1
		IL_000c: callvirt instance void class [mscorlib]System.Action`1<class MGSC.ItemSlot>::Invoke(!0)
		IL_0011: ret
	} // end of method DragController::ManualSlotInteract

	.method public hidebysig 
		instance void ManualStartDrag (
			class MGSC.ItemSlot initalSlot
		) cil managed 
	{
		// Method begins at RVA 0xc623c
		// Header size: 12
		// Code size: 44 (0x2c)
		.maxstack 3
		.locals init (
			[0] valuetype [UnityEngine.CoreModule]UnityEngine.Vector3
		)

		// _slotUnderCursorWhenMouseDown = initalSlot;
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: stfld class MGSC.ItemSlot MGSC.DragController::_slotUnderCursorWhenMouseDown
		// Vector3 position = initalSlot.Icon.transform.position;
		IL_0007: ldarg.1
		IL_0008: callvirt instance class [UnityEngine.UI]UnityEngine.UI.Image MGSC.ItemSlot::get_Icon()
		IL_000d: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
		IL_0012: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
		IL_0017: stloc.0
		// BeginDrag(initalSlot);
		IL_0018: ldarg.0
		IL_0019: ldarg.1
		IL_001a: ldc.i4.1
		IL_001b: call instance void MGSC.DragController::BeginDrag(class MGSC.ItemSlot, valuetype MGSC.DragMode)
		// UI.Navigation.Select(position);
		IL_0020: call class MGSC.Navigation MGSC.UI::get_Navigation()
		IL_0025: ldloc.0
		IL_0026: callvirt instance void MGSC.Navigation::Select(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		// }
		IL_002b: ret
	} // end of method DragController::ManualStartDrag

	.method public hidebysig 
		instance void Pause (
			float32 duration
		) cil managed 
	{
		// Method begins at RVA 0xc6274
		// Header size: 1
		// Code size: 30 (0x1e)
		.maxstack 8

		// _pauseTimer.Start();
		IL_0000: ldarg.0
		IL_0001: ldfld class MGSC.Timer MGSC.DragController::_pauseTimer
		IL_0006: callvirt instance void MGSC.Timer::Start()
		// _clickTimer.Pause();
		IL_000b: ldarg.0
		IL_000c: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_0011: callvirt instance void MGSC.Timer::Pause()
		// _pauseDuration = duration;
		IL_0016: ldarg.0
		IL_0017: ldarg.1
		IL_0018: stfld float32 MGSC.DragController::_pauseDuration
		// }
		IL_001d: ret
	} // end of method DragController::Pause

	.method public hidebysig 
		instance void StartRepairMode (
			class MGSC.ItemSlot slot
		) cil managed 
	{
		// Method begins at RVA 0xc6293
		// Header size: 1
		// Code size: 30 (0x1e)
		.maxstack 8

		// BeginDrag(slot, DragMode.RepairMode);
		IL_0000: ldarg.0
		IL_0001: ldarg.1
		IL_0002: ldc.i4.2
		IL_0003: call instance void MGSC.DragController::BeginDrag(class MGSC.ItemSlot, valuetype MGSC.DragMode)
		// _clickTimer.Pause();
		IL_0008: ldarg.0
		IL_0009: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_000e: callvirt instance void MGSC.Timer::Pause()
		// UI.Cursor.MakeRepair();
		IL_0013: call class MGSC.CustomCursor MGSC.UI::get_Cursor()
		IL_0018: callvirt instance void MGSC.CustomCursor::MakeRepair()
		// }
		IL_001d: ret
	} // end of method DragController::StartRepairMode

	.method public hidebysig 
		instance bool CanPutInSlot (
			class MGSC.ItemSlot slot
		) cil managed 
	{
		// Method begins at RVA 0xc62b4
		// Header size: 12
		// Code size: 559 (0x22f)
		.maxstack 3
		.locals init (
			[0] bool,
			[1] bool,
			[2] class MGSC.Inventory,
			[3] class MGSC.Inventory
		)

		// if (_draggableItem == null)
		IL_0000: ldarg.0
		IL_0001: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0006: brtrue.s IL_000a

		// return false;
		IL_0008: ldc.i4.0
		IL_0009: ret

		// if (slot.Item != null && slot.Item.IsImplicit)
		IL_000a: ldarg.1
		IL_000b: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0010: brfalse.s IL_0021

		IL_0012: ldarg.1
		IL_0013: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0018: callvirt instance bool MGSC.BasePickupItem::get_IsImplicit()
		IL_001d: brfalse.s IL_0021

		// return false;
		IL_001f: ldc.i4.0
		IL_0020: ret

		// if (_dragMode == DragMode.RepairMode)
		IL_0021: ldarg.0
		IL_0022: ldfld valuetype MGSC.DragMode MGSC.DragController::_dragMode
		IL_0027: ldc.i4.2
		IL_0028: bne.un.s IL_0060

		// if (slot.Item != null && slot.Item.Comp<BreakableItemComponent>() != null && _draggableItem.Is<RepairRecord>())
		IL_002a: ldarg.1
		IL_002b: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0030: brfalse.s IL_005e

		IL_0032: ldarg.1
		IL_0033: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0038: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.BreakableItemComponent>()
		IL_003d: brfalse.s IL_005e

		// return ItemInteractionSystem.CanRepair(slot.Item, _draggableItem);
		IL_003f: ldarg.0
		IL_0040: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0045: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.RepairRecord>()
		IL_004a: brfalse.s IL_005e

		IL_004c: ldarg.1
		IL_004d: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0052: ldarg.0
		IL_0053: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0058: call bool MGSC.ItemInteractionSystem::CanRepair(class MGSC.BasePickupItem, class MGSC.BasePickupItem)
		IL_005d: ret

		// return false;
		IL_005e: ldc.i4.0
		IL_005f: ret

		// bool flag = slot.Storage.CanReplaceItem(_draggableItem, slot.CellPos);
		IL_0060: ldarg.1
		IL_0061: callvirt instance class MGSC.ItemStorage MGSC.ItemSlot::get_Storage()
		IL_0066: ldarg.0
		IL_0067: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_006c: ldarg.1
		IL_006d: callvirt instance valuetype MGSC.CellPosition MGSC.ItemSlot::get_CellPos()
		IL_0072: callvirt instance bool MGSC.ItemStorage::CanReplaceItem(class MGSC.BasePickupItem, valuetype MGSC.CellPosition)
		IL_0077: stloc.0
		// bool flag2 = Inventory.ValidStorageForItem(_draggableItem, slot.Storage);
		IL_0078: ldarg.0
		IL_0079: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_007e: ldarg.1
		IL_007f: callvirt instance class MGSC.ItemStorage MGSC.ItemSlot::get_Storage()
		IL_0084: call bool MGSC.Inventory::ValidStorageForItem(class MGSC.BasePickupItem, class MGSC.ItemStorage)
		IL_0089: stloc.1
		// if (slot.Item != null && slot.Item.Is<WeaponRecord>() && _draggableItem.Is<AmmoRecord>())
		IL_008a: ldarg.1
		IL_008b: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0090: brfalse IL_0121

		IL_0095: ldarg.1
		IL_0096: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_009b: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.WeaponRecord>()
		IL_00a0: brfalse.s IL_0121

		// if (slot.Item.Storage.Source == ItemStorageSource.Object || slot.Item.Storage.Source == ItemStorageSource.Floor || slot.Item.Storage.Source == ItemStorageSource.StationCargo)
		IL_00a2: ldarg.0
		IL_00a3: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_00a8: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.AmmoRecord>()
		IL_00ad: brfalse.s IL_0121

		IL_00af: ldarg.1
		IL_00b0: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_00b5: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_00ba: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
		IL_00bf: ldc.i4.s 10
		IL_00c1: beq.s IL_00e9

		IL_00c3: ldarg.1
		IL_00c4: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_00c9: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_00ce: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
		IL_00d3: brfalse.s IL_00e9

		// return false;
		IL_00d5: ldarg.1
		IL_00d6: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_00db: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_00e0: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
		IL_00e5: ldc.i4.s 12
		IL_00e7: bne.un.s IL_00eb

		IL_00e9: ldc.i4.0
		IL_00ea: ret

		// Inventory inventoryController = _mercenary?.CreatureData.Inventory;
		IL_00eb: ldarg.0
		IL_00ec: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_00f1: dup
		IL_00f2: brtrue.s IL_00f8

		// (no C# code)
		IL_00f4: pop
		// if (_reloadMode == DragReloadMode.AllWeapons)
		IL_00f5: ldnull
		IL_00f6: br.s IL_0102

		IL_00f8: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_00fd: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory

		IL_0102: stloc.2
		IL_0103: ldarg.0
		IL_0104: ldfld valuetype MGSC.DragReloadMode MGSC.DragController::_reloadMode
		IL_0109: ldc.i4.1
		IL_010a: bne.un.s IL_010e

		// inventoryController = null;
		IL_010c: ldnull
		IL_010d: stloc.2

		// return ReloadWeaponSystem.CanReload(inventoryController, slot.Item, _draggableItem);
		IL_010e: ldloc.2
		IL_010f: ldarg.1
		IL_0110: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0115: ldarg.0
		IL_0116: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_011b: call bool MGSC.ReloadWeaponSystem::CanReload(class MGSC.Inventory, class MGSC.BasePickupItem, class MGSC.BasePickupItem)
		IL_0120: ret

		// if (slot.Item != null && slot.Item.Is<WeaponRecord>() && _draggableItem.Is<GrenadeRecord>())
		IL_0121: ldarg.1
		IL_0122: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0127: brfalse IL_01b8

		IL_012c: ldarg.1
		IL_012d: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0132: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.WeaponRecord>()
		IL_0137: brfalse.s IL_01b8

		// if (slot.Item.Storage.Source == ItemStorageSource.Object || slot.Item.Storage.Source == ItemStorageSource.Floor || slot.Item.Storage.Source == ItemStorageSource.StationCargo)
		IL_0139: ldarg.0
		IL_013a: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_013f: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.GrenadeRecord>()
		IL_0144: brfalse.s IL_01b8

		IL_0146: ldarg.1
		IL_0147: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_014c: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_0151: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
		IL_0156: ldc.i4.s 10
		IL_0158: beq.s IL_0180

		IL_015a: ldarg.1
		IL_015b: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0160: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_0165: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
		IL_016a: brfalse.s IL_0180

		// return false;
		IL_016c: ldarg.1
		IL_016d: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0172: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_0177: callvirt instance valuetype MGSC.ItemStorageSource MGSC.ItemStorage::get_Source()
		IL_017c: ldc.i4.s 12
		IL_017e: bne.un.s IL_0182

		IL_0180: ldc.i4.0
		IL_0181: ret

		// Inventory inventoryController2 = _mercenary?.CreatureData.Inventory;
		IL_0182: ldarg.0
		IL_0183: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_0188: dup
		IL_0189: brtrue.s IL_018f

		// (no C# code)
		IL_018b: pop
		// if (_reloadMode == DragReloadMode.AllWeapons)
		IL_018c: ldnull
		IL_018d: br.s IL_0199

		IL_018f: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_0194: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory

		IL_0199: stloc.3
		IL_019a: ldarg.0
		IL_019b: ldfld valuetype MGSC.DragReloadMode MGSC.DragController::_reloadMode
		IL_01a0: ldc.i4.1
		IL_01a1: bne.un.s IL_01a5

		// inventoryController2 = null;
		IL_01a3: ldnull
		IL_01a4: stloc.3

		// return ReloadLauncherSystem.CanReload(inventoryController2, slot.Item, _draggableItem);
		IL_01a5: ldloc.3
		IL_01a6: ldarg.1
		IL_01a7: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_01ac: ldarg.0
		IL_01ad: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_01b2: call bool MGSC.ReloadLauncherSystem::CanReload(class MGSC.Inventory, class MGSC.BasePickupItem, class MGSC.BasePickupItem)
		IL_01b7: ret

		// if (slot.Item != null && slot.Item.Comp<BreakableItemComponent>() != null && _draggableItem.Is<RepairRecord>())
		IL_01b8: ldarg.1
		IL_01b9: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_01be: brfalse.s IL_01ec

		IL_01c0: ldarg.1
		IL_01c1: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_01c6: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.BreakableItemComponent>()
		IL_01cb: brfalse.s IL_01ec

		// return ItemInteractionSystem.CanRepair(slot.Item, _draggableItem);
		IL_01cd: ldarg.0
		IL_01ce: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_01d3: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.RepairRecord>()
		IL_01d8: brfalse.s IL_01ec

		IL_01da: ldarg.1
		IL_01db: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_01e0: ldarg.0
		IL_01e1: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_01e6: call bool MGSC.ItemInteractionSystem::CanRepair(class MGSC.BasePickupItem, class MGSC.BasePickupItem)
		IL_01eb: ret

		// if (!flag2)
		IL_01ec: ldloc.1
		IL_01ed: brtrue.s IL_01f1

		// return false;
		IL_01ef: ldc.i4.0
		IL_01f0: ret

		// if (flag)
		IL_01f1: ldloc.0
		IL_01f2: brfalse.s IL_01f6

		// return true;
		IL_01f4: ldc.i4.1
		IL_01f5: ret

		// if (slot.Item != null && _draggableItem.Id.Equals(slot.Item.Id))
		IL_01f6: ldarg.1
		IL_01f7: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_01fc: brfalse.s IL_022d

		IL_01fe: ldarg.0
		IL_01ff: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0204: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_0209: ldarg.1
		IL_020a: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_020f: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_0214: callvirt instance bool [mscorlib]System.String::Equals(string)
		IL_0219: brfalse.s IL_022d

		// return ItemInteractionSystem.CanMerge(_draggableItem, slot.Item);
		IL_021b: ldarg.0
		IL_021c: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0221: ldarg.1
		IL_0222: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0227: call bool MGSC.ItemInteractionSystem::CanMerge(class MGSC.BasePickupItem, class MGSC.BasePickupItem)
		IL_022c: ret

		// return false;
		IL_022d: ldc.i4.0
		IL_022e: ret
	} // end of method DragController::CanPutInSlot

	.method private hidebysig 
		instance void Update () cil managed 
	{
		// Method begins at RVA 0xc64f0
		// Header size: 12
		// Code size: 572 (0x23c)
		.maxstack 3
		.locals init (
			[0] class MGSC.InputController,
			[1] class MGSC.ItemSlot,
			[2] class MGSC.ItemSlot,
			[3] class MGSC.Navigable,
			[4] class [UnityEngine.CoreModule]UnityEngine.Sprite
		)

		// if (!_isActive)
		IL_0000: ldarg.0
		IL_0001: ldfld bool MGSC.DragController::_isActive
		IL_0006: brtrue.s IL_0009

		// }
		IL_0008: ret

		// if (_pauseTimer.Started)
		IL_0009: ldarg.0
		IL_000a: ldfld class MGSC.Timer MGSC.DragController::_pauseTimer
		IL_000f: callvirt instance bool MGSC.Timer::get_Started()
		IL_0014: brfalse.s IL_0035

		// if (_pauseTimer.Time < _pauseDuration)
		IL_0016: ldarg.0
		IL_0017: ldfld class MGSC.Timer MGSC.DragController::_pauseTimer
		IL_001c: callvirt instance float32 MGSC.Timer::get_Time()
		IL_0021: ldarg.0
		IL_0022: ldfld float32 MGSC.DragController::_pauseDuration
		IL_0027: bge.un.s IL_002a

		// return;
		IL_0029: ret

		// _pauseTimer.Pause();
		IL_002a: ldarg.0
		IL_002b: ldfld class MGSC.Timer MGSC.DragController::_pauseTimer
		IL_0030: callvirt instance void MGSC.Timer::Pause()

		// if (UI.IsShowing<CommonContextMenu>())
		IL_0035: call bool MGSC.UI::IsShowing<class MGSC.CommonContextMenu>()
		IL_003a: brfalse.s IL_003d

		// if (Input.GetMouseButtonDown(0))
		IL_003c: ret

		IL_003d: ldc.i4.0
		IL_003e: call bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButtonDown(int32)
		IL_0043: brfalse.s IL_005d

		// _clickTimer.Start();
		IL_0045: ldarg.0
		IL_0046: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_004b: callvirt instance void MGSC.Timer::Start()
		// _slotUnderCursorWhenMouseDown = RaycastSlotUnderCursor();
		IL_0050: ldarg.0
		IL_0051: ldarg.0
		IL_0052: ldc.i4.1
		IL_0053: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)
		IL_0058: stfld class MGSC.ItemSlot MGSC.DragController::_slotUnderCursorWhenMouseDown

		// if (Input.GetMouseButtonDown(1))
		IL_005d: ldc.i4.1
		IL_005e: call bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButtonDown(int32)
		IL_0063: brfalse.s IL_00bc

		// if (!IsDragging)
		IL_0065: ldarg.0
		IL_0066: call instance bool MGSC.DragController::get_IsDragging()
		IL_006b: brtrue.s IL_009f

		// _slotUnderCursorWhenMouseDown = RaycastSlotUnderCursor();
		IL_006d: ldarg.0
		IL_006e: ldarg.0
		IL_006f: ldc.i4.1
		IL_0070: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)
		IL_0075: stfld class MGSC.ItemSlot MGSC.DragController::_slotUnderCursorWhenMouseDown
		// if (_slotUnderCursorWhenMouseDown != null)
		IL_007a: ldarg.0
		IL_007b: ldfld class MGSC.ItemSlot MGSC.DragController::_slotUnderCursorWhenMouseDown
		IL_0080: ldnull
		IL_0081: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_0086: brfalse.s IL_009e

		// _showContextMenuCallback?.Invoke(_slotUnderCursorWhenMouseDown);
		IL_0088: ldarg.0
		IL_0089: ldfld class [mscorlib]System.Action`1<class MGSC.ItemSlot> MGSC.DragController::_showContextMenuCallback
		IL_008e: dup
		IL_008f: brtrue.s IL_0093

		// return;
		IL_0091: pop
		IL_0092: ret

		IL_0093: ldarg.0
		IL_0094: ldfld class MGSC.ItemSlot MGSC.DragController::_slotUnderCursorWhenMouseDown
		// (no C# code)
		IL_0099: callvirt instance void class [mscorlib]System.Action`1<class MGSC.ItemSlot>::Invoke(!0)

		// ReturnToOriginalStorage();
		IL_009e: ret

		IL_009f: ldarg.0
		IL_00a0: call instance void MGSC.DragController::ReturnToOriginalStorage()
		// _refreshCallback?.Invoke();
		IL_00a5: ldarg.0
		IL_00a6: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_00ab: dup
		IL_00ac: brtrue.s IL_00b1

		// (no C# code)
		IL_00ae: pop
		IL_00af: br.s IL_00b6

		// ResetDragState();
		IL_00b1: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_00b6: ldarg.0
		IL_00b7: call instance void MGSC.DragController::ResetDragState()

		// if (Input.GetMouseButton(0) && !IsDragging && _clickTimer.Started && _clickTimer.Time >= 0.12f)
		IL_00bc: ldc.i4.0
		IL_00bd: call bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButton(int32)
		IL_00c2: brfalse.s IL_00f8

		IL_00c4: ldarg.0
		IL_00c5: call instance bool MGSC.DragController::get_IsDragging()
		IL_00ca: brtrue.s IL_00f8

		// (no C# code)
		IL_00cc: ldarg.0
		IL_00cd: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_00d2: callvirt instance bool MGSC.Timer::get_Started()
		IL_00d7: brfalse.s IL_00f8

		// BeginDrag(_slotUnderCursorWhenMouseDown);
		IL_00d9: ldarg.0
		IL_00da: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_00df: callvirt instance float32 MGSC.Timer::get_Time()
		IL_00e4: ldc.r4 0.12
		IL_00e9: blt.un.s IL_00f8

		IL_00eb: ldarg.0
		IL_00ec: ldarg.0
		IL_00ed: ldfld class MGSC.ItemSlot MGSC.DragController::_slotUnderCursorWhenMouseDown
		IL_00f2: ldc.i4.1
		IL_00f3: call instance void MGSC.DragController::BeginDrag(class MGSC.ItemSlot, valuetype MGSC.DragMode)

		// if (Input.GetMouseButtonUp(0))
		IL_00f8: ldc.i4.0
		IL_00f9: call bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButtonUp(int32)
		IL_00fe: brfalse IL_0194

		// if (IsDragging)
		IL_0103: ldarg.0
		IL_0104: call instance bool MGSC.DragController::get_IsDragging()
		IL_0109: brfalse.s IL_0117

		// EndDrag();
		IL_010b: ldarg.0
		IL_010c: ldnull
		IL_010d: call instance void MGSC.DragController::EndDrag(class MGSC.ItemSlot)
		// else if (_clickTimer.Started && _clickTimer.Time <= 0.12f)
		IL_0112: br IL_01df

		IL_0117: ldarg.0
		IL_0118: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_011d: callvirt instance bool MGSC.Timer::get_Started()
		IL_0122: brfalse IL_01df

		IL_0127: ldarg.0
		IL_0128: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_012d: callvirt instance float32 MGSC.Timer::get_Time()
		IL_0132: ldc.r4 0.12
		IL_0137: bgt.un IL_01df

		// if (!SingletonMonoBehaviour<GameSettings>.Instance.FastToss && InputHelper.GetKey(KeyCode.LeftControl))
		IL_013c: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.GameSettings>::get_Instance()
		IL_0141: callvirt instance bool MGSC.GameSettings::get_FastToss()
		IL_0146: brtrue.s IL_0179

		IL_0148: ldc.i4 306
		IL_014d: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_0152: brfalse.s IL_0179

		// ItemSlot itemSlot = RaycastSlotUnderCursor();
		IL_0154: ldarg.0
		IL_0155: ldc.i4.1
		IL_0156: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)
		IL_015b: stloc.1
		// if (itemSlot != null)
		IL_015c: ldloc.1
		IL_015d: ldnull
		IL_015e: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_0163: brfalse.s IL_0187

		// _controlClickCallback?.Invoke(itemSlot);
		IL_0165: ldarg.0
		IL_0166: ldfld class [mscorlib]System.Action`1<class MGSC.ItemSlot> MGSC.DragController::_controlClickCallback
		IL_016b: dup
		IL_016c: brtrue.s IL_0171

		// (no C# code)
		IL_016e: pop
		IL_016f: br.s IL_0187

		IL_0171: ldloc.1
		IL_0172: callvirt instance void class [mscorlib]System.Action`1<class MGSC.ItemSlot>::Invoke(!0)
		// BeginDrag(RaycastSlotUnderCursor());
		IL_0177: br.s IL_0187

		IL_0179: ldarg.0
		IL_017a: ldarg.0
		IL_017b: ldc.i4.1
		IL_017c: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)
		IL_0181: ldc.i4.1
		IL_0182: call instance void MGSC.DragController::BeginDrag(class MGSC.ItemSlot, valuetype MGSC.DragMode)

		// _clickTimer.Pause();
		IL_0187: ldarg.0
		IL_0188: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_018d: callvirt instance void MGSC.Timer::Pause()
		// else if (SingletonMonoBehaviour<GameSettings>.Instance.FastToss && !Input.GetMouseButton(0) && !IsDragging && InputHelper.GetKey(KeyCode.LeftControl))
		IL_0192: br.s IL_01df

		IL_0194: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.GameSettings>::get_Instance()
		IL_0199: callvirt instance bool MGSC.GameSettings::get_FastToss()
		IL_019e: brfalse.s IL_01df

		IL_01a0: ldc.i4.0
		IL_01a1: call bool [UnityEngine.InputLegacyModule]UnityEngine.Input::GetMouseButton(int32)
		IL_01a6: brtrue.s IL_01df

		// (no C# code)
		IL_01a8: ldarg.0
		IL_01a9: call instance bool MGSC.DragController::get_IsDragging()
		IL_01ae: brtrue.s IL_01df

		// ItemSlot itemSlot2 = RaycastSlotUnderCursor();
		IL_01b0: ldc.i4 306
		IL_01b5: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_01ba: brfalse.s IL_01df

		IL_01bc: ldarg.0
		IL_01bd: ldc.i4.1
		IL_01be: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)
		IL_01c3: stloc.2
		// if (itemSlot2 != null)
		IL_01c4: ldloc.2
		IL_01c5: ldnull
		IL_01c6: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_01cb: brfalse.s IL_01df

		// _controlClickCallback?.Invoke(itemSlot2);
		IL_01cd: ldarg.0
		IL_01ce: ldfld class [mscorlib]System.Action`1<class MGSC.ItemSlot> MGSC.DragController::_controlClickCallback
		IL_01d3: dup
		IL_01d4: brtrue.s IL_01d9

		// (no C# code)
		IL_01d6: pop
		IL_01d7: br.s IL_01df

		IL_01d9: ldloc.2
		// InputController instance = SingletonMonoBehaviour<InputController>.Instance;
		IL_01da: callvirt instance void class [mscorlib]System.Action`1<class MGSC.ItemSlot>::Invoke(!0)

		IL_01df: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.InputController>::get_Instance()
		IL_01e4: stloc.0
		// if (IsDragging && instance.Mode != InputController.InputMode.KeyboardAndMouse)
		IL_01e5: ldarg.0
		IL_01e6: call instance bool MGSC.DragController::get_IsDragging()
		IL_01eb: brfalse.s IL_023b

		IL_01ed: ldloc.0
		IL_01ee: callvirt instance valuetype MGSC.InputController/InputMode MGSC.InputController::get_Mode()
		IL_01f3: ldc.i4.1
		IL_01f4: beq.s IL_023b

		// Navigable selected = UI.Navigation.Selected;
		IL_01f6: call class MGSC.Navigation MGSC.UI::get_Navigation()
		IL_01fb: callvirt instance class MGSC.Navigable MGSC.Navigation::get_Selected()
		IL_0200: stloc.3
		// if (selected is ItemSlot || selected is ItemTab)
		IL_0201: ldloc.3
		IL_0202: isinst MGSC.ItemSlot
		IL_0207: brtrue.s IL_0211

		IL_0209: ldloc.3
		IL_020a: isinst MGSC.ItemTab
		IL_020f: brfalse.s IL_0233

		// Sprite itemSprite = SingletonMonoBehaviour<ItemFactory>.Instance.ResolveIcon(_draggableItem.View<ItemContentDescriptor>(), 1);
		IL_0211: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.ItemFactory>::get_Instance()
		IL_0216: ldarg.0
		IL_0217: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_021c: callvirt instance !!0 MGSC.BasePickupItem::View<class MGSC.ItemContentDescriptor>()
		IL_0221: ldc.i4.1
		IL_0222: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Sprite MGSC.ItemFactory::ResolveIcon(class MGSC.ItemContentDescriptor, int32)
		IL_0227: stloc.s 4
		// RefreshVisual(itemSprite, visible: true);
		IL_0229: ldarg.0
		IL_022a: ldloc.s 4
		IL_022c: ldc.i4.1
		IL_022d: call instance void MGSC.DragController::RefreshVisual(class [UnityEngine.CoreModule]UnityEngine.Sprite, bool)
		// RefreshVisual(null, visible: false);
		IL_0232: ret

		IL_0233: ldarg.0
		IL_0234: ldnull
		IL_0235: ldc.i4.0
		IL_0236: call instance void MGSC.DragController::RefreshVisual(class [UnityEngine.CoreModule]UnityEngine.Sprite, bool)

		// (no C# code)
		IL_023b: ret
	} // end of method DragController::Update

	.method private hidebysig 
		instance void LateUpdate () cil managed 
	{
		// Method begins at RVA 0xc6738
		// Header size: 12
		// Code size: 134 (0x86)
		.maxstack 3

		// if (!_isActive)
		IL_0000: ldarg.0
		IL_0001: ldfld bool MGSC.DragController::_isActive
		IL_0006: brtrue.s IL_0009

		// }
		IL_0008: ret

		// if (_pauseTimer.Started)
		IL_0009: ldarg.0
		IL_000a: ldfld class MGSC.Timer MGSC.DragController::_pauseTimer
		IL_000f: callvirt instance bool MGSC.Timer::get_Started()
		IL_0014: brfalse.s IL_0035

		// if (_pauseTimer.Time < _pauseDuration)
		IL_0016: ldarg.0
		IL_0017: ldfld class MGSC.Timer MGSC.DragController::_pauseTimer
		IL_001c: callvirt instance float32 MGSC.Timer::get_Time()
		IL_0021: ldarg.0
		IL_0022: ldfld float32 MGSC.DragController::_pauseDuration
		IL_0027: bge.un.s IL_002a

		// return;
		IL_0029: ret

		// _pauseTimer.Pause();
		IL_002a: ldarg.0
		IL_002b: ldfld class MGSC.Timer MGSC.DragController::_pauseTimer
		IL_0030: callvirt instance void MGSC.Timer::Pause()

		// if (!IsDragging && _clickTimer.Started && _clickTimer.Time > 0.12f)
		IL_0035: ldarg.0
		IL_0036: call instance bool MGSC.DragController::get_IsDragging()
		IL_003b: brtrue.s IL_0076

		IL_003d: ldarg.0
		IL_003e: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_0043: callvirt instance bool MGSC.Timer::get_Started()
		IL_0048: brfalse.s IL_0076

		// BeginDrag(RaycastSlotUnderCursor());
		IL_004a: ldarg.0
		IL_004b: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_0050: callvirt instance float32 MGSC.Timer::get_Time()
		IL_0055: ldc.r4 0.12
		IL_005a: ble.un.s IL_0076

		IL_005c: ldarg.0
		IL_005d: ldarg.0
		IL_005e: ldc.i4.1
		IL_005f: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)
		IL_0064: ldc.i4.1
		IL_0065: call instance void MGSC.DragController::BeginDrag(class MGSC.ItemSlot, valuetype MGSC.DragMode)
		// _clickTimer.Pause();
		IL_006a: ldarg.0
		IL_006b: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_0070: callvirt instance void MGSC.Timer::Pause()
		// else if (IsDragging)
		IL_0075: ret

		IL_0076: ldarg.0
		IL_0077: call instance bool MGSC.DragController::get_IsDragging()
		IL_007c: brtrue.s IL_007f

		// RefreshPosition();
		IL_007e: ret

		IL_007f: ldarg.0
		IL_0080: call instance void MGSC.DragController::RefreshPosition()
		// (no C# code)
		IL_0085: ret
	} // end of method DragController::LateUpdate

	.method private hidebysig 
		instance void BeginDrag (
			class MGSC.ItemSlot draggableSlot,
			[opt] valuetype MGSC.DragMode dragMode
		) cil managed 
	{
		.param [2] = int32(1)
		// Method begins at RVA 0xc67cc
		// Header size: 12
		// Code size: 302 (0x12e)
		.maxstack 4
		.locals init (
			[0] bool,
			[1] class MGSC.BasePickupItem,
			[2] valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
			[3] class [UnityEngine.CoreModule]UnityEngine.Sprite
		)

		// bool flag = draggableSlot != null;
		IL_0000: ldarg.1
		IL_0001: ldnull
		IL_0002: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_0007: stloc.0
		// if (draggableSlot != null && (!draggableSlot.IsDraggable || draggableSlot.Item == null))
		IL_0008: ldarg.1
		IL_0009: ldnull
		IL_000a: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_000f: brfalse.s IL_0023

		IL_0011: ldarg.1
		IL_0012: callvirt instance bool MGSC.ItemSlot::get_IsDraggable()
		IL_0017: brfalse.s IL_0021

		// flag = false;
		IL_0019: ldarg.1
		IL_001a: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_001f: brtrue.s IL_0023

		IL_0021: ldc.i4.0
		IL_0022: stloc.0

		// if (_canBeginDragCallback != null && !_canBeginDragCallback())
		IL_0023: ldarg.0
		IL_0024: ldfld class [mscorlib]System.Func`1<bool> MGSC.DragController::_canBeginDragCallback
		IL_0029: brfalse.s IL_003a

		IL_002b: ldarg.0
		IL_002c: ldfld class [mscorlib]System.Func`1<bool> MGSC.DragController::_canBeginDragCallback
		IL_0031: callvirt instance !0 class [mscorlib]System.Func`1<bool>::Invoke()
		IL_0036: brtrue.s IL_003a

		// flag = false;
		IL_0038: ldc.i4.0
		IL_0039: stloc.0

		// if (!flag)
		IL_003a: ldloc.0
		IL_003b: brtrue.s IL_004d

		// _dragMode = DragMode.None;
		IL_003d: ldarg.0
		IL_003e: ldc.i4.0
		IL_003f: stfld valuetype MGSC.DragMode MGSC.DragController::_dragMode
		// RefreshVisual(null, visible: false);
		IL_0044: ldarg.0
		IL_0045: ldnull
		IL_0046: ldc.i4.0
		IL_0047: call instance void MGSC.DragController::RefreshVisual(class [UnityEngine.CoreModule]UnityEngine.Sprite, bool)
		// }
		IL_004c: ret

		// BasePickupItem item = draggableSlot.Item;
		IL_004d: ldarg.1
		IL_004e: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0053: stloc.1
		// _dragMode = dragMode;
		IL_0054: ldarg.0
		IL_0055: ldarg.2
		IL_0056: stfld valuetype MGSC.DragMode MGSC.DragController::_dragMode
		// _draggableItem = item;
		IL_005b: ldarg.0
		IL_005c: ldloc.1
		IL_005d: stfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		// _lastStorage = item.Storage;
		IL_0062: ldarg.0
		IL_0063: ldloc.1
		IL_0064: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_0069: stfld class MGSC.ItemStorage MGSC.DragController::_lastStorage
		// _specPosition = item.InventoryPos;
		IL_006e: ldarg.0
		IL_006f: ldloc.1
		IL_0070: ldfld valuetype MGSC.CellPosition MGSC.BasePickupItem::InventoryPos
		IL_0075: stfld valuetype MGSC.CellPosition MGSC.DragController::_specPosition
		// item.Storage.Remove(item);
		IL_007a: ldloc.1
		IL_007b: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_0080: ldloc.1
		IL_0081: ldc.i4.1
		IL_0082: callvirt instance void MGSC.ItemStorage::Remove(class MGSC.BasePickupItem, bool)
		// Vector3 position = draggableSlot.Icon.transform.position;
		IL_0087: ldarg.1
		IL_0088: callvirt instance class [UnityEngine.UI]UnityEngine.UI.Image MGSC.ItemSlot::get_Icon()
		IL_008d: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
		IL_0092: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
		IL_0097: stloc.2
		// _refreshCallback?.Invoke();
		IL_0098: ldarg.0
		IL_0099: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_009e: dup
		IL_009f: brtrue.s IL_00a4

		// (no C# code)
		IL_00a1: pop
		IL_00a2: br.s IL_00a9

		// Sprite itemSprite = SingletonMonoBehaviour<ItemFactory>.Instance.ResolveIcon(item.View<ItemContentDescriptor>(), 1);
		IL_00a4: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_00a9: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.ItemFactory>::get_Instance()
		IL_00ae: ldloc.1
		IL_00af: callvirt instance !!0 MGSC.BasePickupItem::View<class MGSC.ItemContentDescriptor>()
		IL_00b4: ldc.i4.1
		IL_00b5: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Sprite MGSC.ItemFactory::ResolveIcon(class MGSC.ItemContentDescriptor, int32)
		IL_00ba: stloc.3
		// RefreshVisual(itemSprite, visible: true);
		IL_00bb: ldarg.0
		IL_00bc: ldloc.3
		IL_00bd: ldc.i4.1
		IL_00be: call instance void MGSC.DragController::RefreshVisual(class [UnityEngine.CoreModule]UnityEngine.Sprite, bool)
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_00c3: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_00c8: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_00cd: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_00d2: ldc.i4.1
		IL_00d3: ldarg.0
		IL_00d4: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_00d9: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// UI.Cursor.MakeStaticHand();
		IL_00de: call class MGSC.CustomCursor MGSC.UI::get_Cursor()
		IL_00e3: callvirt instance void MGSC.CustomCursor::MakeStaticHand()
		// RefreshPosition();
		IL_00e8: ldarg.0
		IL_00e9: call instance void MGSC.DragController::RefreshPosition()
		// if (Vector3.Distance(position, _dragTarget.position) < 60f)
		IL_00ee: ldloc.2
		IL_00ef: ldarg.0
		IL_00f0: ldfld class [UnityEngine.CoreModule]UnityEngine.RectTransform MGSC.DragController::_dragTarget
		IL_00f5: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Transform::get_position()
		IL_00fa: call float32 [UnityEngine.CoreModule]UnityEngine.Vector3::Distance(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3, valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		IL_00ff: ldc.r4 60
		IL_0104: bge.un.s IL_0118

		// _dragItemIcon.transform.position = position;
		IL_0106: ldarg.0
		IL_0107: ldfld class [UnityEngine.UI]UnityEngine.UI.Image MGSC.DragController::_dragItemIcon
		IL_010c: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
		IL_0111: ldloc.2
		IL_0112: callvirt instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		// _dragItemIcon.transform.localPosition = Vector3.zero;
		IL_0117: ret

		IL_0118: ldarg.0
		IL_0119: ldfld class [UnityEngine.UI]UnityEngine.UI.Image MGSC.DragController::_dragItemIcon
		IL_011e: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
		IL_0123: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector3::get_zero()
		IL_0128: callvirt instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_localPosition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		// (no C# code)
		IL_012d: ret
	} // end of method DragController::BeginDrag

	.method public hidebysig 
		instance void DragToTab (
			class MGSC.ItemTab tab
		) cil managed 
	{
		// Method begins at RVA 0xc6908
		// Header size: 12
		// Code size: 91 (0x5b)
		.maxstack 4

		// _ = _lastStorage;
		IL_0000: ldarg.0
		IL_0001: ldfld class MGSC.ItemStorage MGSC.DragController::_lastStorage
		IL_0006: pop
		// if (tab.DropItemInTab(_draggableItem))
		IL_0007: ldarg.1
		IL_0008: ldarg.0
		IL_0009: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_000e: callvirt instance bool MGSC.ItemTab::DropItemInTab(class MGSC.BasePickupItem)
		IL_0013: brfalse.s IL_005a

		// _interactionCallback?.Invoke(InventoryInteractionType.DropInTab);
		IL_0015: ldarg.0
		IL_0016: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_001b: dup
		IL_001c: brtrue.s IL_0021

		// (no C# code)
		IL_001e: pop
		IL_001f: br.s IL_0027

		IL_0021: ldc.i4.6
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_0022: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_0027: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_002c: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_0031: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_0036: ldc.i4.1
		IL_0037: ldarg.0
		IL_0038: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_003d: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// _refreshCallback?.Invoke();
		IL_0042: ldarg.0
		IL_0043: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_0048: dup
		IL_0049: brtrue.s IL_004e

		// (no C# code)
		IL_004b: pop
		IL_004c: br.s IL_0053

		// ResetDragState();
		IL_004e: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_0053: ldarg.0
		IL_0054: call instance void MGSC.DragController::ResetDragState()
		// }
		IL_0059: ret

		// (no C# code)
		IL_005a: ret
	} // end of method DragController::DragToTab

	.method private hidebysig 
		instance void EndDrag (
			[opt] class MGSC.ItemSlot forceSlot
		) cil managed 
	{
		.param [1] = nullref
		// Method begins at RVA 0xc6970
		// Header size: 12
		// Code size: 1464 (0x5b8)
		.maxstack 5
		.locals init (
			[0] class MGSC.ItemStorage,
			[1] bool,
			[2] valuetype MGSC.InventoryInteractionType,
			[3] class MGSC.ItemTab,
			[4] class MGSC.ItemGrid,
			[5] class MGSC.ItemSlot,
			[6] valuetype MGSC.DragMode,
			[7] class MGSC.BasePickupItem,
			[8] class MGSC.ItemStorage,
			[9] valuetype MGSC.CellPosition,
			[10] class [UnityEngine.CoreModule]UnityEngine.Sprite
		)

		// ItemStorage lastStorage = _lastStorage;
		IL_0000: ldarg.0
		IL_0001: ldfld class MGSC.ItemStorage MGSC.DragController::_lastStorage
		IL_0006: stloc.0
		// SlotUnderCursor = ((forceSlot == null) ? RaycastSlotUnderCursor(skipEmpty: false) : forceSlot);
		IL_0007: ldarg.0
		IL_0008: ldarg.1
		IL_0009: ldnull
		IL_000a: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_000f: brtrue.s IL_0014

		IL_0011: ldarg.1
		IL_0012: br.s IL_001b

		IL_0014: ldarg.0
		IL_0015: ldc.i4.0
		IL_0016: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)

		// if (_dragMode == DragMode.RepairMode && (SlotUnderCursor == null || SlotUnderCursor.Item == null))
		IL_001b: call instance void MGSC.DragController::set_SlotUnderCursor(class MGSC.ItemSlot)
		IL_0020: ldarg.0
		IL_0021: ldfld valuetype MGSC.DragMode MGSC.DragController::_dragMode
		IL_0026: ldc.i4.2
		IL_0027: bne.un.s IL_0062

		IL_0029: ldarg.0
		IL_002a: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_002f: ldnull
		IL_0030: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_0035: brtrue.s IL_0044

		// ReturnToOriginalStorage();
		IL_0037: ldarg.0
		IL_0038: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_003d: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0042: brtrue.s IL_0062

		IL_0044: ldarg.0
		IL_0045: call instance void MGSC.DragController::ReturnToOriginalStorage()
		// _refreshCallback?.Invoke();
		IL_004a: ldarg.0
		IL_004b: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_0050: dup
		IL_0051: brtrue.s IL_0056

		// (no C# code)
		IL_0053: pop
		IL_0054: br.s IL_005b

		// ResetDragState();
		IL_0056: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_005b: ldarg.0
		IL_005c: call instance void MGSC.DragController::ResetDragState()
		// if (SlotUnderCursor == null)
		IL_0061: ret

		IL_0062: ldarg.0
		IL_0063: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0068: ldnull
		IL_0069: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_006e: brfalse IL_02e9

		// ItemTab itemTab = RaycastItemTabUnderCursor();
		IL_0073: ldarg.0
		IL_0074: call instance class MGSC.ItemTab MGSC.DragController::RaycastItemTabUnderCursor()
		IL_0079: stloc.3
		// if (itemTab != null)
		IL_007a: ldloc.3
		IL_007b: ldnull
		IL_007c: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_0081: brfalse IL_016f

		// if (itemTab.DropItemInTab(_draggableItem))
		IL_0086: ldloc.3
		IL_0087: ldarg.0
		IL_0088: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_008d: callvirt instance bool MGSC.ItemTab::DropItemInTab(class MGSC.BasePickupItem)
		IL_0092: brfalse IL_0137

		// if (InputHelper.GetKey(KeyCode.LeftShift) && !InputHelper.GetKey(KeyCode.LeftControl))
		IL_0097: ldc.i4 304
		IL_009c: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_00a1: brfalse.s IL_00f2

		IL_00a3: ldc.i4 306
		IL_00a8: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_00ad: brtrue.s IL_00f2

		// _shiftClickToTabCallback?.Invoke(_draggableItem.Id, lastStorage, itemTab);
		IL_00af: ldarg.0
		IL_00b0: ldfld class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemTab> MGSC.DragController::_shiftClickToTabCallback
		IL_00b5: dup
		IL_00b6: brtrue.s IL_00bb

		// (no C# code)
		IL_00b8: pop
		IL_00b9: br.s IL_00cd

		IL_00bb: ldarg.0
		IL_00bc: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_00c1: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_00c6: ldloc.0
		IL_00c7: ldloc.3
		// _interactionCallback?.Invoke(InventoryInteractionType.ShiftClick);
		IL_00c8: callvirt instance void class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemTab>::Invoke(!0, !1, !2)

		IL_00cd: ldarg.0
		IL_00ce: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_00d3: dup
		IL_00d4: brtrue.s IL_00d9

		// (no C# code)
		IL_00d6: pop
		IL_00d7: br.s IL_00df

		IL_00d9: ldc.i4.8
		// _refreshCallback?.Invoke();
		IL_00da: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_00df: ldarg.0
		IL_00e0: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_00e5: dup
		IL_00e6: brtrue.s IL_00eb

		// (no C# code)
		IL_00e8: pop
		IL_00e9: br.s IL_0104

		IL_00eb: callvirt instance void [mscorlib]System.Action::Invoke()
		// _interactionCallback?.Invoke(InventoryInteractionType.DropInTab);
		IL_00f0: br.s IL_0104

		IL_00f2: ldarg.0
		IL_00f3: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_00f8: dup
		IL_00f9: brtrue.s IL_00fe

		// (no C# code)
		IL_00fb: pop
		IL_00fc: br.s IL_0104

		IL_00fe: ldc.i4.6
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_00ff: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_0104: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0109: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_010e: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_0113: ldc.i4.1
		IL_0114: ldarg.0
		IL_0115: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_011a: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// _refreshCallback?.Invoke();
		IL_011f: ldarg.0
		IL_0120: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_0125: dup
		IL_0126: brtrue.s IL_012b

		// (no C# code)
		IL_0128: pop
		IL_0129: br.s IL_0130

		// ResetDragState();
		IL_012b: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_0130: ldarg.0
		IL_0131: call instance void MGSC.DragController::ResetDragState()
		// }
		IL_0136: ret

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
		IL_0137: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_013c: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_0141: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
		IL_0146: ldc.i4.0
		IL_0147: ldc.r4 0.0
		IL_014c: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// ReturnToOriginalStorage();
		IL_0151: ldarg.0
		IL_0152: call instance void MGSC.DragController::ReturnToOriginalStorage()
		// _refreshCallback?.Invoke();
		IL_0157: ldarg.0
		IL_0158: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_015d: dup
		IL_015e: brtrue.s IL_0163

		// (no C# code)
		IL_0160: pop
		IL_0161: br.s IL_0168

		// ResetDragState();
		IL_0163: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_0168: ldarg.0
		IL_0169: call instance void MGSC.DragController::ResetDragState()
		// ItemGrid itemGrid = RaycastItemGridUnderCursor();
		IL_016e: ret

		IL_016f: ldarg.0
		IL_0170: call instance class MGSC.ItemGrid MGSC.DragController::RaycastItemGridUnderCursor()
		IL_0175: stloc.s 4
		// if (itemGrid != null)
		IL_0177: ldloc.s 4
		IL_0179: ldnull
		IL_017a: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_017f: brfalse IL_025b

		// if (itemGrid.Storage.TryPutItem(_draggableItem, CellPosition.Zero))
		IL_0184: ldloc.s 4
		IL_0186: callvirt instance class MGSC.ItemStorage MGSC.ItemGrid::get_Storage()
		IL_018b: ldarg.0
		IL_018c: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0191: ldsfld valuetype MGSC.CellPosition MGSC.CellPosition::Zero
		IL_0196: ldc.i4.0
		IL_0197: ldc.i4.1
		IL_0198: callvirt instance bool MGSC.ItemStorage::TryPutItem(class MGSC.BasePickupItem, valuetype MGSC.CellPosition, bool, bool)
		IL_019d: brfalse IL_0223

		// if (InputHelper.GetKey(KeyCode.LeftShift) && !InputHelper.GetKey(KeyCode.LeftControl))
		IL_01a2: ldc.i4 304
		IL_01a7: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_01ac: brfalse.s IL_01de

		IL_01ae: ldc.i4 306
		IL_01b3: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_01b8: brtrue.s IL_01de

		// _shiftClickToStorageCallback?.Invoke(_draggableItem.Id, lastStorage, itemGrid.Storage);
		IL_01ba: ldarg.0
		IL_01bb: ldfld class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemStorage> MGSC.DragController::_shiftClickToStorageCallback
		IL_01c0: dup
		IL_01c1: brtrue.s IL_01c6

		// (no C# code)
		IL_01c3: pop
		IL_01c4: br.s IL_01de

		IL_01c6: ldarg.0
		IL_01c7: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_01cc: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_01d1: ldloc.0
		IL_01d2: ldloc.s 4
		IL_01d4: callvirt instance class MGSC.ItemStorage MGSC.ItemGrid::get_Storage()
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_01d9: callvirt instance void class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemStorage>::Invoke(!0, !1, !2)

		IL_01de: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_01e3: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_01e8: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_01ed: ldc.i4.1
		IL_01ee: ldarg.0
		IL_01ef: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_01f4: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// _refreshCallback?.Invoke();
		IL_01f9: ldarg.0
		IL_01fa: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_01ff: dup
		IL_0200: brtrue.s IL_0205

		// (no C# code)
		IL_0202: pop
		IL_0203: br.s IL_020a

		// _interactionCallback?.Invoke(InventoryInteractionType.ShiftClick);
		IL_0205: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_020a: ldarg.0
		IL_020b: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_0210: dup
		IL_0211: brtrue.s IL_0216

		// (no C# code)
		IL_0213: pop
		IL_0214: br.s IL_021c

		IL_0216: ldc.i4.8
		// ResetDragState();
		IL_0217: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_021c: ldarg.0
		IL_021d: call instance void MGSC.DragController::ResetDragState()
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
		IL_0222: ret

		IL_0223: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0228: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_022d: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
		IL_0232: ldc.i4.0
		IL_0233: ldc.r4 0.0
		IL_0238: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// ReturnToOriginalStorage();
		IL_023d: ldarg.0
		IL_023e: call instance void MGSC.DragController::ReturnToOriginalStorage()
		// _refreshCallback?.Invoke();
		IL_0243: ldarg.0
		IL_0244: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_0249: dup
		IL_024a: brtrue.s IL_024f

		// (no C# code)
		IL_024c: pop
		IL_024d: br.s IL_0254

		// ResetDragState();
		IL_024f: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_0254: ldarg.0
		IL_0255: call instance void MGSC.DragController::ResetDragState()
		// else if (RaycastCargoRemovalUnderCursor())
		IL_025a: ret

		IL_025b: ldarg.0
		IL_025c: call instance bool MGSC.DragController::RaycastCargoRemovalUnderCursor()
		IL_0261: brfalse.s IL_028d

		// _interactionCallback?.Invoke(InventoryInteractionType.DropInRemovalSlot);
		IL_0263: ldarg.0
		IL_0264: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_0269: dup
		IL_026a: brtrue.s IL_026f

		// (no C# code)
		IL_026c: pop
		IL_026d: br.s IL_0275

		IL_026f: ldc.i4.7
		// _refreshCallback?.Invoke();
		IL_0270: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_0275: ldarg.0
		IL_0276: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_027b: dup
		IL_027c: brtrue.s IL_0281

		// (no C# code)
		IL_027e: pop
		IL_027f: br.s IL_0286

		// ResetDragState();
		IL_0281: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_0286: ldarg.0
		IL_0287: call instance void MGSC.DragController::ResetDragState()
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_028c: ret

		IL_028d: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0292: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_0297: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_029c: ldc.i4.1
		IL_029d: ldarg.0
		IL_029e: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_02a3: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// _dropOutsideCallback?.Invoke(_draggableItem);
		IL_02a8: ldarg.0
		IL_02a9: ldfld class [mscorlib]System.Action`1<class MGSC.BasePickupItem> MGSC.DragController::_dropOutsideCallback
		IL_02ae: dup
		IL_02af: brtrue.s IL_02b4

		// (no C# code)
		IL_02b1: pop
		IL_02b2: br.s IL_02bf

		IL_02b4: ldarg.0
		IL_02b5: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		// _interactionCallback?.Invoke(InventoryInteractionType.DropOutside);
		IL_02ba: callvirt instance void class [mscorlib]System.Action`1<class MGSC.BasePickupItem>::Invoke(!0)

		IL_02bf: ldarg.0
		IL_02c0: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_02c5: dup
		IL_02c6: brtrue.s IL_02cb

		// (no C# code)
		IL_02c8: pop
		IL_02c9: br.s IL_02d1

		IL_02cb: ldc.i4.5
		// _refreshCallback?.Invoke();
		IL_02cc: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_02d1: ldarg.0
		IL_02d2: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_02d7: dup
		IL_02d8: brtrue.s IL_02dd

		// (no C# code)
		IL_02da: pop
		IL_02db: br.s IL_02e2

		// ResetDragState();
		IL_02dd: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_02e2: ldarg.0
		IL_02e3: call instance void MGSC.DragController::ResetDragState()
		// if (SlotUnderCursor.Item == null)
		IL_02e8: ret

		IL_02e9: ldarg.0
		IL_02ea: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_02ef: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_02f4: brtrue IL_03e8

		// if (!ItemInteractionSystem.Move(_draggableItem, SlotUnderCursor.Storage, SlotUnderCursor.CellPos, sendEvent: true, hasInventoryPos: true))
		IL_02f9: ldarg.0
		IL_02fa: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_02ff: ldarg.0
		IL_0300: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0305: callvirt instance class MGSC.ItemStorage MGSC.ItemSlot::get_Storage()
		IL_030a: ldarg.0
		IL_030b: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0310: callvirt instance valuetype MGSC.CellPosition MGSC.ItemSlot::get_CellPos()
		IL_0315: ldc.i4.1
		IL_0316: ldc.i4.1
		IL_0317: call bool MGSC.ItemInteractionSystem::Move(class MGSC.BasePickupItem, class MGSC.ItemStorage, valuetype MGSC.CellPosition, bool, bool)
		IL_031c: brtrue.s IL_0340

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
		IL_031e: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0323: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_0328: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
		IL_032d: ldc.i4.0
		IL_032e: ldc.r4 0.0
		IL_0333: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// ReturnToOriginalStorage();
		IL_0338: ldarg.0
		IL_0339: call instance void MGSC.DragController::ReturnToOriginalStorage()
		// if (InputHelper.GetKey(KeyCode.LeftShift) && !InputHelper.GetKey(KeyCode.LeftControl))
		IL_033e: br.s IL_039b

		IL_0340: ldc.i4 304
		IL_0345: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_034a: brfalse.s IL_0380

		IL_034c: ldc.i4 306
		IL_0351: call bool MGSC.InputHelper::GetKey(valuetype [UnityEngine.CoreModule]UnityEngine.KeyCode)
		IL_0356: brtrue.s IL_0380

		// _shiftClickToStorageCallback?.Invoke(_draggableItem.Id, lastStorage, SlotUnderCursor.Storage);
		IL_0358: ldarg.0
		IL_0359: ldfld class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemStorage> MGSC.DragController::_shiftClickToStorageCallback
		IL_035e: dup
		IL_035f: brtrue.s IL_0364

		// (no C# code)
		IL_0361: pop
		IL_0362: br.s IL_0380

		IL_0364: ldarg.0
		IL_0365: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_036a: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_036f: ldloc.0
		IL_0370: ldarg.0
		IL_0371: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0376: callvirt instance class MGSC.ItemStorage MGSC.ItemSlot::get_Storage()
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_037b: callvirt instance void class [mscorlib]System.Action`3<string, class MGSC.ItemStorage, class MGSC.ItemStorage>::Invoke(!0, !1, !2)

		IL_0380: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0385: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_038a: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_038f: ldc.i4.1
		IL_0390: ldarg.0
		IL_0391: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_0396: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)

		// _interactionCallback?.Invoke(InventoryInteractionType.MoveItem);
		IL_039b: ldarg.0
		IL_039c: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_03a1: dup
		IL_03a2: brtrue.s IL_03a7

		// (no C# code)
		IL_03a4: pop
		IL_03a5: br.s IL_03ad

		IL_03a7: ldc.i4.1
		// _refreshCallback?.Invoke();
		IL_03a8: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_03ad: ldarg.0
		IL_03ae: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_03b3: dup
		IL_03b4: brtrue.s IL_03b9

		// (no C# code)
		IL_03b6: pop
		IL_03b7: br.s IL_03be

		// ItemSlot itemSlot = RaycastSlotUnderCursor(skipEmpty: false);
		IL_03b9: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_03be: ldarg.0
		IL_03bf: ldc.i4.0
		IL_03c0: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)
		IL_03c5: stloc.s 5
		// if (itemSlot != null && !forceSlot)
		IL_03c7: ldloc.s 5
		IL_03c9: ldnull
		IL_03ca: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_03cf: brfalse.s IL_03e1

		IL_03d1: ldarg.1
		IL_03d2: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Implicit(class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_03d7: brtrue.s IL_03e1

		// itemSlot.OneFrameForceHighlight = true;
		IL_03d9: ldloc.s 5
		IL_03db: ldc.i4.1
		IL_03dc: callvirt instance void MGSC.ItemSlot::set_OneFrameForceHighlight(bool)

		// ResetDragState();
		IL_03e1: ldarg.0
		IL_03e2: call instance void MGSC.DragController::ResetDragState()
		// bool flag = false;
		IL_03e7: ret

		IL_03e8: ldc.i4.0
		IL_03e9: stloc.1
		// InventoryInteractionType interactionType = InventoryInteractionType.None;
		IL_03ea: ldc.i4.0
		IL_03eb: stloc.2
		// switch (_dragMode)
		IL_03ec: ldarg.0
		IL_03ed: ldfld valuetype MGSC.DragMode MGSC.DragController::_dragMode
		IL_03f2: stloc.s 6
		// (no C# code)
		IL_03f4: ldloc.s 6
		IL_03f6: ldc.i4.1
		IL_03f7: beq.s IL_0400

		IL_03f9: ldloc.s 6
		IL_03fb: ldc.i4.2
		IL_03fc: beq.s IL_0411

		// flag = InteractWithOtherSlot(SlotUnderCursor, out interactionType);
		IL_03fe: br.s IL_0420

		IL_0400: ldarg.0
		IL_0401: ldarg.0
		IL_0402: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0407: ldloca.s 2
		IL_0409: call instance bool MGSC.DragController::InteractWithOtherSlot(class MGSC.ItemSlot, valuetype MGSC.InventoryInteractionType&)
		IL_040e: stloc.1
		// break;
		IL_040f: br.s IL_0420

		// flag = RepairOtherSlot(SlotUnderCursor);
		IL_0411: ldarg.0
		IL_0412: ldarg.0
		IL_0413: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0418: call instance bool MGSC.DragController::RepairOtherSlot(class MGSC.ItemSlot)
		IL_041d: stloc.1
		// interactionType = InventoryInteractionType.Repair;
		IL_041e: ldc.i4.2
		IL_041f: stloc.2

		// if (flag)
		IL_0420: ldloc.1
		IL_0421: brfalse.s IL_0435

		// _interactionCallback?.Invoke(interactionType);
		IL_0423: ldarg.0
		IL_0424: ldfld class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType> MGSC.DragController::_interactionCallback
		IL_0429: dup
		IL_042a: brtrue.s IL_042f

		// (no C# code)
		IL_042c: pop
		IL_042d: br.s IL_0435

		IL_042f: ldloc.2
		// if (!flag && !SlotUnderCursor.Item.Locked && !SlotUnderCursor.Item.IsImplicit && SlotUnderCursor.Storage.CanPutItemIfIgnore(_draggableItem, SlotUnderCursor.Item, SlotUnderCursor.Item.InventoryPos, hasSpecialPos: true))
		IL_0430: callvirt instance void class [mscorlib]System.Action`1<valuetype MGSC.InventoryInteractionType>::Invoke(!0)

		IL_0435: ldloc.1
		IL_0436: brtrue IL_056c

		IL_043b: ldarg.0
		IL_043c: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0441: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0446: callvirt instance bool MGSC.BasePickupItem::get_Locked()
		IL_044b: brtrue IL_056c

		// (no C# code)
		IL_0450: ldarg.0
		IL_0451: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0456: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_045b: callvirt instance bool MGSC.BasePickupItem::get_IsImplicit()
		IL_0460: brtrue IL_056c

		// BasePickupItem item = SlotUnderCursor.Item;
		IL_0465: ldarg.0
		IL_0466: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_046b: callvirt instance class MGSC.ItemStorage MGSC.ItemSlot::get_Storage()
		IL_0470: ldarg.0
		IL_0471: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0476: ldarg.0
		IL_0477: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_047c: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0481: ldarg.0
		IL_0482: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_0487: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_048c: ldfld valuetype MGSC.CellPosition MGSC.BasePickupItem::InventoryPos
		IL_0491: ldc.i4.1
		IL_0492: callvirt instance bool MGSC.ItemStorage::CanPutItemIfIgnore(class MGSC.BasePickupItem, class MGSC.BasePickupItem, valuetype MGSC.CellPosition, bool)
		IL_0497: brfalse IL_056c

		IL_049c: ldarg.0
		IL_049d: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_04a2: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_04a7: stloc.s 7
		// ItemStorage storage = item.Storage;
		IL_04a9: ldloc.s 7
		IL_04ab: callvirt instance class MGSC.ItemStorage MGSC.BasePickupItem::get_Storage()
		IL_04b0: stloc.s 8
		// CellPosition inventoryPos = item.InventoryPos;
		IL_04b2: ldloc.s 7
		IL_04b4: ldfld valuetype MGSC.CellPosition MGSC.BasePickupItem::InventoryPos
		IL_04b9: stloc.s 9
		// if (!SlotUnderCursor.Storage.SwitchItems(SlotUnderCursor.Item, _draggableItem))
		IL_04bb: ldarg.0
		IL_04bc: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_04c1: callvirt instance class MGSC.ItemStorage MGSC.ItemSlot::get_Storage()
		IL_04c6: ldarg.0
		IL_04c7: call instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		IL_04cc: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_04d1: ldarg.0
		IL_04d2: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_04d7: callvirt instance bool MGSC.ItemStorage::SwitchItems(class MGSC.BasePickupItem, class MGSC.BasePickupItem)
		IL_04dc: brtrue.s IL_0500

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
		IL_04de: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_04e3: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_04e8: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
		IL_04ed: ldc.i4.0
		IL_04ee: ldc.r4 0.0
		IL_04f3: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// ReturnToOriginalStorage();
		IL_04f8: ldarg.0
		IL_04f9: call instance void MGSC.DragController::ReturnToOriginalStorage()
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_04fe: br.s IL_051b

		IL_0500: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0505: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_050a: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_050f: ldc.i4.1
		IL_0510: ldarg.0
		IL_0511: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_0516: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)

		// _draggableItem = item;
		IL_051b: ldarg.0
		IL_051c: ldloc.s 7
		IL_051e: stfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		// _lastStorage = storage;
		IL_0523: ldarg.0
		IL_0524: ldloc.s 8
		IL_0526: stfld class MGSC.ItemStorage MGSC.DragController::_lastStorage
		// _specPosition = inventoryPos;
		IL_052b: ldarg.0
		IL_052c: ldloc.s 9
		IL_052e: stfld valuetype MGSC.CellPosition MGSC.DragController::_specPosition
		// Sprite itemSprite = SingletonMonoBehaviour<ItemFactory>.Instance.ResolveIcon(_draggableItem.View<ItemContentDescriptor>(), 1);
		IL_0533: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.ItemFactory>::get_Instance()
		IL_0538: ldarg.0
		IL_0539: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_053e: callvirt instance !!0 MGSC.BasePickupItem::View<class MGSC.ItemContentDescriptor>()
		IL_0543: ldc.i4.1
		IL_0544: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Sprite MGSC.ItemFactory::ResolveIcon(class MGSC.ItemContentDescriptor, int32)
		IL_0549: stloc.s 10
		// RefreshVisual(itemSprite, visible: true);
		IL_054b: ldarg.0
		IL_054c: ldloc.s 10
		IL_054e: ldc.i4.1
		IL_054f: call instance void MGSC.DragController::RefreshVisual(class [UnityEngine.CoreModule]UnityEngine.Sprite, bool)
		// _refreshCallback?.Invoke();
		IL_0554: ldarg.0
		IL_0555: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_055a: dup
		IL_055b: brtrue.s IL_0560

		// (no C# code)
		IL_055d: pop
		IL_055e: br.s IL_0565

		// EnterSlotUnderCursor();
		IL_0560: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_0565: ldarg.0
		IL_0566: call instance void MGSC.DragController::EnterSlotUnderCursor()
		// if (!flag || _draggableItem.StackCount > 0)
		IL_056b: ret

		IL_056c: ldloc.1
		IL_056d: brfalse.s IL_057d

		IL_056f: ldarg.0
		IL_0570: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0575: callvirt instance int16 MGSC.BasePickupItem::get_StackCount()
		IL_057a: ldc.i4.0
		IL_057b: ble.s IL_05a0

		// if (!flag)
		IL_057d: ldloc.1
		IL_057e: brtrue.s IL_059a

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
		IL_0580: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0585: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_058a: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
		IL_058f: ldc.i4.0
		IL_0590: ldc.r4 0.0
		IL_0595: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)

		// ReturnToOriginalStorage();
		IL_059a: ldarg.0
		IL_059b: call instance void MGSC.DragController::ReturnToOriginalStorage()

		// _refreshCallback?.Invoke();
		IL_05a0: ldarg.0
		IL_05a1: ldfld class [mscorlib]System.Action MGSC.DragController::_refreshCallback
		IL_05a6: dup
		IL_05a7: brtrue.s IL_05ac

		// (no C# code)
		IL_05a9: pop
		IL_05aa: br.s IL_05b1

		// ResetDragState();
		IL_05ac: callvirt instance void [mscorlib]System.Action::Invoke()

		IL_05b1: ldarg.0
		IL_05b2: call instance void MGSC.DragController::ResetDragState()
		// (no C# code)
		IL_05b7: ret
	} // end of method DragController::EndDrag

	.method private hidebysig 
		instance void ResetDragState () cil managed 
	{
		// Method begins at RVA 0xc6f34
		// Header size: 12
		// Code size: 77 (0x4d)
		.maxstack 3
		.locals init (
			[0] class MGSC.Navigable
		)

		// _dragMode = DragMode.None;
		IL_0000: ldarg.0
		IL_0001: ldc.i4.0
		IL_0002: stfld valuetype MGSC.DragMode MGSC.DragController::_dragMode
		// _draggableItem = null;
		IL_0007: ldarg.0
		IL_0008: ldnull
		IL_0009: stfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		// _clickTimer.Pause();
		IL_000e: ldarg.0
		IL_000f: ldfld class MGSC.Timer MGSC.DragController::_clickTimer
		IL_0014: callvirt instance void MGSC.Timer::Pause()
		// UI.Cursor.MakeNormal();
		IL_0019: call class MGSC.CustomCursor MGSC.UI::get_Cursor()
		IL_001e: callvirt instance void MGSC.CustomCursor::MakeNormal()
		// if (SingletonMonoBehaviour<InputController>.Instance.Mode != InputController.InputMode.KeyboardAndMouse)
		IL_0023: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.InputController>::get_Instance()
		IL_0028: callvirt instance valuetype MGSC.InputController/InputMode MGSC.InputController::get_Mode()
		IL_002d: ldc.i4.1
		IL_002e: beq.s IL_0044

		// UI.Navigation.Selected?.Diselect();
		IL_0030: call class MGSC.Navigation MGSC.UI::get_Navigation()
		IL_0035: callvirt instance class MGSC.Navigable MGSC.Navigation::get_Selected()
		IL_003a: stloc.0
		// (no C# code)
		IL_003b: ldloc.0
		IL_003c: brfalse.s IL_0044

		IL_003e: ldloc.0
		// RefreshVisual(null, visible: false);
		IL_003f: callvirt instance void MGSC.Navigable::Diselect()

		IL_0044: ldarg.0
		IL_0045: ldnull
		IL_0046: ldc.i4.0
		IL_0047: call instance void MGSC.DragController::RefreshVisual(class [UnityEngine.CoreModule]UnityEngine.Sprite, bool)
		// }
		IL_004c: ret
	} // end of method DragController::ResetDragState

	.method private hidebysig 
		instance bool RepairOtherSlot (
			class MGSC.ItemSlot otherSlot
		) cil managed 
	{
		// Method begins at RVA 0xc6f90
		// Header size: 12
		// Code size: 339 (0x153)
		.maxstack 4
		.locals init (
			[0] bool,
			[1] class MGSC.RepairDescriptor,
			[2] class MGSC.BasePickupItem
		)

		// if (ItemInteractionSystem.Repair(otherSlot.Item, _draggableItem, _mercenary?.CreatureData.Inventory, out var disassembleToTrash))
		IL_0000: ldarg.1
		IL_0001: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0006: ldarg.0
		IL_0007: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_000c: ldarg.0
		IL_000d: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_0012: dup
		IL_0013: brtrue.s IL_0019

		// if (_mercenary != null)
		IL_0015: pop
		IL_0016: ldnull
		IL_0017: br.s IL_0023

		IL_0019: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_001e: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory

		IL_0023: ldloca.s 0
		IL_0025: call bool MGSC.ItemInteractionSystem::Repair(class MGSC.BasePickupItem, class MGSC.BasePickupItem, class MGSC.Inventory, bool&)
		IL_002a: brfalse.s IL_0096

		IL_002c: ldarg.0
		IL_002d: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_0032: brfalse.s IL_0058

		// _mercenary.CreatureData.RefreshResists();
		IL_0034: ldarg.0
		IL_0035: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_003a: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_003f: callvirt instance void MGSC.CreatureData::RefreshResists()
		// PerkSystem.RaisePerkAction(PerkLevelUpActionType.RepairItem, _mercenary, _perkFactory);
		IL_0044: ldc.i4.s 79
		IL_0046: ldarg.0
		IL_0047: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_004c: ldarg.0
		IL_004d: ldfld class MGSC.PerkFactory MGSC.DragController::_perkFactory
		IL_0052: ldc.i4.m1
		IL_0053: call void MGSC.PerkSystem::RaisePerkAction(valuetype MGSC.PerkLevelUpActionType, class MGSC.Mercenary, class MGSC.PerkFactory, int32)

		// RepairDescriptor repairDescriptor = _draggableItem.View<RepairDescriptor>();
		IL_0058: ldarg.0
		IL_0059: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_005e: callvirt instance !!0 MGSC.BasePickupItem::View<class MGSC.RepairDescriptor>()
		IL_0063: stloc.1
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound((repairDescriptor.CustomUseSound == null) ? SingletonMonoBehaviour<SoundsStorage>.Instance.Repair : repairDescriptor.CustomUseSound);
		IL_0064: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0069: ldloc.1
		IL_006a: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.RepairDescriptor::CustomUseSound
		IL_006f: ldnull
		IL_0070: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_0075: brtrue.s IL_007f

		IL_0077: ldloc.1
		IL_0078: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.RepairDescriptor::CustomUseSound
		IL_007d: br.s IL_0089

		IL_007f: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_0084: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::Repair

		IL_0089: ldc.i4.0
		IL_008a: ldc.r4 0.0
		// return true;
		IL_008f: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		IL_0094: ldc.i4.1
		IL_0095: ret

		// if (disassembleToTrash)
		IL_0096: ldloc.0
		IL_0097: brfalse IL_0137

		// otherSlot.Storage?.Remove(otherSlot.Item);
		IL_009c: ldarg.1
		IL_009d: callvirt instance class MGSC.ItemStorage MGSC.ItemSlot::get_Storage()
		IL_00a2: dup
		IL_00a3: brtrue.s IL_00a8

		// (no C# code)
		IL_00a5: pop
		IL_00a6: br.s IL_00b4

		IL_00a8: ldarg.1
		IL_00a9: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_00ae: ldc.i4.1
		// BasePickupItem basePickupItem = SingletonMonoBehaviour<ItemFactory>.Instance.CreateForInventory(Data.Global.BrokenWeaponItemId);
		IL_00af: call instance void MGSC.ItemStorage::Remove(class MGSC.BasePickupItem, bool)

		IL_00b4: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.ItemFactory>::get_Instance()
		IL_00b9: call class MGSC.GlobalSettings MGSC.Data::get_Global()
		IL_00be: callvirt instance string MGSC.GlobalSettings::get_BrokenWeaponItemId()
		IL_00c3: ldc.i4.0
		IL_00c4: callvirt instance class MGSC.BasePickupItem MGSC.ItemFactory::CreateForInventory(string, bool)
		IL_00c9: stloc.2
		// basePickupItem.StackCount = 1;
		IL_00ca: ldloc.2
		IL_00cb: ldc.i4.1
		IL_00cc: callvirt instance void MGSC.BasePickupItem::set_StackCount(int16)
		// if (_mercenary == null || !_mercenary.CreatureData.Inventory.TakeOrEquip(basePickupItem))
		IL_00d1: ldarg.0
		IL_00d2: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_00d7: brfalse.s IL_00f3

		IL_00d9: ldarg.0
		IL_00da: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_00df: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_00e4: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
		IL_00e9: ldloc.2
		IL_00ea: ldc.i4.0
		IL_00eb: ldc.i4.1
		IL_00ec: callvirt instance bool MGSC.Inventory::TakeOrEquip(class MGSC.BasePickupItem, bool, bool)
		IL_00f1: brtrue.s IL_0105

		// _dropOutsideCallback?.Invoke(basePickupItem);
		IL_00f3: ldarg.0
		IL_00f4: ldfld class [mscorlib]System.Action`1<class MGSC.BasePickupItem> MGSC.DragController::_dropOutsideCallback
		IL_00f9: dup
		IL_00fa: brtrue.s IL_00ff

		// (no C# code)
		IL_00fc: pop
		IL_00fd: br.s IL_0105

		IL_00ff: ldloc.2
		// _mercenary?.CreatureData.RefreshResists();
		IL_0100: callvirt instance void class [mscorlib]System.Action`1<class MGSC.BasePickupItem>::Invoke(!0)

		IL_0105: ldarg.0
		IL_0106: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_010b: dup
		IL_010c: brtrue.s IL_0111

		// (no C# code)
		IL_010e: pop
		IL_010f: br.s IL_011b

		IL_0111: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.WeaponRepairTotalFailure);
		IL_0116: callvirt instance void MGSC.CreatureData::RefreshResists()

		IL_011b: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0120: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_0125: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::WeaponRepairTotalFailure
		IL_012a: ldc.i4.0
		IL_012b: ldc.r4 0.0
		IL_0130: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// return true;
		IL_0135: ldc.i4.1
		IL_0136: ret

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
		IL_0137: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_013c: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_0141: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
		IL_0146: ldc.i4.0
		IL_0147: ldc.r4 0.0
		IL_014c: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// return false;
		IL_0151: ldc.i4.0
		IL_0152: ret
	} // end of method DragController::RepairOtherSlot

	.method private hidebysig 
		instance bool InteractWithOtherSlot (
			class MGSC.ItemSlot otherSlot,
			[out] valuetype MGSC.InventoryInteractionType& interactionType
		) cil managed 
	{
		// Method begins at RVA 0xc70f0
		// Header size: 12
		// Code size: 844 (0x34c)
		.maxstack 5
		.locals init (
			[0] class MGSC.WeaponRecord,
			[1] class MGSC.WeaponComponent,
			[2] class MGSC.WeaponDescriptor,
			[3] class MGSC.AmmoRecord,
			[4] bool,
			[5] class MGSC.Inventory,
			[6] class MGSC.ItemStorage,
			[7] class [UnityEngine.AudioModule]UnityEngine.AudioClip,
			[8] bool,
			[9] class MGSC.WeaponRecord,
			[10] class MGSC.WeaponDescriptor,
			[11] class MGSC.Inventory,
			[12] bool,
			[13] bool
		)

		// interactionType = InventoryInteractionType.None;
		IL_0000: ldarg.2
		IL_0001: ldc.i4.0
		IL_0002: stind.i4
		// if (otherSlot.Item.Locked)
		IL_0003: ldarg.1
		IL_0004: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0009: callvirt instance bool MGSC.BasePickupItem::get_Locked()
		IL_000e: brfalse.s IL_0012

		// return false;
		IL_0010: ldc.i4.0
		IL_0011: ret

		// if (_draggableItem.Is<AmmoRecord>() && otherSlot.Item.Is<WeaponRecord>())
		IL_0012: ldarg.0
		IL_0013: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0018: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.AmmoRecord>()
		IL_001d: brfalse IL_01e9

		IL_0022: ldarg.1
		IL_0023: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0028: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.WeaponRecord>()
		IL_002d: brfalse IL_01e9

		// WeaponRecord weaponRecord = otherSlot.Item.Record<WeaponRecord>();
		IL_0032: ldarg.1
		IL_0033: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0038: callvirt instance !!0 MGSC.BasePickupItem::Record<class MGSC.WeaponRecord>()
		IL_003d: stloc.0
		// WeaponComponent weaponComponent = otherSlot.Item.Comp<WeaponComponent>();
		IL_003e: ldarg.1
		IL_003f: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0044: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.WeaponComponent>()
		IL_0049: stloc.1
		// BreakableItemComponent breakableItemComponent = otherSlot.Item.Comp<BreakableItemComponent>();
		IL_004a: ldarg.1
		IL_004b: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0050: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.BreakableItemComponent>()
		// WeaponDescriptor weaponDescriptor = otherSlot.Item.View<WeaponDescriptor>();
		IL_0055: ldarg.1
		IL_0056: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_005b: callvirt instance !!0 MGSC.BasePickupItem::View<class MGSC.WeaponDescriptor>()
		IL_0060: stloc.2
		// AmmoRecord ammoRecord = _draggableItem.Record<AmmoRecord>();
		IL_0061: ldarg.0
		IL_0062: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0067: callvirt instance !!0 MGSC.BasePickupItem::Record<class MGSC.AmmoRecord>()
		IL_006c: stloc.3
		// ItemTraitSystem.TryGetValue<bool>(weaponComponent.Traits, "BSelfcharging", out var value);
		IL_006d: ldloc.1
		IL_006e: callvirt instance class [mscorlib]System.Collections.Generic.List`1<class MGSC.ItemTrait> MGSC.WeaponComponent::get_Traits()
		IL_0073: ldstr "BSelfcharging"
		IL_0078: ldloca.s 4
		IL_007a: call bool MGSC.ItemTraitSystem::TryGetValue<bool>(class [mscorlib]System.Collections.Generic.List`1<class MGSC.ItemTrait>, string, !!0&)
		IL_007f: pop
		// if (breakableItemComponent.IsBroken || weaponRecord.WeaponClass == WeaponClass.GrenadeLauncher || value)
		IL_0080: callvirt instance bool MGSC.BreakableItemComponent::get_IsBroken()
		IL_0085: brtrue.s IL_0093

		IL_0087: ldloc.0
		IL_0088: callvirt instance valuetype MGSC.WeaponClass MGSC.WeaponRecord::get_WeaponClass()
		IL_008d: ldc.i4.s 31
		IL_008f: ceq
		IL_0091: br.s IL_0094

		// return false;
		IL_0093: ldc.i4.1

		IL_0094: ldloc.s 4
		IL_0096: or
		IL_0097: brfalse.s IL_009b

		IL_0099: ldc.i4.0
		IL_009a: ret

		// if (!weaponComponent.CurrentAmmoType.Id.Equals(_draggableItem.Id) && weaponComponent.CurrentAmmoType.AmmoType.Equals(ammoRecord.AmmoType))
		IL_009b: ldloc.1
		IL_009c: callvirt instance class MGSC.AmmoRecord MGSC.WeaponComponent::get_CurrentAmmoType()
		IL_00a1: callvirt instance string MGSC.ConfigTableRecord::get_Id()
		IL_00a6: ldarg.0
		IL_00a7: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_00ac: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_00b1: callvirt instance bool [mscorlib]System.String::Equals(string)
		IL_00b6: brtrue IL_0156

		IL_00bb: ldloc.1
		IL_00bc: callvirt instance class MGSC.AmmoRecord MGSC.WeaponComponent::get_CurrentAmmoType()
		IL_00c1: callvirt instance string MGSC.AmmoRecord::get_AmmoType()
		IL_00c6: ldloc.3
		IL_00c7: callvirt instance string MGSC.AmmoRecord::get_AmmoType()
		IL_00cc: callvirt instance bool [mscorlib]System.String::Equals(string)
		IL_00d1: brfalse IL_0156

		// ItemStorage itemStorage = new ItemStorage(ItemStorageSource.ShipCargo, 2, 1);
		IL_00d6: ldc.i4.s 11
		IL_00d8: ldc.i4.2
		IL_00d9: ldc.i4.1
		IL_00da: ldnull
		IL_00db: ldc.i4.0
		IL_00dc: newobj instance void MGSC.ItemStorage::.ctor(valuetype MGSC.ItemStorageSource, int32, int32, class [mscorlib]System.Type, valuetype MGSC.ItemStorageWorkMode)
		IL_00e1: stloc.s 6
		// AudioClip clip = (ItemInteractionSystem.UnloadWeapon(otherSlot.Item, _mercenary?.CreatureData.Inventory, itemStorage) ? SingletonMonoBehaviour<SoundsStorage>.Instance.AmmoReceived : SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
		IL_00e3: ldarg.1
		IL_00e4: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_00e9: ldarg.0
		IL_00ea: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_00ef: dup
		IL_00f0: brtrue.s IL_00f6

		// (no C# code)
		IL_00f2: pop
		IL_00f3: ldnull
		IL_00f4: br.s IL_0100

		IL_00f6: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_00fb: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory

		IL_0100: ldloc.s 6
		IL_0102: call bool MGSC.ItemInteractionSystem::UnloadWeapon(class MGSC.BasePickupItem, class MGSC.Inventory, class MGSC.ItemStorage)
		IL_0107: brtrue.s IL_0115

		IL_0109: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_010e: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
		IL_0113: br.s IL_011f

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(clip);
		IL_0115: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_011a: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::AmmoReceived

		IL_011f: stloc.s 7
		IL_0121: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0126: ldloc.s 7
		IL_0128: ldc.i4.0
		IL_0129: ldc.r4 0.0
		IL_012e: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// _dropOutsideCallback?.Invoke(itemStorage.First);
		IL_0133: br.s IL_014d
		// loop start (head: IL_014d)
			IL_0135: ldarg.0
			IL_0136: ldfld class [mscorlib]System.Action`1<class MGSC.BasePickupItem> MGSC.DragController::_dropOutsideCallback
			IL_013b: dup
			IL_013c: brtrue.s IL_0141

			// while (!itemStorage.Empty)
			IL_013e: pop
			IL_013f: br.s IL_014d

			IL_0141: ldloc.s 6
			IL_0143: callvirt instance class MGSC.BasePickupItem MGSC.ItemStorage::get_First()
			// (no C# code)
			IL_0148: callvirt instance void class [mscorlib]System.Action`1<class MGSC.BasePickupItem>::Invoke(!0)

			// Inventory inventoryController = _mercenary?.CreatureData.Inventory;
			IL_014d: ldloc.s 6
			IL_014f: callvirt instance bool MGSC.ItemStorage::get_Empty()
			IL_0154: brfalse.s IL_0135
		// end loop

		IL_0156: ldarg.0
		IL_0157: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_015c: dup
		IL_015d: brtrue.s IL_0163

		// (no C# code)
		IL_015f: pop
		// if (_reloadMode == DragReloadMode.AllWeapons)
		IL_0160: ldnull
		IL_0161: br.s IL_016d

		IL_0163: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_0168: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory

		IL_016d: stloc.s 5
		IL_016f: ldarg.0
		IL_0170: ldfld valuetype MGSC.DragReloadMode MGSC.DragController::_reloadMode
		IL_0175: ldc.i4.1
		IL_0176: bne.un.s IL_017b

		// inventoryController = null;
		IL_0178: ldnull
		IL_0179: stloc.s 5

		// if (ReloadWeaponSystem.CanReload(inventoryController, otherSlot.Item, _draggableItem))
		IL_017b: ldloc.s 5
		IL_017d: ldarg.1
		IL_017e: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0183: ldarg.0
		IL_0184: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0189: call bool MGSC.ReloadWeaponSystem::CanReload(class MGSC.Inventory, class MGSC.BasePickupItem, class MGSC.BasePickupItem)
		IL_018e: brfalse.s IL_01e7

		// bool emptyAfterMerge = false;
		IL_0190: ldc.i4.0
		IL_0191: stloc.s 8
		// if (_reloadMode == DragReloadMode.AllWeapons)
		IL_0193: ldarg.0
		IL_0194: ldfld valuetype MGSC.DragReloadMode MGSC.DragController::_reloadMode
		IL_0199: ldc.i4.1
		IL_019a: bne.un.s IL_01b1

		// ReloadWeaponSystem.Reload(otherSlot.Item, _draggableItem, ref emptyAfterMerge, allowChangeAmmoType: true, ignoreOneClipReload: true);
		IL_019c: ldarg.1
		IL_019d: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_01a2: ldarg.0
		IL_01a3: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_01a8: ldloca.s 8
		IL_01aa: ldc.i4.1
		IL_01ab: ldc.i4.1
		IL_01ac: call void MGSC.ReloadWeaponSystem::Reload(class MGSC.BasePickupItem, class MGSC.BasePickupItem, bool&, bool, bool)

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUISound(weaponDescriptor.RandomReloadSoundBank);
		IL_01b1: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_01b6: ldloc.2
		IL_01b7: callvirt instance class MGSC.SoundBank MGSC.WeaponDescriptor::get_RandomReloadSoundBank()
		IL_01bc: ldc.i4.0
		IL_01bd: ldc.r4 0.0
		IL_01c2: callvirt instance void MGSC.SoundController::PlayUISound(class MGSC.SoundBank, bool, float32)
		// interactionType = InventoryInteractionType.ReloadWeapon;
		IL_01c7: ldarg.2
		IL_01c8: ldc.i4.3
		IL_01c9: stind.i4
		// _mercenary?.CreatureData.Inventory.RecalculateCurrentWeight();
		IL_01ca: ldarg.0
		IL_01cb: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_01d0: dup
		IL_01d1: brtrue.s IL_01d6

		// (no C# code)
		IL_01d3: pop
		IL_01d4: br.s IL_01e5

		IL_01d6: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_01db: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
		// return true;
		IL_01e0: callvirt instance void MGSC.Inventory::RecalculateCurrentWeight()

		IL_01e5: ldc.i4.1
		IL_01e6: ret

		// return false;
		IL_01e7: ldc.i4.0
		IL_01e8: ret

		// if (_draggableItem.Is<GrenadeRecord>() && otherSlot.Item.Is<WeaponRecord>())
		IL_01e9: ldarg.0
		IL_01ea: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_01ef: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.GrenadeRecord>()
		IL_01f4: brfalse IL_02d5

		IL_01f9: ldarg.1
		IL_01fa: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_01ff: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.WeaponRecord>()
		IL_0204: brfalse IL_02d5

		// WeaponRecord weaponRecord2 = otherSlot.Item.Record<WeaponRecord>();
		IL_0209: ldarg.1
		IL_020a: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_020f: callvirt instance !!0 MGSC.BasePickupItem::Record<class MGSC.WeaponRecord>()
		IL_0214: stloc.s 9
		// BreakableItemComponent breakableItemComponent2 = otherSlot.Item.Comp<BreakableItemComponent>();
		IL_0216: ldarg.1
		IL_0217: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_021c: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.BreakableItemComponent>()
		// WeaponDescriptor weaponDescriptor2 = otherSlot.Item.View<WeaponDescriptor>();
		IL_0221: ldarg.1
		IL_0222: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0227: callvirt instance !!0 MGSC.BasePickupItem::View<class MGSC.WeaponDescriptor>()
		IL_022c: stloc.s 10
		// if (breakableItemComponent2.IsBroken || weaponRecord2.WeaponClass != WeaponClass.GrenadeLauncher)
		IL_022e: callvirt instance bool MGSC.BreakableItemComponent::get_IsBroken()
		IL_0233: brtrue.s IL_0240

		IL_0235: ldloc.s 9
		IL_0237: callvirt instance valuetype MGSC.WeaponClass MGSC.WeaponRecord::get_WeaponClass()
		IL_023c: ldc.i4.s 31
		IL_023e: beq.s IL_0242

		// return false;
		IL_0240: ldc.i4.0
		IL_0241: ret

		// Inventory inventoryController2 = _mercenary?.CreatureData.Inventory;
		IL_0242: ldarg.0
		IL_0243: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_0248: dup
		IL_0249: brtrue.s IL_024f

		// (no C# code)
		IL_024b: pop
		// if (_reloadMode == DragReloadMode.AllWeapons)
		IL_024c: ldnull
		IL_024d: br.s IL_0259

		IL_024f: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_0254: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory

		IL_0259: stloc.s 11
		IL_025b: ldarg.0
		IL_025c: ldfld valuetype MGSC.DragReloadMode MGSC.DragController::_reloadMode
		IL_0261: ldc.i4.1
		IL_0262: bne.un.s IL_0267

		// inventoryController2 = null;
		IL_0264: ldnull
		IL_0265: stloc.s 11

		// if (ReloadLauncherSystem.CanReload(inventoryController2, otherSlot.Item, _draggableItem))
		IL_0267: ldloc.s 11
		IL_0269: ldarg.1
		IL_026a: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_026f: ldarg.0
		IL_0270: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0275: call bool MGSC.ReloadLauncherSystem::CanReload(class MGSC.Inventory, class MGSC.BasePickupItem, class MGSC.BasePickupItem)
		IL_027a: brfalse.s IL_02d3

		// bool emptyAfterMerge2 = false;
		IL_027c: ldc.i4.0
		IL_027d: stloc.s 12
		// if (_reloadMode == DragReloadMode.AllWeapons)
		IL_027f: ldarg.0
		IL_0280: ldfld valuetype MGSC.DragReloadMode MGSC.DragController::_reloadMode
		IL_0285: ldc.i4.1
		IL_0286: bne.un.s IL_029c

		// ReloadLauncherSystem.Reload(otherSlot.Item, _draggableItem, ref emptyAfterMerge2, ignoreOneClipReload: true);
		IL_0288: ldarg.1
		IL_0289: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_028e: ldarg.0
		IL_028f: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0294: ldloca.s 12
		IL_0296: ldc.i4.1
		IL_0297: call void MGSC.ReloadLauncherSystem::Reload(class MGSC.BasePickupItem, class MGSC.BasePickupItem, bool&, bool)

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUISound(weaponDescriptor2.RandomReloadSoundBank);
		IL_029c: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_02a1: ldloc.s 10
		IL_02a3: callvirt instance class MGSC.SoundBank MGSC.WeaponDescriptor::get_RandomReloadSoundBank()
		IL_02a8: ldc.i4.0
		IL_02a9: ldc.r4 0.0
		IL_02ae: callvirt instance void MGSC.SoundController::PlayUISound(class MGSC.SoundBank, bool, float32)
		// interactionType = InventoryInteractionType.ReloadWeapon;
		IL_02b3: ldarg.2
		IL_02b4: ldc.i4.3
		IL_02b5: stind.i4
		// _mercenary?.CreatureData.Inventory.RecalculateCurrentWeight();
		IL_02b6: ldarg.0
		IL_02b7: ldfld class MGSC.Mercenary MGSC.DragController::_mercenary
		IL_02bc: dup
		IL_02bd: brtrue.s IL_02c2

		// (no C# code)
		IL_02bf: pop
		IL_02c0: br.s IL_02d1

		IL_02c2: ldfld class MGSC.CreatureData MGSC.Mercenary::CreatureData
		IL_02c7: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
		// return true;
		IL_02cc: callvirt instance void MGSC.Inventory::RecalculateCurrentWeight()

		IL_02d1: ldc.i4.1
		IL_02d2: ret

		// return false;
		IL_02d3: ldc.i4.0
		IL_02d4: ret

		// if (_draggableItem.Id.Equals(otherSlot.Item.Id))
		IL_02d5: ldarg.0
		IL_02d6: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_02db: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_02e0: ldarg.1
		IL_02e1: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_02e6: callvirt instance string MGSC.BasePickupItem::get_Id()
		IL_02eb: callvirt instance bool [mscorlib]System.String::Equals(string)
		IL_02f0: brfalse.s IL_0332

		// bool emptyAfterMerge3 = false;
		IL_02f2: ldc.i4.0
		IL_02f3: stloc.s 13
		// if (ItemInteractionSystem.Merge(_spaceTime, _draggableItem, otherSlot.Item, ref emptyAfterMerge3))
		IL_02f5: ldarg.0
		IL_02f6: ldfld class MGSC.SpaceTime MGSC.DragController::_spaceTime
		IL_02fb: ldarg.0
		IL_02fc: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0301: ldarg.1
		IL_0302: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
		IL_0307: ldloca.s 13
		IL_0309: call bool MGSC.ItemInteractionSystem::Merge(class MGSC.SpaceTime, class MGSC.BasePickupItem, class MGSC.BasePickupItem, bool&)
		IL_030e: brfalse.s IL_0330

		// SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.TakeItem, isUnique: true, _takeItemPauseAfter);
		IL_0310: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
		IL_0315: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
		IL_031a: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::TakeItem
		IL_031f: ldc.i4.1
		IL_0320: ldarg.0
		IL_0321: ldfld float32 MGSC.DragController::_takeItemPauseAfter
		IL_0326: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
		// interactionType = InventoryInteractionType.MergeItems;
		IL_032b: ldarg.2
		IL_032c: ldc.i4.4
		IL_032d: stind.i4
		// return true;
		IL_032e: ldc.i4.1
		IL_032f: ret

		// return false;
		IL_0330: ldc.i4.0
		IL_0331: ret

		// if (_draggableItem.Is<RepairRecord>())
		IL_0332: ldarg.0
		IL_0333: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_0338: callvirt instance bool MGSC.BasePickupItem::Is<class MGSC.RepairRecord>()
		IL_033d: brfalse.s IL_034a

		// interactionType = InventoryInteractionType.Repair;
		IL_033f: ldarg.2
		IL_0340: ldc.i4.2
		IL_0341: stind.i4
		// return RepairOtherSlot(otherSlot);
		IL_0342: ldarg.0
		IL_0343: ldarg.1
		IL_0344: call instance bool MGSC.DragController::RepairOtherSlot(class MGSC.ItemSlot)
		IL_0349: ret

		// return false;
		IL_034a: ldc.i4.0
		IL_034b: ret
	} // end of method DragController::InteractWithOtherSlot

	.method private hidebysig 
		instance void ReturnToOriginalStorage () cil managed 
	{
		// Method begins at RVA 0xc7448
		// Header size: 1
		// Code size: 51 (0x33)
		.maxstack 8

		// if (!_lastStorage.TryPutItem(_draggableItem, _specPosition, hasSpecialPos: true))
		IL_0000: ldarg.0
		IL_0001: ldfld class MGSC.ItemStorage MGSC.DragController::_lastStorage
		IL_0006: ldarg.0
		IL_0007: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_000c: ldarg.0
		IL_000d: ldfld valuetype MGSC.CellPosition MGSC.DragController::_specPosition
		IL_0012: ldc.i4.1
		IL_0013: ldc.i4.1
		IL_0014: callvirt instance bool MGSC.ItemStorage::TryPutItem(class MGSC.BasePickupItem, valuetype MGSC.CellPosition, bool, bool)
		IL_0019: brfalse.s IL_001c

		// }
		IL_001b: ret

		// _dropOutsideCallback?.Invoke(_draggableItem);
		IL_001c: ldarg.0
		IL_001d: ldfld class [mscorlib]System.Action`1<class MGSC.BasePickupItem> MGSC.DragController::_dropOutsideCallback
		// (no C# code)
		IL_0022: dup
		IL_0023: brtrue.s IL_0027

		IL_0025: pop
		IL_0026: ret

		IL_0027: ldarg.0
		IL_0028: ldfld class MGSC.BasePickupItem MGSC.DragController::_draggableItem
		IL_002d: callvirt instance void class [mscorlib]System.Action`1<class MGSC.BasePickupItem>::Invoke(!0)
		IL_0032: ret
	} // end of method DragController::ReturnToOriginalStorage

	.method private hidebysig 
		instance void RefreshVisual (
			class [UnityEngine.CoreModule]UnityEngine.Sprite itemSprite,
			bool visible
		) cil managed 
	{
		// Method begins at RVA 0xc747c
		// Header size: 1
		// Code size: 41 (0x29)
		.maxstack 8

		// _dragItemIcon.sprite = itemSprite;
		IL_0000: ldarg.0
		IL_0001: ldfld class [UnityEngine.UI]UnityEngine.UI.Image MGSC.DragController::_dragItemIcon
		IL_0006: ldarg.1
		IL_0007: callvirt instance void [UnityEngine.UI]UnityEngine.UI.Image::set_sprite(class [UnityEngine.CoreModule]UnityEngine.Sprite)
		// _dragItemIcon.SetNativeSizeX100();
		IL_000c: ldarg.0
		IL_000d: ldfld class [UnityEngine.UI]UnityEngine.UI.Image MGSC.DragController::_dragItemIcon
		IL_0012: call void MGSC.UIHelper::SetNativeSizeX100(class [UnityEngine.UI]UnityEngine.UI.Image)
		// _dragTarget.gameObject.SetActive(visible);
		IL_0017: ldarg.0
		IL_0018: ldfld class [UnityEngine.CoreModule]UnityEngine.RectTransform MGSC.DragController::_dragTarget
		IL_001d: callvirt instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.CoreModule]UnityEngine.Component::get_gameObject()
		IL_0022: ldarg.2
		IL_0023: callvirt instance void [UnityEngine.CoreModule]UnityEngine.GameObject::SetActive(bool)
		// }
		IL_0028: ret
	} // end of method DragController::RefreshVisual

	.method private hidebysig 
		instance void RefreshPosition () cil managed 
	{
		// Method begins at RVA 0xc74a8
		// Header size: 12
		// Code size: 108 (0x6c)
		.maxstack 4
		.locals init (
			[0] valuetype [UnityEngine.CoreModule]UnityEngine.Vector3,
			[1] valuetype [UnityEngine.CoreModule]UnityEngine.Vector2,
			[2] class MGSC.Navigable
		)

		// if (SingletonMonoBehaviour<InputController>.Instance.Mode == InputController.InputMode.KeyboardAndMouse)
		IL_0000: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.InputController>::get_Instance()
		IL_0005: callvirt instance valuetype MGSC.InputController/InputMode MGSC.InputController::get_Mode()
		IL_000a: ldc.i4.1
		IL_000b: bne.un.s IL_003a

		// Vector3 mousePosition = Input.mousePosition;
		IL_000d: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.InputLegacyModule]UnityEngine.Input::get_mousePosition()
		IL_0012: stloc.0
		// RectTransformUtility.ScreenPointToLocalPointInRectangle(_screenRoot, mousePosition, null, out var localPoint);
		IL_0013: ldarg.0
		IL_0014: ldfld class [UnityEngine.CoreModule]UnityEngine.RectTransform MGSC.DragController::_screenRoot
		IL_0019: ldloc.0
		IL_001a: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		IL_001f: ldnull
		IL_0020: ldloca.s 1
		IL_0022: call bool [UnityEngine.UIModule]UnityEngine.RectTransformUtility::ScreenPointToLocalPointInRectangle(class [UnityEngine.CoreModule]UnityEngine.RectTransform, valuetype [UnityEngine.CoreModule]UnityEngine.Vector2, class [UnityEngine.CoreModule]UnityEngine.Camera, valuetype [UnityEngine.CoreModule]UnityEngine.Vector2&)
		IL_0027: pop
		// _dragTarget.localPosition = localPoint;
		IL_0028: ldarg.0
		IL_0029: ldfld class [UnityEngine.CoreModule]UnityEngine.RectTransform MGSC.DragController::_dragTarget
		IL_002e: ldloc.1
		IL_002f: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
		IL_0034: callvirt instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_localPosition(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		// }
		IL_0039: ret

		// Navigable selected = UI.Navigation.Selected;
		IL_003a: call class MGSC.Navigation MGSC.UI::get_Navigation()
		IL_003f: callvirt instance class MGSC.Navigable MGSC.Navigation::get_Selected()
		IL_0044: stloc.2
		// if (selected is ItemSlot || selected is ItemTab)
		IL_0045: ldloc.2
		IL_0046: isinst MGSC.ItemSlot
		IL_004b: brtrue.s IL_0055

		IL_004d: ldloc.2
		IL_004e: isinst MGSC.ItemTab
		IL_0053: brfalse.s IL_006b

		// _dragTarget.position = selected.transform.GetCenterPosition();
		IL_0055: ldarg.0
		IL_0056: ldfld class [UnityEngine.CoreModule]UnityEngine.RectTransform MGSC.DragController::_dragTarget
		IL_005b: ldloc.2
		IL_005c: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
		IL_0061: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 MGSC.UnityHelper::GetCenterPosition(class [UnityEngine.CoreModule]UnityEngine.Transform)
		IL_0066: callvirt instance void [UnityEngine.CoreModule]UnityEngine.Transform::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)

		// (no C# code)
		IL_006b: ret
	} // end of method DragController::RefreshPosition

	.method private hidebysig 
		instance class MGSC.ItemSlot RaycastSlotUnderCursor (
			[opt] bool skipEmpty
		) cil managed 
	{
		.param [1] = bool(true)
		// Method begins at RVA 0xc7520
		// Header size: 12
		// Code size: 188 (0xbc)
		.maxstack 3
		.locals init (
			[0] class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData,
			[1] class MGSC.ItemSlot,
			[2] int32,
			[3] valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult,
			[4] class MGSC.ItemSlot
		)

		// if (SingletonMonoBehaviour<InputController>.Instance.Mode != InputController.InputMode.KeyboardAndMouse)
		IL_0000: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.InputController>::get_Instance()
		IL_0005: callvirt instance valuetype MGSC.InputController/InputMode MGSC.InputController::get_Mode()
		IL_000a: ldc.i4.1
		IL_000b: beq.s IL_0024

		// if (UI.Navigation.Selected is ItemSlot result)
		IL_000d: call class MGSC.Navigation MGSC.UI::get_Navigation()
		IL_0012: callvirt instance class MGSC.Navigable MGSC.Navigation::get_Selected()
		IL_0017: isinst MGSC.ItemSlot
		IL_001c: stloc.1
		// return result;
		IL_001d: ldloc.1
		IL_001e: brfalse.s IL_0022

		IL_0020: ldloc.1
		IL_0021: ret

		// return null;
		IL_0022: ldnull
		IL_0023: ret

		// PointerEventData pointerEventData = new PointerEventData(UI.EventSystem);
		IL_0024: call class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem MGSC.UI::get_EventSystem()
		IL_0029: newobj instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::.ctor(class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem)
		IL_002e: stloc.0
		// pointerEventData.position = Input.mousePosition;
		IL_002f: ldloc.0
		IL_0030: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.InputLegacyModule]UnityEngine.Input::get_mousePosition()
		IL_0035: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		IL_003a: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
		// _raycastResultsCache.Clear();
		IL_003f: ldarg.0
		IL_0040: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0045: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
		// _raycaster.Raycast(pointerEventData, _raycastResultsCache);
		IL_004a: ldarg.0
		IL_004b: ldfld class [UnityEngine.UI]UnityEngine.UI.GraphicRaycaster MGSC.DragController::_raycaster
		IL_0050: ldloc.0
		IL_0051: ldarg.0
		IL_0052: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0057: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.BaseRaycaster::Raycast(class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData, class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>)
		// int num = 0;
		IL_005c: ldc.i4.0
		IL_005d: stloc.2
		// ItemSlot component = _raycastResultsCache[num].gameObject.GetComponent<ItemSlot>();
		IL_005e: br.s IL_00a1
		// loop start (head: IL_00a1)
			IL_0060: ldarg.0
			IL_0061: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0066: ldloc.2
			IL_0067: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::get_Item(int32)
			IL_006c: stloc.3
			// if (!(component == null) && !(component.Item == null && skipEmpty))
			IL_006d: ldloca.s 3
			IL_006f: call instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult::get_gameObject()
			IL_0074: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponent<class MGSC.ItemSlot>()
			IL_0079: stloc.s 4
			IL_007b: ldloc.s 4
			IL_007d: ldnull
			IL_007e: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_0083: brtrue.s IL_00af

			IL_0085: ldloc.s 4
			IL_0087: callvirt instance class MGSC.BasePickupItem MGSC.ItemSlot::get_Item()
			IL_008c: ldnull
			IL_008d: ceq
			IL_008f: ldarg.1
			IL_0090: and
			IL_0091: brtrue.s IL_00af

			// _raycastResultsCache.Clear();
			IL_0093: ldarg.0
			IL_0094: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0099: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
			// return component;
			IL_009e: ldloc.s 4
			IL_00a0: ret

			// if (num < _raycastResultsCache.Count)
			IL_00a1: ldloc.2
			IL_00a2: ldarg.0
			IL_00a3: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_00a8: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::get_Count()
			IL_00ad: blt.s IL_0060
		// end loop

		// _raycastResultsCache.Clear();
		IL_00af: ldarg.0
		IL_00b0: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_00b5: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
		// return null;
		IL_00ba: ldnull
		IL_00bb: ret
	} // end of method DragController::RaycastSlotUnderCursor

	.method private hidebysig 
		instance class MGSC.ItemTab RaycastItemTabUnderCursor () cil managed 
	{
		// Method begins at RVA 0xc75e8
		// Header size: 12
		// Code size: 135 (0x87)
		.maxstack 3
		.locals init (
			[0] class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData,
			[1] int32,
			[2] valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult,
			[3] class MGSC.ItemTab
		)

		// 	PointerEventData eventData = new PointerEventData(UI.EventSystem)
		// 	{
		// 		position = Input.mousePosition
		// 	};
		IL_0000: call class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem MGSC.UI::get_EventSystem()
		IL_0005: newobj instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::.ctor(class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem)
		IL_000a: dup
		IL_000b: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.InputLegacyModule]UnityEngine.Input::get_mousePosition()
		IL_0010: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		IL_0015: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
		IL_001a: stloc.0
		// _raycastResultsCache.Clear();
		IL_001b: ldarg.0
		IL_001c: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0021: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
		// _raycaster.Raycast(eventData, _raycastResultsCache);
		IL_0026: ldarg.0
		IL_0027: ldfld class [UnityEngine.UI]UnityEngine.UI.GraphicRaycaster MGSC.DragController::_raycaster
		IL_002c: ldloc.0
		IL_002d: ldarg.0
		IL_002e: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0033: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.BaseRaycaster::Raycast(class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData, class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>)
		// int num = 0;
		IL_0038: ldc.i4.0
		IL_0039: stloc.1
		// ItemTab component = _raycastResultsCache[num].gameObject.GetComponent<ItemTab>();
		IL_003a: br.s IL_006c
		// loop start (head: IL_006c)
			IL_003c: ldarg.0
			IL_003d: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0042: ldloc.1
			IL_0043: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::get_Item(int32)
			IL_0048: stloc.2
			// if (!(component == null))
			IL_0049: ldloca.s 2
			IL_004b: call instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult::get_gameObject()
			IL_0050: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponent<class MGSC.ItemTab>()
			IL_0055: stloc.3
			IL_0056: ldloc.3
			IL_0057: ldnull
			IL_0058: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_005d: brtrue.s IL_007a

			// _raycastResultsCache.Clear();
			IL_005f: ldarg.0
			IL_0060: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0065: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
			// return component;
			IL_006a: ldloc.3
			IL_006b: ret

			// if (num < _raycastResultsCache.Count)
			IL_006c: ldloc.1
			IL_006d: ldarg.0
			IL_006e: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0073: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::get_Count()
			IL_0078: blt.s IL_003c
		// end loop

		// _raycastResultsCache.Clear();
		IL_007a: ldarg.0
		IL_007b: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0080: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
		// return null;
		IL_0085: ldnull
		IL_0086: ret
	} // end of method DragController::RaycastItemTabUnderCursor

	.method private hidebysig 
		instance class MGSC.ItemGrid RaycastItemGridUnderCursor () cil managed 
	{
		// Method begins at RVA 0xc767c
		// Header size: 12
		// Code size: 165 (0xa5)
		.maxstack 3
		.locals init (
			[0] class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData,
			[1] int32,
			[2] valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult,
			[3] class MGSC.ItemGridScroll
		)

		// if (SingletonMonoBehaviour<InputController>.Instance.Mode != InputController.InputMode.KeyboardAndMouse)
		IL_0000: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.InputController>::get_Instance()
		IL_0005: callvirt instance valuetype MGSC.InputController/InputMode MGSC.InputController::get_Mode()
		IL_000a: ldc.i4.1
		IL_000b: beq.s IL_000f

		// return null;
		IL_000d: ldnull
		IL_000e: ret

		// 	PointerEventData eventData = new PointerEventData(UI.EventSystem)
		// 	{
		// 		position = Input.mousePosition
		// 	};
		IL_000f: call class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem MGSC.UI::get_EventSystem()
		IL_0014: newobj instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::.ctor(class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem)
		IL_0019: dup
		IL_001a: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.InputLegacyModule]UnityEngine.Input::get_mousePosition()
		IL_001f: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		IL_0024: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
		IL_0029: stloc.0
		// _raycastResultsCache.Clear();
		IL_002a: ldarg.0
		IL_002b: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0030: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
		// _raycaster.Raycast(eventData, _raycastResultsCache);
		IL_0035: ldarg.0
		IL_0036: ldfld class [UnityEngine.UI]UnityEngine.UI.GraphicRaycaster MGSC.DragController::_raycaster
		IL_003b: ldloc.0
		IL_003c: ldarg.0
		IL_003d: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0042: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.BaseRaycaster::Raycast(class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData, class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>)
		// int num = 0;
		IL_0047: ldc.i4.0
		IL_0048: stloc.1
		// ItemGridScroll component = _raycastResultsCache[num].gameObject.GetComponent<ItemGridScroll>();
		IL_0049: br.s IL_008a
		// loop start (head: IL_008a)
			IL_004b: ldarg.0
			IL_004c: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0051: ldloc.1
			IL_0052: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::get_Item(int32)
			IL_0057: stloc.2
			// if (!(component == null))
			IL_0058: ldloca.s 2
			IL_005a: call instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult::get_gameObject()
			IL_005f: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponent<class MGSC.ItemGridScroll>()
			IL_0064: stloc.3
			IL_0065: ldloc.3
			IL_0066: ldnull
			IL_0067: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_006c: brtrue.s IL_0098

			// _raycastResultsCache.Clear();
			IL_006e: ldarg.0
			IL_006f: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0074: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
			// return component.transform.parent.GetComponent<ItemGrid>();
			IL_0079: ldloc.3
			IL_007a: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Component::get_transform()
			IL_007f: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Transform [UnityEngine.CoreModule]UnityEngine.Transform::get_parent()
			IL_0084: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.Component::GetComponent<class MGSC.ItemGrid>()
			IL_0089: ret

			// if (num < _raycastResultsCache.Count)
			IL_008a: ldloc.1
			IL_008b: ldarg.0
			IL_008c: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0091: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::get_Count()
			IL_0096: blt.s IL_004b
		// end loop

		// _raycastResultsCache.Clear();
		IL_0098: ldarg.0
		IL_0099: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_009e: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
		// return null;
		IL_00a3: ldnull
		IL_00a4: ret
	} // end of method DragController::RaycastItemGridUnderCursor

	.method private hidebysig 
		instance void EnterSlotUnderCursor () cil managed 
	{
		// Method begins at RVA 0xc7730
		// Header size: 12
		// Code size: 56 (0x38)
		.maxstack 3
		.locals init (
			[0] class MGSC.ItemSlot,
			[1] class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData
		)

		// ItemSlot itemSlot = RaycastSlotUnderCursor(skipEmpty: false);
		IL_0000: ldarg.0
		IL_0001: ldc.i4.0
		IL_0002: call instance class MGSC.ItemSlot MGSC.DragController::RaycastSlotUnderCursor(bool)
		IL_0007: stloc.0
		// if (!(itemSlot == null))
		IL_0008: ldloc.0
		IL_0009: ldnull
		IL_000a: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
		IL_000f: brfalse.s IL_0012

		// }
		IL_0011: ret

		// 		PointerEventData eventData = new PointerEventData(null)
		// 		{
		// 			position = Input.mousePosition
		// 		};
		IL_0012: ldnull
		IL_0013: newobj instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::.ctor(class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem)
		IL_0018: dup
		IL_0019: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.InputLegacyModule]UnityEngine.Input::get_mousePosition()
		IL_001e: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		IL_0023: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
		IL_0028: stloc.1
		// itemSlot.OnPointerEnter(eventData);
		IL_0029: ldloc.0
		IL_002a: ldloc.1
		IL_002b: callvirt instance void MGSC.ItemSlot::OnPointerEnter(class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData)
		// itemSlot.OnPointerMove(eventData);
		IL_0030: ldloc.0
		IL_0031: ldloc.1
		IL_0032: callvirt instance void MGSC.ItemSlot::OnPointerMove(class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData)
		// (no C# code)
		IL_0037: ret
	} // end of method DragController::EnterSlotUnderCursor

	.method private hidebysig 
		instance bool RaycastCargoRemovalUnderCursor () cil managed 
	{
		// Method begins at RVA 0xc7774
		// Header size: 12
		// Code size: 148 (0x94)
		.maxstack 3
		.locals init (
			[0] class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData,
			[1] int32,
			[2] valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult
		)

		// if (SingletonMonoBehaviour<InputController>.Instance.Mode != InputController.InputMode.KeyboardAndMouse)
		IL_0000: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.InputController>::get_Instance()
		IL_0005: callvirt instance valuetype MGSC.InputController/InputMode MGSC.InputController::get_Mode()
		IL_000a: ldc.i4.1
		IL_000b: beq.s IL_000f

		// return false;
		IL_000d: ldc.i4.0
		IL_000e: ret

		// 	PointerEventData eventData = new PointerEventData(UI.EventSystem)
		// 	{
		// 		position = Input.mousePosition
		// 	};
		IL_000f: call class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem MGSC.UI::get_EventSystem()
		IL_0014: newobj instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::.ctor(class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem)
		IL_0019: dup
		IL_001a: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector3 [UnityEngine.InputLegacyModule]UnityEngine.Input::get_mousePosition()
		IL_001f: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::op_Implicit(valuetype [UnityEngine.CoreModule]UnityEngine.Vector3)
		IL_0024: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData::set_position(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
		IL_0029: stloc.0
		// _raycastResultsCache.Clear();
		IL_002a: ldarg.0
		IL_002b: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0030: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
		// _raycaster.Raycast(eventData, _raycastResultsCache);
		IL_0035: ldarg.0
		IL_0036: ldfld class [UnityEngine.UI]UnityEngine.UI.GraphicRaycaster MGSC.DragController::_raycaster
		IL_003b: ldloc.0
		IL_003c: ldarg.0
		IL_003d: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_0042: callvirt instance void [UnityEngine.UI]UnityEngine.EventSystems.BaseRaycaster::Raycast(class [UnityEngine.UI]UnityEngine.EventSystems.PointerEventData, class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>)
		// int num = 0;
		IL_0047: ldc.i4.0
		IL_0048: stloc.1
		// if (num < _raycastResultsCache.Count && !(_raycastResultsCache[num].gameObject.GetComponent<CargoRemovalSlot>() == null))
		IL_0049: br.s IL_0079
		// loop start (head: IL_0079)
			IL_004b: ldarg.0
			IL_004c: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0051: ldloc.1
			IL_0052: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::get_Item(int32)
			IL_0057: stloc.2
			// _raycastResultsCache.Clear();
			IL_0058: ldloca.s 2
			IL_005a: call instance class [UnityEngine.CoreModule]UnityEngine.GameObject [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult::get_gameObject()
			IL_005f: callvirt instance !!0 [UnityEngine.CoreModule]UnityEngine.GameObject::GetComponent<class MGSC.CargoRemovalSlot>()
			IL_0064: ldnull
			IL_0065: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Equality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
			IL_006a: brtrue.s IL_0087

			IL_006c: ldarg.0
			IL_006d: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0072: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
			// return true;
			IL_0077: ldc.i4.1
			IL_0078: ret

			// _raycastResultsCache.Clear();
			IL_0079: ldloc.1
			IL_007a: ldarg.0
			IL_007b: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
			IL_0080: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::get_Count()
			IL_0085: blt.s IL_004b
		// end loop

		IL_0087: ldarg.0
		IL_0088: ldfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		IL_008d: callvirt instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::Clear()
		// return false;
		IL_0092: ldc.i4.0
		IL_0093: ret
	} // end of method DragController::RaycastCargoRemovalUnderCursor

	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0xc7814
		// Header size: 12
		// Code size: 66 (0x42)
		.maxstack 3

		// _takeItemPauseAfter = -0.4f;
		IL_0000: ldarg.0
		IL_0001: ldc.r4 -0.4
		IL_0006: stfld float32 MGSC.DragController::_takeItemPauseAfter
		// _raycastResultsCache = new List<RaycastResult>(10);
		IL_000b: ldarg.0
		IL_000c: ldc.i4.s 10
		IL_000e: newobj instance void class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult>::.ctor(int32)
		IL_0013: stfld class [mscorlib]System.Collections.Generic.List`1<valuetype [UnityEngine.UI]UnityEngine.EventSystems.RaycastResult> MGSC.DragController::_raycastResultsCache
		// _clickTimer = new Timer();
		IL_0018: ldarg.0
		IL_0019: newobj instance void MGSC.Timer::.ctor()
		IL_001e: stfld class MGSC.Timer MGSC.DragController::_clickTimer
		// _pauseTimer = new Timer();
		IL_0023: ldarg.0
		IL_0024: newobj instance void MGSC.Timer::.ctor()
		IL_0029: stfld class MGSC.Timer MGSC.DragController::_pauseTimer
		// _specPosition = new CellPosition(-1, -1);
		IL_002e: ldarg.0
		IL_002f: ldc.i4.m1
		IL_0030: ldc.i4.m1
		IL_0031: newobj instance void MGSC.CellPosition::.ctor(int32, int32)
		IL_0036: stfld valuetype MGSC.CellPosition MGSC.DragController::_specPosition
		// base..ctor();
		IL_003b: ldarg.0
		IL_003c: call instance void [UnityEngine.CoreModule]UnityEngine.MonoBehaviour::.ctor()
		// }
		IL_0041: ret
	} // end of method DragController::.ctor

	// Properties
	.property instance bool IsDragging()
	{
		.get instance bool MGSC.DragController::get_IsDragging()
	}
	.property instance class MGSC.BasePickupItem DraggableItem()
	{
		.get instance class MGSC.BasePickupItem MGSC.DragController::get_DraggableItem()
	}
	.property instance class MGSC.ItemSlot SlotUnderCursor()
	{
		.get instance class MGSC.ItemSlot MGSC.DragController::get_SlotUnderCursor()
		.set instance void MGSC.DragController::set_SlotUnderCursor(class MGSC.ItemSlot)
	}

} // end of class MGSC.DragController

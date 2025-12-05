.method public hidebysig virtual 
	instance void ProcessActionPoint () cil managed 
{
	// Method begins at RVA 0xe178
	// Header size: 12
	// Code size: 694 (0x2b6)
	.maxstack 7
	.locals init (
		[0] int32,
		[1] bool,
		[2] int32,
		[3] int32,
		[4] class MGSC.BasePickupItem,
		[5] uint8
	)

	// if (CreatureData.Health.Dead)
	IL_0000: ldarg.0
	IL_0001: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0006: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
	IL_000b: callvirt instance bool MGSC.HealthInfo::get_Dead()
	IL_0010: brfalse.s IL_001a

	// IsProcessing = false;
	IL_0012: ldarg.0
	IL_0013: ldc.i4.0
	IL_0014: callvirt instance void MGSC.Creature::set_IsProcessing(bool)
	// }
	IL_0019: ret

	// CreatureSystem.RefreshMonstersAndEntitiesFlags(_mapGrid, _creatures, _mapEntities, CreatureData.Position, this);
	IL_001a: ldarg.0
	IL_001b: ldfld class MGSC.MapGrid MGSC.Creature::_mapGrid
	IL_0020: ldarg.0
	IL_0021: ldfld class MGSC.Creatures MGSC.Creature::_creatures
	IL_0026: ldarg.0
	IL_0027: ldfld class MGSC.MapEntities MGSC.Creature::_mapEntities
	IL_002c: ldarg.0
	IL_002d: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0032: ldfld valuetype MGSC.CellPosition MGSC.CreatureData::Position
	IL_0037: ldarg.0
	IL_0038: call void MGSC.CreatureSystem::RefreshMonstersAndEntitiesFlags(class MGSC.MapGrid, class MGSC.Creatures, class MGSC.MapEntities, valuetype MGSC.CellPosition, class MGSC.Creature)
	// CreatureSystem.RefreshPlayerAllyFlags(_creatures, _mapGrid);
	IL_003d: ldarg.0
	IL_003e: ldfld class MGSC.Creatures MGSC.Creature::_creatures
	IL_0043: ldarg.0
	IL_0044: ldfld class MGSC.MapGrid MGSC.Creature::_mapGrid
	IL_0049: call void MGSC.CreatureSystem::RefreshPlayerAllyFlags(class MGSC.Creatures, class MGSC.MapGrid)
	// if (HasSpottedEnemyThisAP)
	IL_004e: ldarg.0
	IL_004f: call instance bool MGSC.Player::get_HasSpottedEnemyThisAP()
	IL_0054: brfalse.s IL_006a

	// _commandQueue.Clear();
	IL_0056: ldarg.0
	IL_0057: ldfld class MGSC.PlayerCommandQueue MGSC.Creature::_commandQueue
	IL_005c: callvirt instance void MGSC.PlayerCommandQueue::Clear()
	// RaisePerkAction(PerkLevelUpActionType.OnEnemySpotted);
	IL_0061: ldarg.0
	IL_0062: ldc.i4.s 77
	IL_0064: ldc.i4.m1
	IL_0065: call instance void MGSC.Player::RaisePerkAction(valuetype MGSC.PerkLevelUpActionType, int32)

	// AnyActionProcessedFlag = false;
	IL_006a: ldarg.0
	IL_006b: ldc.i4.0
	IL_006c: call instance void MGSC.Player::set_AnyActionProcessedFlag(bool)
	// HasSpottedEnemyThisAP = false;
	IL_0071: ldarg.0
	IL_0072: ldc.i4.0
	IL_0073: call instance void MGSC.Player::set_HasSpottedEnemyThisAP(bool)
	// _apRefundPending = false;
	IL_0078: ldarg.0
	IL_0079: ldc.i4.0
	IL_007a: stfld bool MGSC.Player::_apRefundPending
	// int num = (CreatureData.EffectsController.HasAnyEffect<StoneSkin>() ? 1 : MoveSystem.GetMaxActionPoints(base.MovementState, CreatureData));
	IL_007f: ldarg.0
	IL_0080: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0085: ldfld class MGSC.EffectsController MGSC.CreatureData::EffectsController
	IL_008a: callvirt instance bool MGSC.EffectsController::HasAnyEffect<class MGSC.StoneSkin>()
	IL_008f: brtrue.s IL_00a4

	IL_0091: ldarg.0
	IL_0092: call instance valuetype MGSC.CreatureMovementState MGSC.Creature::get_MovementState()
	IL_0097: ldarg.0
	IL_0098: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_009d: call int32 MGSC.MoveSystem::GetMaxActionPoints(valuetype MGSC.CreatureMovementState, class MGSC.CreatureData)
	IL_00a2: br.s IL_00a5

	// if (_actionPointsProcessed == num)
	IL_00a4: ldc.i4.1

	IL_00a5: stloc.0
	IL_00a6: ldarg.0
	IL_00a7: ldfld int32 MGSC.Creature::_actionPointsProcessed
	IL_00ac: ldloc.0
	IL_00ad: bne.un.s IL_00be

	// IsProcessing = false;
	IL_00af: ldarg.0
	IL_00b0: ldc.i4.0
	IL_00b1: callvirt instance void MGSC.Creature::set_IsProcessing(bool)
	// _actionPointsProcessed = num;
	IL_00b6: ldarg.0
	IL_00b7: ldloc.0
	IL_00b8: stfld int32 MGSC.Creature::_actionPointsProcessed
	// if (CreatureData.Health.Alive && base.ActionPointsProcessed == 0 && !_apRefundGranted)
	IL_00bd: ret

	IL_00be: ldarg.0
	IL_00bf: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_00c4: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
	IL_00c9: callvirt instance bool MGSC.HealthInfo::get_Alive()
	IL_00ce: brfalse.s IL_0124

	IL_00d0: ldarg.0
	IL_00d1: call instance int32 MGSC.Creature::get_ActionPointsProcessed()
	IL_00d6: brtrue.s IL_0124

	// int num2 = CreatureData.GetHealthRegenBonus() + Mathf.RoundToInt((float)CreatureData.Health.MaxValue * CreatureData.GetMaxHealthRegenPercentMult());
	IL_00d8: ldarg.0
	IL_00d9: ldfld bool MGSC.Player::_apRefundGranted
	IL_00de: brtrue.s IL_0124

	IL_00e0: ldarg.0
	IL_00e1: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_00e6: callvirt instance int32 MGSC.CreatureData::GetHealthRegenBonus()
	IL_00eb: ldarg.0
	IL_00ec: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_00f1: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
	IL_00f6: ldfld int32 MGSC.HealthInfo::MaxValue
	IL_00fb: conv.r4
	IL_00fc: ldarg.0
	IL_00fd: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0102: callvirt instance float32 MGSC.CreatureData::GetMaxHealthRegenPercentMult()
	IL_0107: mul
	IL_0108: call int32 [UnityEngine.CoreModule]UnityEngine.Mathf::RoundToInt(float32)
	IL_010d: add
	IL_010e: stloc.2
	// if (num2 != 0)
	IL_010f: ldloc.2
	IL_0110: brfalse.s IL_0124

	// CreatureData.Health.Restore(num2);
	IL_0112: ldarg.0
	IL_0113: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0118: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
	IL_011d: ldloc.2
	IL_011e: ldc.i4.0
	IL_011f: callvirt instance void MGSC.HealthInfo::Restore(int32, bool)

	// base.ProcessActionPoint();
	IL_0124: ldarg.0
	IL_0125: call instance void MGSC.Creature::ProcessActionPoint()
	// if (CreatureSystem.IsSeeMonsters(_creatures, _mapGrid))
	IL_012a: ldarg.0
	IL_012b: ldfld class MGSC.Creatures MGSC.Creature::_creatures
	IL_0130: ldarg.0
	IL_0131: ldfld class MGSC.MapGrid MGSC.Creature::_mapGrid
	IL_0136: call bool MGSC.CreatureSystem::IsSeeMonsters(class MGSC.Creatures, class MGSC.MapGrid)
	IL_013b: brfalse.s IL_0148

	// _commandQueue.Clear();
	IL_013d: ldarg.0
	IL_013e: ldfld class MGSC.PlayerCommandQueue MGSC.Creature::_commandQueue
	IL_0143: callvirt instance void MGSC.PlayerCommandQueue::Clear()

	// DungeonHudScreen dungeonHudScreen = UI.Get<DungeonHudScreen>();
	IL_0148: call !!0 MGSC.UI::Get<class MGSC.DungeonHudScreen>()
	// dungeonHudScreen.RefreshPain();
	IL_014d: dup
	IL_014e: callvirt instance void MGSC.DungeonHudScreen::RefreshPain()
	// dungeonHudScreen.RefreshUltimatePerk();
	IL_0153: callvirt instance void MGSC.DungeonHudScreen::RefreshUltimatePerk()
	// CreatureData.Inventory.CheckLockStates();
	IL_0158: ldarg.0
	IL_0159: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_015e: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
	IL_0163: callvirt instance void MGSC.Inventory::CheckLockStates()
	// if (CreatureData.Health.Alive && WoundSystem.HasAnyStun(CreatureData.EffectsController))
	IL_0168: ldarg.0
	IL_0169: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_016e: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
	IL_0173: callvirt instance bool MGSC.HealthInfo::get_Alive()
	IL_0178: brfalse.s IL_01b7

	IL_017a: ldarg.0
	IL_017b: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0180: ldfld class MGSC.EffectsController MGSC.CreatureData::EffectsController
	IL_0185: call bool MGSC.WoundSystem::HasAnyStun(class MGSC.EffectsController)
	IL_018a: brfalse.s IL_01b7

	// IsProcessing = false;
	IL_018c: ldarg.0
	IL_018d: ldc.i4.0
	IL_018e: callvirt instance void MGSC.Creature::set_IsProcessing(bool)
	// base.Creature3dView.PlayWaitAnimation();
	IL_0193: ldarg.0
	IL_0194: call instance class MGSC.Creature3dView MGSC.Creature::get_Creature3dView()
	IL_0199: callvirt instance void MGSC.Creature3dView::PlayWaitAnimation()
	// base.Creature3dView.PlayAnimation(AnimationType.Idle);
	IL_019e: ldarg.0
	IL_019f: call instance class MGSC.Creature3dView MGSC.Creature::get_Creature3dView()
	IL_01a4: ldc.i4.4
	IL_01a5: ldc.i4.0
	IL_01a6: callvirt instance void MGSC.Creature3dView::PlayAnimation(valuetype MGSC.AnimationType, bool)
	// _commandQueue.Clear();
	IL_01ab: ldarg.0
	IL_01ac: ldfld class MGSC.PlayerCommandQueue MGSC.Creature::_commandQueue
	IL_01b1: callvirt instance void MGSC.PlayerCommandQueue::Clear()
	// ProcessBrokenBackpackOrVest();
	IL_01b6: ret

	IL_01b7: ldarg.0
	IL_01b8: call instance void MGSC.Player::ProcessBrokenBackpackOrVest()
	// bool flag = false;
	IL_01bd: ldc.i4.0
	IL_01be: stloc.1
	// for (int num3 = _weaponsToReload.Count - 1; num3 >= 0; num3--)
	IL_01bf: ldarg.0
	IL_01c0: ldfld class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem> MGSC.Player::_weaponsToReload
	IL_01c5: callvirt instance int32 class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::get_Count()
	IL_01ca: ldc.i4.1
	IL_01cb: sub
	IL_01cc: stloc.3
	// BasePickupItem basePickupItem = _weaponsToReload[num3];
	IL_01cd: br.s IL_0237
	// loop start (head: IL_0237)
		IL_01cf: ldarg.0
		IL_01d0: ldfld class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem> MGSC.Player::_weaponsToReload
		IL_01d5: ldloc.3
		IL_01d6: callvirt instance !0 class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::get_Item(int32)
		IL_01db: stloc.s 4
		// if (basePickupItem.LockCounter == 1)
		IL_01dd: ldloc.s 4
		IL_01df: callvirt instance uint8 MGSC.BasePickupItem::get_LockCounter()
		IL_01e4: ldc.i4.1
		IL_01e5: bne.un.s IL_0213

		// basePickupItem.LockCounter = 0;
		IL_01e7: ldloc.s 4
		IL_01e9: ldc.i4.0
		IL_01ea: callvirt instance void MGSC.BasePickupItem::set_LockCounter(uint8)
		// WeaponComponent weaponComponent = basePickupItem.Comp<WeaponComponent>();
		IL_01ef: ldloc.s 4
		IL_01f1: callvirt instance !!0 MGSC.BasePickupItem::Comp<class MGSC.WeaponComponent>()
		// weaponComponent.CurrentAmmo = weaponComponent.LastReloadAmount;
		IL_01f6: dup
		IL_01f7: callvirt instance int16 MGSC.WeaponComponent::get_LastReloadAmount()
		IL_01fc: callvirt instance void MGSC.WeaponComponent::set_CurrentAmmo(int16)
		// _weaponsToReload.Remove(basePickupItem);
		IL_0201: ldarg.0
		IL_0202: ldfld class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem> MGSC.Player::_weaponsToReload
		IL_0207: ldloc.s 4
		IL_0209: callvirt instance bool class [mscorlib]System.Collections.Generic.List`1<class MGSC.BasePickupItem>::Remove(!0)
		IL_020e: pop
		// flag = true;
		IL_020f: ldc.i4.1
		IL_0210: stloc.1
		// basePickupItem.LockCounter--;
		IL_0211: br.s IL_0233

		IL_0213: ldloc.s 4
		IL_0215: dup
		IL_0216: callvirt instance uint8 MGSC.BasePickupItem::get_LockCounter()
		IL_021b: stloc.s 5
		IL_021d: ldloc.s 5
		IL_021f: ldc.i4.1
		IL_0220: sub
		IL_0221: conv.u1
		// flag = true;
		IL_0222: callvirt instance void MGSC.BasePickupItem::set_LockCounter(uint8)
		IL_0227: ldc.i4.1
		IL_0228: stloc.1
		// UI.Get<DungeonHudScreen>().RefreshWeapon();
		IL_0229: call !!0 MGSC.UI::Get<class MGSC.DungeonHudScreen>()
		IL_022e: callvirt instance void MGSC.DungeonHudScreen::RefreshWeapon()

		// for (int num3 = _weaponsToReload.Count - 1; num3 >= 0; num3--)
		IL_0233: ldloc.3
		IL_0234: ldc.i4.1
		IL_0235: sub
		IL_0236: stloc.3

		// for (int num3 = _weaponsToReload.Count - 1; num3 >= 0; num3--)
		IL_0237: ldloc.3
		IL_0238: ldc.i4.0
		IL_0239: bge.s IL_01cf
	// end loop

	// if (flag)
	IL_023b: ldloc.1
	IL_023c: brfalse.s IL_0254

	// CreatureData.Inventory.CheckLockStates();
	IL_023e: ldarg.0
	IL_023f: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0244: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
	IL_0249: callvirt instance void MGSC.Inventory::CheckLockStates()
	// RefreshVisualAfterReloadOperation();
	IL_024e: ldarg.0
	IL_024f: call instance void MGSC.Player::RefreshVisualAfterReloadOperation()

	// _apRefundGranted = false;
	IL_0254: ldarg.0
	IL_0255: ldc.i4.0
	IL_0256: stfld bool MGSC.Player::_apRefundGranted
	// TutorialSystem.CheckPuddlesAndJammerTriggers(_storyTriggers, _missions, _raidMetadata, _mapGrid, _mapObstacles, CreatureData.Position, CreatureData.GetLosLevel());
	IL_025b: ldarg.0
	IL_025c: ldfld class MGSC.StoryTriggers MGSC.Creature::_storyTriggers
	IL_0261: ldarg.0
	IL_0262: ldfld class MGSC.Missions MGSC.Creature::_missions
	IL_0267: ldarg.0
	IL_0268: ldfld class MGSC.RaidMetadata MGSC.Creature::_raidMetadata
	IL_026d: ldarg.0
	IL_026e: ldfld class MGSC.MapGrid MGSC.Creature::_mapGrid
	IL_0273: ldarg.0
	IL_0274: ldfld class MGSC.MapObstacles MGSC.Creature::_mapObstacles
	IL_0279: ldarg.0
	IL_027a: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_027f: ldfld valuetype MGSC.CellPosition MGSC.CreatureData::Position
	IL_0284: ldarg.0
	IL_0285: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_028a: callvirt instance int32 MGSC.CreatureData::GetLosLevel()
	IL_028f: call void MGSC.TutorialSystem::CheckPuddlesAndJammerTriggers(class MGSC.StoryTriggers, class MGSC.Missions, class MGSC.RaidMetadata, class MGSC.MapGrid, class MGSC.MapObstacles, valuetype MGSC.CellPosition, int32)
	// _raidMetadata.WinCondition.CheckItemConditions(CreatureData.Inventory, _magnumSpaceship);
	IL_0294: ldarg.0
	IL_0295: ldfld class MGSC.RaidMetadata MGSC.Creature::_raidMetadata
	IL_029a: ldfld class MGSC.MissionWinCondition MGSC.RaidMetadata::WinCondition
	IL_029f: ldarg.0
	IL_02a0: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_02a5: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
	IL_02aa: ldarg.0
	IL_02ab: ldfld class MGSC.MagnumProgression MGSC.Creature::_magnumSpaceship
	IL_02b0: callvirt instance void MGSC.MissionWinCondition::CheckItemConditions(class MGSC.Inventory, class MGSC.MagnumProgression)
	// (no C# code)
	IL_02b5: ret
} // end of method Player::ProcessActionPoint

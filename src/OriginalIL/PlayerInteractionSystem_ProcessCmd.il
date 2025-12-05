.method public hidebysig static 
	void ProcessCmd (
		class MGSC.Scenarios scenarios,
		class MGSC.MapGrid mapGrid,
		class MGSC.MapMetadata mapMetadata,
		class MGSC.MapRenderer mapRenderer,
		class MGSC.MapController mapController,
		class MGSC.Creatures creatures,
		class MGSC.ItemsOnFloor itemsOnFloor,
		class MGSC.MapObstacles mapObstacles,
		class MGSC.MapEntities mapEntities,
		class MGSC.PlayerCommandQueue cmdQueue,
		class MGSC.TurnMetadata turnMetadata,
		class MGSC.RaidMetadata raidMetadata,
		class MGSC.CombatLog combatLog,
		class MGSC.ICommand cmd,
		class MGSC.FireController fireController,
		class MGSC.Visibilities visibilities,
		[out] bool& clearCmdQueue
	) cil managed 
{
	// Method begins at RVA 0xa0d58
	// Header size: 12
	// Code size: 1296 (0x510)
	.maxstack 17
	.locals init (
		[0] bool,
		[1] class MGSC.Monster,
		[2] valuetype MGSC.CellPosition,
		[3] class MGSC.MoveCommand,
		[4] class MGSC.InteractObjCommand,
		[5] class MGSC.MeleeObjCommand,
		[6] class MGSC.MapObstacle,
		[7] class MGSC.ThrowCommand,
		[8] valuetype MGSC.LimitsTooltip/LimitType,
		[9] class MGSC.ChangeFiremodeCommand,
		[10] class MGSC.ShootCommand,
		[11] class MGSC.CloseDoorCommand,
		[12] class MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_0',
		[13] valuetype MGSC.LimitsTooltip/LimitType,
		[14] class MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_1',
		[15] class MGSC.UseVestSlotCommand,
		[16] class MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_2'
	)

	// 	bool flag = false;
	IL_0000: ldc.i4.0
	IL_0001: stloc.0
	// 	clearCmdQueue = false;
	IL_0002: ldarg.s clearCmdQueue
	IL_0004: ldc.i4.0
	IL_0005: stind.i1
	// 	if (cmd.Type == CmdType.PushAlly)
	IL_0006: ldarg.s cmd
	IL_0008: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_000d: ldc.i4.s 16
	IL_000f: bne.un IL_009c

	// 		Monster target = (cmd as PushAllyCommand).target;
	IL_0014: ldarg.s cmd
	IL_0016: isinst MGSC.PushAllyCommand
	IL_001b: ldfld class MGSC.Monster MGSC.PushAllyCommand::target
	IL_0020: stloc.1
	// 		if (CanPushAlly(mapGrid, creatures, target))
	IL_0021: ldarg.1
	IL_0022: ldarg.s creatures
	IL_0024: ldloc.1
	IL_0025: call bool MGSC.PlayerInteractionSystem::CanPushAlly(class MGSC.MapGrid, class MGSC.Creatures, class MGSC.Creature)
	IL_002a: brfalse.s IL_0096

	// 			CellPosition position = target.CreatureData.Position;
	IL_002c: ldloc.1
	IL_002d: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0032: ldfld valuetype MGSC.CellPosition MGSC.CreatureData::Position
	IL_0037: stloc.2
	// 			if (target.Behaviour.MoveToRandomPos(canWalkOnMonsters: false, ignoreDangerousTerrain: true, canWalkOnPlayer: true))
	IL_0038: ldloc.1
	IL_0039: callvirt instance class MGSC.AiBehaviour MGSC.Monster::get_Behaviour()
	IL_003e: ldc.i4.0
	IL_003f: ldc.i4.1
	IL_0040: ldc.i4.1
	IL_0041: callvirt instance bool MGSC.AiBehaviour::MoveToRandomPos(bool, bool, bool)
	IL_0046: brfalse.s IL_0096

	// 				CreatureSystem.RefreshMonstersAndEntitiesFlags(mapGrid, creatures, mapEntities, creatures.Player.CreatureData.Position, creatures.Player);
	IL_0048: ldarg.1
	IL_0049: ldarg.s creatures
	IL_004b: ldarg.s mapEntities
	IL_004d: ldarg.s creatures
	IL_004f: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0054: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0059: ldfld valuetype MGSC.CellPosition MGSC.CreatureData::Position
	IL_005e: ldarg.s creatures
	IL_0060: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0065: call void MGSC.CreatureSystem::RefreshMonstersAndEntitiesFlags(class MGSC.MapGrid, class MGSC.Creatures, class MGSC.MapEntities, valuetype MGSC.CellPosition, class MGSC.Creature)
	// 				MovePlayer(mapGrid, mapMetadata, mapRenderer, mapController, creatures, itemsOnFloor, mapObstacles, cmdQueue, turnMetadata, raidMetadata, combatLog, scenarios, fireController, visibilities, mapEntities, position.X, position.Y);
	IL_006a: ldarg.1
	IL_006b: ldarg.2
	IL_006c: ldarg.3
	IL_006d: ldarg.s mapController
	IL_006f: ldarg.s creatures
	IL_0071: ldarg.s itemsOnFloor
	IL_0073: ldarg.s mapObstacles
	IL_0075: ldarg.s cmdQueue
	IL_0077: ldarg.s turnMetadata
	IL_0079: ldarg.s raidMetadata
	IL_007b: ldarg.s combatLog
	IL_007d: ldarg.0
	IL_007e: ldarg.s fireController
	IL_0080: ldarg.s visibilities
	IL_0082: ldarg.s mapEntities
	IL_0084: ldloc.2
	IL_0085: ldfld int32 MGSC.CellPosition::X
	IL_008a: ldloc.2
	IL_008b: ldfld int32 MGSC.CellPosition::Y
	IL_0090: call bool MGSC.PlayerInteractionSystem::MovePlayer(class MGSC.MapGrid, class MGSC.MapMetadata, class MGSC.MapRenderer, class MGSC.MapController, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.PlayerCommandQueue, class MGSC.TurnMetadata, class MGSC.RaidMetadata, class MGSC.CombatLog, class MGSC.Scenarios, class MGSC.FireController, class MGSC.Visibilities, class MGSC.MapEntities, int32, int32)
	IL_0095: pop

	// 		clearCmdQueue = true;
	IL_0096: ldarg.s clearCmdQueue
	IL_0098: ldc.i4.1
	IL_0099: stind.i1
	// 		flag = true;
	IL_009a: ldc.i4.1
	IL_009b: stloc.0

	// 	if (cmd.Type == CmdType.Move)
	IL_009c: ldarg.s cmd
	IL_009e: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_00a3: brtrue.s IL_011a

	// 		MoveCommand moveCommand = cmd as MoveCommand;
	IL_00a5: ldarg.s cmd
	IL_00a7: isinst MGSC.MoveCommand
	IL_00ac: stloc.3
	// 		if ((!MovePlayer(mapGrid, mapMetadata, mapRenderer, mapController, creatures, itemsOnFloor, mapObstacles, cmdQueue, turnMetadata, raidMetadata, combatLog, scenarios, fireController, visibilities, mapEntities, moveCommand.target.X, moveCommand.target.Y) || CreatureSystem.IsSeeMonsters(creatures, mapGrid) || WoundSystem.HasAnyDotWound(creatures.Player.CreatureData.EffectsController)) && !creatures.Player.PreviousTurnSkiped)
	IL_00ad: ldarg.1
	IL_00ae: ldarg.2
	IL_00af: ldarg.3
	IL_00b0: ldarg.s mapController
	IL_00b2: ldarg.s creatures
	IL_00b4: ldarg.s itemsOnFloor
	IL_00b6: ldarg.s mapObstacles
	IL_00b8: ldarg.s cmdQueue
	IL_00ba: ldarg.s turnMetadata
	IL_00bc: ldarg.s raidMetadata
	IL_00be: ldarg.s combatLog
	IL_00c0: ldarg.0
	IL_00c1: ldarg.s fireController
	IL_00c3: ldarg.s visibilities
	IL_00c5: ldarg.s mapEntities
	IL_00c7: ldloc.3
	IL_00c8: ldflda valuetype MGSC.CellPosition MGSC.MoveCommand::target
	IL_00cd: ldfld int32 MGSC.CellPosition::X
	IL_00d2: ldloc.3
	IL_00d3: ldflda valuetype MGSC.CellPosition MGSC.MoveCommand::target
	IL_00d8: ldfld int32 MGSC.CellPosition::Y
	IL_00dd: call bool MGSC.PlayerInteractionSystem::MovePlayer(class MGSC.MapGrid, class MGSC.MapMetadata, class MGSC.MapRenderer, class MGSC.MapController, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.PlayerCommandQueue, class MGSC.TurnMetadata, class MGSC.RaidMetadata, class MGSC.CombatLog, class MGSC.Scenarios, class MGSC.FireController, class MGSC.Visibilities, class MGSC.MapEntities, int32, int32)
	IL_00e2: brfalse.s IL_0106

	IL_00e4: ldarg.s creatures
	IL_00e6: ldarg.1
	IL_00e7: call bool MGSC.CreatureSystem::IsSeeMonsters(class MGSC.Creatures, class MGSC.MapGrid)
	IL_00ec: brtrue.s IL_0106

	// (no C# code)
	IL_00ee: ldarg.s creatures
	IL_00f0: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_00f5: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_00fa: ldfld class MGSC.EffectsController MGSC.CreatureData::EffectsController
	IL_00ff: call bool MGSC.WoundSystem::HasAnyDotWound(class MGSC.EffectsController)
	IL_0104: brfalse.s IL_0118

	// 			clearCmdQueue = true;
	IL_0106: ldarg.s creatures
	IL_0108: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_010d: ldfld bool MGSC.Player::PreviousTurnSkiped
	IL_0112: brtrue.s IL_0118

	IL_0114: ldarg.s clearCmdQueue
	IL_0116: ldc.i4.1
	IL_0117: stind.i1

	// 		flag = true;
	IL_0118: ldc.i4.1
	IL_0119: stloc.0

	// 	if (cmd.Type == CmdType.InteractObstacle)
	IL_011a: ldarg.s cmd
	IL_011c: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_0121: ldc.i4.6
	IL_0122: bne.un.s IL_0142

	// 		InteractObjCommand interactObjCommand = cmd as InteractObjCommand;
	IL_0124: ldarg.s cmd
	IL_0126: isinst MGSC.InteractObjCommand
	IL_012b: stloc.s 4
	// 		InteractObstacle(creatures, scenarios, interactObjCommand.target);
	IL_012d: ldarg.s creatures
	IL_012f: ldarg.0
	IL_0130: ldloc.s 4
	IL_0132: ldfld class MGSC.MapObstacle MGSC.InteractObjCommand::target
	IL_0137: call void MGSC.PlayerInteractionSystem::InteractObstacle(class MGSC.Creatures, class MGSC.Scenarios, class MGSC.MapObstacle)
	// 		clearCmdQueue = true;
	IL_013c: ldarg.s clearCmdQueue
	IL_013e: ldc.i4.1
	IL_013f: stind.i1
	// 		flag = true;
	IL_0140: ldc.i4.1
	IL_0141: stloc.0

	// 	if (cmd.Type == CmdType.MeleeObject)
	IL_0142: ldarg.s cmd
	IL_0144: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_0149: ldc.i4.s 11
	IL_014b: bne.un.s IL_01ca

	// 		MeleeObjCommand meleeObjCommand = cmd as MeleeObjCommand;
	IL_014d: ldarg.s cmd
	IL_014f: isinst MGSC.MeleeObjCommand
	IL_0154: stloc.s 5
	// 		MapObstacle mapObstacle = mapObstacles.Get(meleeObjCommand.target.X, meleeObjCommand.target.Y, interactable: false, destroyable: true);
	IL_0156: ldarg.s mapObstacles
	IL_0158: ldloc.s 5
	IL_015a: ldflda valuetype MGSC.CellPosition MGSC.MeleeObjCommand::target
	IL_015f: ldfld int32 MGSC.CellPosition::X
	IL_0164: ldloc.s 5
	IL_0166: ldflda valuetype MGSC.CellPosition MGSC.MeleeObjCommand::target
	IL_016b: ldfld int32 MGSC.CellPosition::Y
	IL_0170: ldc.i4.0
	IL_0171: ldc.i4.1
	IL_0172: callvirt instance class MGSC.MapObstacle MGSC.MapObstacles::Get(int32, int32, bool, bool)
	IL_0177: stloc.s 6
	// 		if (mapObstacle != null)
	IL_0179: ldloc.s 6
	IL_017b: ldnull
	IL_017c: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
	IL_0181: brfalse.s IL_01c4

	// 			if (mapObstacle.Door != null)
	IL_0183: ldloc.s 6
	IL_0185: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
	IL_018a: ldnull
	IL_018b: call bool [UnityEngine.CoreModule]UnityEngine.Object::op_Inequality(class [UnityEngine.CoreModule]UnityEngine.Object, class [UnityEngine.CoreModule]UnityEngine.Object)
	IL_0190: brfalse.s IL_01a2

	// 				MeleeAttackTheDoor(creatures, mapObstacle.Door);
	IL_0192: ldarg.s creatures
	IL_0194: ldloc.s 6
	IL_0196: callvirt instance class MGSC.Door MGSC.MapObstacle::get_Door()
	IL_019b: call void MGSC.PlayerInteractionSystem::MeleeAttackTheDoor(class MGSC.Creatures, class MGSC.Door)
	// 				MeleeAttackTheObj(creatures, meleeObjCommand.target.X, meleeObjCommand.target.Y, mapObstacle);
	IL_01a0: br.s IL_01c4

	IL_01a2: ldarg.s creatures
	IL_01a4: ldloc.s 5
	IL_01a6: ldflda valuetype MGSC.CellPosition MGSC.MeleeObjCommand::target
	IL_01ab: ldfld int32 MGSC.CellPosition::X
	IL_01b0: ldloc.s 5
	IL_01b2: ldflda valuetype MGSC.CellPosition MGSC.MeleeObjCommand::target
	IL_01b7: ldfld int32 MGSC.CellPosition::Y
	IL_01bc: ldloc.s 6
	IL_01be: call bool MGSC.PlayerInteractionSystem::MeleeAttackTheObj(class MGSC.Creatures, int32, int32, class MGSC.MapObstacle)
	IL_01c3: pop

	// 		clearCmdQueue = true;
	IL_01c4: ldarg.s clearCmdQueue
	IL_01c6: ldc.i4.1
	IL_01c7: stind.i1
	// 		flag = true;
	IL_01c8: ldc.i4.1
	IL_01c9: stloc.0

	// 	if (cmd.Type == CmdType.ThrowCommand)
	IL_01ca: ldarg.s cmd
	IL_01cc: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_01d1: ldc.i4.s 10
	IL_01d3: bne.un.s IL_0208

	// 		ThrowCommand throwCommand = cmd as ThrowCommand;
	IL_01d5: ldarg.s cmd
	IL_01d7: isinst MGSC.ThrowCommand
	IL_01dc: stloc.s 7
	// 		creatures.Player.Throw(throwCommand.target.X, throwCommand.target.Y);
	IL_01de: ldarg.s creatures
	IL_01e0: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_01e5: ldloc.s 7
	IL_01e7: ldflda valuetype MGSC.CellPosition MGSC.ThrowCommand::target
	IL_01ec: ldfld int32 MGSC.CellPosition::X
	IL_01f1: ldloc.s 7
	IL_01f3: ldflda valuetype MGSC.CellPosition MGSC.ThrowCommand::target
	IL_01f8: ldfld int32 MGSC.CellPosition::Y
	IL_01fd: callvirt instance void MGSC.Player::Throw(int32, int32)
	// 		clearCmdQueue = true;
	IL_0202: ldarg.s clearCmdQueue
	IL_0204: ldc.i4.1
	IL_0205: stind.i1
	// 		flag = true;
	IL_0206: ldc.i4.1
	IL_0207: stloc.0

	// 	if (cmd.Type == CmdType.TakeItem)
	IL_0208: ldarg.s cmd
	IL_020a: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_020f: ldc.i4.1
	IL_0210: bne.un.s IL_0249

	// 		if (!CanUseInventory(creatures, out var limitType))
	IL_0212: ldarg.s creatures
	IL_0214: ldloca.s 8
	IL_0216: call bool MGSC.PlayerInteractionSystem::CanUseInventory(class MGSC.Creatures, valuetype MGSC.LimitsTooltip/LimitType&)
	IL_021b: brtrue.s IL_022b

	// 			SingletonMonoBehaviour<TooltipFactory>.Instance.ShowLimitsTooltip(limitType);
	IL_021d: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.TooltipFactory>::get_Instance()
	IL_0222: ldloc.s 8
	IL_0224: callvirt instance void MGSC.TooltipFactory::ShowLimitsTooltip(valuetype MGSC.LimitsTooltip/LimitType)
	// 			ItemOnFloorSystem.TakeItemFromFloor(itemsOnFloor, creatures.Player.CreatureData.Position);
	IL_0229: br.s IL_0243

	IL_022b: ldarg.s itemsOnFloor
	IL_022d: ldarg.s creatures
	IL_022f: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0234: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0239: ldfld valuetype MGSC.CellPosition MGSC.CreatureData::Position
	IL_023e: call void MGSC.ItemOnFloorSystem::TakeItemFromFloor(class MGSC.ItemsOnFloor, valuetype MGSC.CellPosition)

	// 		clearCmdQueue = true;
	IL_0243: ldarg.s clearCmdQueue
	IL_0245: ldc.i4.1
	IL_0246: stind.i1
	// 		flag = true;
	IL_0247: ldc.i4.1
	IL_0248: stloc.0

	// 	if (cmd.Type == CmdType.ReloadWeapon)
	IL_0249: ldarg.s cmd
	IL_024b: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_0250: ldc.i4.3
	IL_0251: bne.un.s IL_0261

	// 		Reload(creatures);
	IL_0253: ldarg.s creatures
	IL_0255: ldnull
	IL_0256: call void MGSC.PlayerInteractionSystem::Reload(class MGSC.Creatures, class MGSC.BasePickupItem)
	// 		clearCmdQueue = true;
	IL_025b: ldarg.s clearCmdQueue
	IL_025d: ldc.i4.1
	IL_025e: stind.i1
	// 		flag = true;
	IL_025f: ldc.i4.1
	IL_0260: stloc.0

	// 	if (cmd.Type == CmdType.SwapWeapon)
	IL_0261: ldarg.s cmd
	IL_0263: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_0268: ldc.i4.4
	IL_0269: bne.un.s IL_0278

	// 		SwapWeapon(creatures);
	IL_026b: ldarg.s creatures
	IL_026d: call void MGSC.PlayerInteractionSystem::SwapWeapon(class MGSC.Creatures)
	// 		clearCmdQueue = true;
	IL_0272: ldarg.s clearCmdQueue
	IL_0274: ldc.i4.1
	IL_0275: stind.i1
	// 		flag = true;
	IL_0276: ldc.i4.1
	IL_0277: stloc.0

	// 	if (cmd.Type == CmdType.ChangeFiremode)
	IL_0278: ldarg.s cmd
	IL_027a: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_027f: ldc.i4.s 12
	IL_0281: bne.un.s IL_02a0

	// 		ChangeFiremodeCommand changeFiremodeCommand = cmd as ChangeFiremodeCommand;
	IL_0283: ldarg.s cmd
	IL_0285: isinst MGSC.ChangeFiremodeCommand
	IL_028a: stloc.s 9
	// 		ChangeFiremode(creatures, changeFiremodeCommand.firemodeId);
	IL_028c: ldarg.s creatures
	IL_028e: ldloc.s 9
	IL_0290: ldfld string MGSC.ChangeFiremodeCommand::firemodeId
	IL_0295: call void MGSC.PlayerInteractionSystem::ChangeFiremode(class MGSC.Creatures, string)
	// 		clearCmdQueue = true;
	IL_029a: ldarg.s clearCmdQueue
	IL_029c: ldc.i4.1
	IL_029d: stind.i1
	// 		flag = true;
	IL_029e: ldc.i4.1
	IL_029f: stloc.0

	// 	if (cmd.Type == CmdType.Shoot)
	IL_02a0: ldarg.s cmd
	IL_02a2: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_02a7: ldc.i4.2
	IL_02a8: bne.un.s IL_02df

	// 		ShootCommand shootCommand = cmd as ShootCommand;
	IL_02aa: ldarg.s cmd
	IL_02ac: isinst MGSC.ShootCommand
	IL_02b1: stloc.s 10
	// 		creatures.Player.Shoot(shootCommand.target.X, shootCommand.target.Y);
	IL_02b3: ldarg.s creatures
	IL_02b5: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_02ba: ldloc.s 10
	IL_02bc: ldflda valuetype MGSC.CellPosition MGSC.ShootCommand::target
	IL_02c1: ldfld int32 MGSC.CellPosition::X
	IL_02c6: ldloc.s 10
	IL_02c8: ldflda valuetype MGSC.CellPosition MGSC.ShootCommand::target
	IL_02cd: ldfld int32 MGSC.CellPosition::Y
	IL_02d2: ldc.i4.0
	IL_02d3: callvirt instance bool MGSC.Creature::Shoot(int32, int32, bool)
	IL_02d8: pop
	// 		clearCmdQueue = true;
	IL_02d9: ldarg.s clearCmdQueue
	IL_02db: ldc.i4.1
	IL_02dc: stind.i1
	// 		flag = true;
	IL_02dd: ldc.i4.1
	IL_02de: stloc.0

	// 	if (cmd.Type == CmdType.CloseDoor)
	IL_02df: ldarg.s cmd
	IL_02e1: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_02e6: ldc.i4.7
	IL_02e7: bne.un.s IL_030f

	// 		CloseDoorCommand closeDoorCommand = cmd as CloseDoorCommand;
	IL_02e9: ldarg.s cmd
	IL_02eb: isinst MGSC.CloseDoorCommand
	IL_02f0: stloc.s 11
	// 		CloseTheDoor(creatures, itemsOnFloor, mapObstacles, mapEntities, scenarios, turnMetadata, closeDoorCommand.target);
	IL_02f2: ldarg.s creatures
	IL_02f4: ldarg.s itemsOnFloor
	IL_02f6: ldarg.s mapObstacles
	IL_02f8: ldarg.s mapEntities
	IL_02fa: ldarg.0
	IL_02fb: ldarg.s turnMetadata
	IL_02fd: ldloc.s 11
	IL_02ff: ldfld class MGSC.Door MGSC.CloseDoorCommand::target
	IL_0304: call void MGSC.PlayerInteractionSystem::CloseTheDoor(class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.MapEntities, class MGSC.Scenarios, class MGSC.TurnMetadata, class MGSC.Door)
	// 		clearCmdQueue = true;
	IL_0309: ldarg.s clearCmdQueue
	IL_030b: ldc.i4.1
	IL_030c: stind.i1
	// 		flag = true;
	IL_030d: ldc.i4.1
	IL_030e: stloc.0

	// 	if (flag)
	IL_030f: ldloc.0
	IL_0310: brfalse.s IL_0313

	// }
	IL_0312: ret

	// 	if (cmd.Type == CmdType.ShowDoorActionsList)
	IL_0313: ldarg.s cmd
	IL_0315: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_031a: ldc.i4.8
	IL_031b: bne.un IL_03b3

	// (no C# code)
	IL_0320: newobj instance void MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_0'::.ctor()
	IL_0325: stloc.s 12
	// 		ShowDoorActionsListCommand doorCmd = cmd as ShowDoorActionsListCommand;
	IL_0327: ldloc.s 12
	IL_0329: ldarg.s cmd
	IL_032b: isinst MGSC.ShowDoorActionsListCommand
	IL_0330: stfld class MGSC.ShowDoorActionsListCommand MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_0'::doorCmd
	// 		if (!CanInteractObstacles(creatures, scenarios, doorCmd.target.MapObstacle, out var limitType2))
	IL_0335: ldarg.s creatures
	IL_0337: ldarg.0
	IL_0338: ldloc.s 12
	IL_033a: ldfld class MGSC.ShowDoorActionsListCommand MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_0'::doorCmd
	IL_033f: ldfld class MGSC.Door MGSC.ShowDoorActionsListCommand::target
	IL_0344: callvirt instance class MGSC.MapObstacle MGSC.MapObstacleComponent::get_MapObstacle()
	IL_0349: ldloca.s 13
	IL_034b: call bool MGSC.PlayerInteractionSystem::CanInteractObstacles(class MGSC.Creatures, class MGSC.Scenarios, class MGSC.MapObstacle, valuetype MGSC.LimitsTooltip/LimitType&)
	IL_0350: brtrue.s IL_0360

	// 			SingletonMonoBehaviour<TooltipFactory>.Instance.ShowLimitsTooltip(limitType2);
	IL_0352: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.TooltipFactory>::get_Instance()
	IL_0357: ldloc.s 13
	IL_0359: callvirt instance void MGSC.TooltipFactory::ShowLimitsTooltip(valuetype MGSC.LimitsTooltip/LimitType)
	// 		else if (MapObstacleSystem.IsValidDoorPositionToInteract(creatures, itemsOnFloor, mapEntities, mapObstacles, doorCmd.target.MapObstacle))
	IL_035e: br.s IL_03af

	IL_0360: ldarg.s creatures
	IL_0362: ldarg.s itemsOnFloor
	IL_0364: ldarg.s mapEntities
	IL_0366: ldarg.s mapObstacles
	IL_0368: ldloc.s 12
	IL_036a: ldfld class MGSC.ShowDoorActionsListCommand MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_0'::doorCmd
	IL_036f: ldfld class MGSC.Door MGSC.ShowDoorActionsListCommand::target
	IL_0374: callvirt instance class MGSC.MapObstacle MGSC.MapObstacleComponent::get_MapObstacle()
	IL_0379: call bool MGSC.MapObstacleSystem::IsValidDoorPositionToInteract(class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapEntities, class MGSC.MapObstacles, class MGSC.MapObstacle)
	IL_037e: brfalse.s IL_03af

	// 			UI.Chain<DoorTooltip>().Show().Invoke(delegate(DoorTooltip v)
	// 			{
	// 				v.Configure(doorCmd.target);
	// 			})
	// 				.SetBackgroundColor(Colors.Transparent)
	// 				.SetBackOnBackgroundClick(value: true);
	IL_0380: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.DoorTooltip>()
	IL_0385: ldc.i4.1
	IL_0386: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.DoorTooltip>::Show(bool)
	IL_038b: ldloc.s 12
	IL_038d: ldftn instance void MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_0'::'<ProcessCmd>b__0'(class MGSC.DoorTooltip)
	IL_0393: newobj instance void class [mscorlib]System.Action`1<class MGSC.DoorTooltip>::.ctor(object, native int)
	IL_0398: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.DoorTooltip>::Invoke(class [mscorlib]System.Action`1<!0>)
	IL_039d: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_Transparent()
	IL_03a2: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.DoorTooltip>::SetBackgroundColor(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
	IL_03a7: ldc.i4.1
	IL_03a8: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.DoorTooltip>::SetBackOnBackgroundClick(bool)
	// 			return;
	IL_03ad: pop
	IL_03ae: ret

	// 		clearCmdQueue = true;
	IL_03af: ldarg.s clearCmdQueue
	IL_03b1: ldc.i4.1
	IL_03b2: stind.i1

	// 	if (cmd.Type == CmdType.ShowOptionsMonster)
	IL_03b3: ldarg.s cmd
	IL_03b5: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_03ba: ldc.i4.s 9
	IL_03bc: bne.un IL_044c

	// (no C# code)
	IL_03c1: newobj instance void MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_1'::.ctor()
	IL_03c6: stloc.s 14
	// 		ShowOptionsMonsterCommand intObjCmd = cmd as ShowOptionsMonsterCommand;
	IL_03c8: ldloc.s 14
	IL_03ca: ldarg.s cmd
	IL_03cc: isinst MGSC.ShowOptionsMonsterCommand
	IL_03d1: stfld class MGSC.ShowOptionsMonsterCommand MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_1'::intObjCmd
	// 		UI.Chain<MonsterInspectWindow>().Invoke(delegate(MonsterInspectWindow v)
	// 		{
	// 			v.Configure(intObjCmd.target);
	// 		}).Show()
	// 			.SetBackOnBackgroundClick(value: true);
	IL_03d6: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.MonsterInspectWindow>()
	IL_03db: ldloc.s 14
	IL_03dd: ldftn instance void MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_1'::'<ProcessCmd>b__1'(class MGSC.MonsterInspectWindow)
	IL_03e3: newobj instance void class [mscorlib]System.Action`1<class MGSC.MonsterInspectWindow>::.ctor(object, native int)
	IL_03e8: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.MonsterInspectWindow>::Invoke(class [mscorlib]System.Action`1<!0>)
	IL_03ed: ldc.i4.1
	IL_03ee: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.MonsterInspectWindow>::Show(bool)
	IL_03f3: ldc.i4.1
	IL_03f4: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.MonsterInspectWindow>::SetBackOnBackgroundClick(bool)
	// (no C# code)
	IL_03f9: pop
	// 		if (intObjCmd.showAfterSelectShoot)
	IL_03fa: ldloc.s 14
	IL_03fc: ldfld class MGSC.ShowOptionsMonsterCommand MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_1'::intObjCmd
	IL_0401: ldfld bool MGSC.ShowOptionsMonsterCommand::showAfterSelectShoot
	IL_0406: brfalse.s IL_0413

	// 			UI.Chain<MonsterInspectWindow>().Fallback<SelectShootTarget>();
	IL_0408: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.MonsterInspectWindow>()
	IL_040d: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.MonsterInspectWindow>::Fallback<class MGSC.SelectShootTarget>()
	IL_0412: pop

	// 		if (UI.Get<MonsterInspectWindow>().ShouldShowAllyInventory())
	IL_0413: call !!0 MGSC.UI::Get<class MGSC.MonsterInspectWindow>()
	IL_0418: callvirt instance bool MGSC.MonsterInspectWindow::ShouldShowAllyInventory()
	IL_041d: brfalse.s IL_0448

	// 			UI.Chain<InventoryScreen>().Show().AttachToGroup<MonsterInspectWindow>()
	// 				.Invoke(delegate(InventoryScreen v)
	// 				{
	// 					v.ConfigureAllyInventory(intObjCmd.target);
	// 				})
	// 				.SetBackOnBackgroundClick(value: true);
	IL_041f: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.InventoryScreen>()
	IL_0424: ldc.i4.1
	IL_0425: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.InventoryScreen>::Show(bool)
	IL_042a: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.InventoryScreen>::AttachToGroup<class MGSC.MonsterInspectWindow>()
	IL_042f: ldloc.s 14
	IL_0431: ldftn instance void MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_1'::'<ProcessCmd>b__2'(class MGSC.InventoryScreen)
	IL_0437: newobj instance void class [mscorlib]System.Action`1<class MGSC.InventoryScreen>::.ctor(object, native int)
	IL_043c: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.InventoryScreen>::Invoke(class [mscorlib]System.Action`1<!0>)
	IL_0441: ldc.i4.1
	IL_0442: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.InventoryScreen>::SetBackOnBackgroundClick(bool)
	// 		clearCmdQueue = true;
	IL_0447: pop

	IL_0448: ldarg.s clearCmdQueue
	IL_044a: ldc.i4.1
	IL_044b: stind.i1

	// 	if (cmd.Type == CmdType.UseVestSlot)
	IL_044c: ldarg.s cmd
	IL_044e: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_0453: ldc.i4.5
	IL_0454: bne.un.s IL_0473

	// 		UseVestSlotCommand useVestSlotCommand = cmd as UseVestSlotCommand;
	IL_0456: ldarg.s cmd
	IL_0458: isinst MGSC.UseVestSlotCommand
	IL_045d: stloc.s 15
	// 		InteractVestSlot(creatures, raidMetadata, useVestSlotCommand.slotIndex);
	IL_045f: ldarg.s creatures
	IL_0461: ldarg.s raidMetadata
	IL_0463: ldloc.s 15
	IL_0465: ldfld int32 MGSC.UseVestSlotCommand::slotIndex
	IL_046a: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 		clearCmdQueue = true;
	IL_046f: ldarg.s clearCmdQueue
	IL_0471: ldc.i4.1
	IL_0472: stind.i1

	// 	if (cmd.Type == CmdType.ChangeSpeedMode)
	IL_0473: ldarg.s cmd
	IL_0475: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_047a: ldc.i4.s 13
	IL_047c: bne.un.s IL_04ab

	// 		if ((cmd as ChangeSpeedModeCommand).dir == Direction.Left)
	IL_047e: ldarg.s cmd
	IL_0480: isinst MGSC.ChangeSpeedModeCommand
	IL_0485: ldfld valuetype MGSC.Direction MGSC.ChangeSpeedModeCommand::dir
	IL_048a: ldc.i4.3
	IL_048b: bne.un.s IL_049b

	// 			creatures.Player.ChangeMoveStateToPrev();
	IL_048d: ldarg.s creatures
	IL_048f: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0494: callvirt instance void MGSC.Player::ChangeMoveStateToPrev()
	// 			creatures.Player.ChangeMoveStateToNext();
	IL_0499: br.s IL_04a7

	IL_049b: ldarg.s creatures
	IL_049d: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_04a2: callvirt instance void MGSC.Player::ChangeMoveStateToNext()

	// 		clearCmdQueue = true;
	IL_04a7: ldarg.s clearCmdQueue
	IL_04a9: ldc.i4.1
	IL_04aa: stind.i1

	// 	if (cmd.Type == CmdType.ActivateUltimatePerk)
	IL_04ab: ldarg.s cmd
	IL_04ad: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_04b2: ldc.i4.s 14
	IL_04b4: bne.un.s IL_04c3

	// 		ActivateUltimatePerk(creatures, raidMetadata);
	IL_04b6: ldarg.s creatures
	IL_04b8: ldarg.s raidMetadata
	IL_04ba: call void MGSC.PlayerInteractionSystem::ActivateUltimatePerk(class MGSC.Creatures, class MGSC.RaidMetadata)
	// 		clearCmdQueue = true;
	IL_04bf: ldarg.s clearCmdQueue
	IL_04c1: ldc.i4.1
	IL_04c2: stind.i1

	// 	if (cmd.Type == CmdType.PlaceObject)
	IL_04c3: ldarg.s cmd
	IL_04c5: callvirt instance valuetype MGSC.CmdType MGSC.ICommand::get_Type()
	IL_04ca: ldc.i4.s 15
	IL_04cc: bne.un.s IL_050f

	// (no C# code)
	IL_04ce: newobj instance void MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_2'::.ctor()
	IL_04d3: stloc.s 16
	// 		UsePlaceableCommand usePlaceableCmd = cmd as UsePlaceableCommand;
	IL_04d5: ldloc.s 16
	IL_04d7: ldarg.s cmd
	IL_04d9: isinst MGSC.UsePlaceableCommand
	IL_04de: stfld class MGSC.UsePlaceableCommand MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_2'::usePlaceableCmd
	// 		UI.Chain<SelectPlaceableTarget>().Invoke(delegate(SelectPlaceableTarget v)
	// 		{
	// 			v.Configure(usePlaceableCmd.Item, usePlaceableCmd.IsSpendTurn);
	// 		}).Show()
	// 			.SetBackgroundColor(Colors.Transparent);
	IL_04e3: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.SelectPlaceableTarget>()
	IL_04e8: ldloc.s 16
	IL_04ea: ldftn instance void MGSC.PlayerInteractionSystem/'<>c__DisplayClass7_2'::'<ProcessCmd>b__3'(class MGSC.SelectPlaceableTarget)
	IL_04f0: newobj instance void class [mscorlib]System.Action`1<class MGSC.SelectPlaceableTarget>::.ctor(object, native int)
	IL_04f5: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SelectPlaceableTarget>::Invoke(class [mscorlib]System.Action`1<!0>)
	IL_04fa: ldc.i4.1
	IL_04fb: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SelectPlaceableTarget>::Show(bool)
	IL_0500: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_Transparent()
	IL_0505: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SelectPlaceableTarget>::SetBackgroundColor(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
	// 		clearCmdQueue = true;
	IL_050a: pop
	IL_050b: ldarg.s clearCmdQueue
	IL_050d: ldc.i4.1
	IL_050e: stind.i1

	// (no C# code)
	IL_050f: ret
} // end of method PlayerInteractionSystem::ProcessCmd

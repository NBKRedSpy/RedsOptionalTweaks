.method private hidebysig 
	instance void Update () cil managed 
{
	// Method begins at RVA 0x3cb8
	// Header size: 12
	// Code size: 711 (0x2c7)
	.maxstack 18
	.locals init (
		[0] class MGSC.Player,
		[1] class MGSC.TurnMetadata,
		[2] class MGSC.TurnController,
		[3] bool,
		[4] bool,
		[5] bool,
		[6] class MGSC.PlayerCommandQueue,
		[7] bool,
		[8] bool
	)

	// 	if (!_initialized)
	IL_0000: ldarg.0
	IL_0001: ldfld bool MGSC.DungeonGameMode::_initialized
	IL_0006: brtrue.s IL_0009

	// }
	IL_0008: ret

	// 	if (_finished)
	IL_0009: ldarg.0
	IL_000a: ldfld bool MGSC.DungeonGameMode::_finished
	IL_000f: brfalse.s IL_001e

	// 		SingletonMonoBehaviour<UI>.Instance.Process(out var _);
	IL_0011: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.UI>::get_Instance()
	IL_0016: ldloca.s 3
	IL_0018: callvirt instance void MGSC.UI::Process(bool&)
	// 	Player player = Creatures.Player;
	IL_001d: ret

	IL_001e: ldarg.0
	IL_001f: call instance class MGSC.Creatures MGSC.DungeonGameMode::get_Creatures()
	IL_0024: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0029: stloc.0
	// 	if (player.CreatureData.Health.Dead && !player.MutatedQuasimorph)
	IL_002a: ldloc.0
	IL_002b: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0030: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
	IL_0035: callvirt instance bool MGSC.HealthInfo::get_Dead()
	IL_003a: brfalse.s IL_005a

	IL_003c: ldloc.0
	IL_003d: callvirt instance bool MGSC.Player::get_MutatedQuasimorph()
	IL_0042: brtrue.s IL_005a

	// 		_state.Get<FireDrawer>().Update(Time.deltaTime);
	IL_0044: ldarg.0
	IL_0045: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_004a: callvirt instance !!0 MGSC.State::Get<class MGSC.FireDrawer>()
	IL_004f: call float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
	IL_0054: callvirt instance void MGSC.FireDrawer::Update(float32)
	// 	UserModSystem.InvokeHook(_state, ModHookType.DungeonUpdateBeforeGameLoop);
	IL_0059: ret

	IL_005a: ldarg.0
	IL_005b: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_0060: ldc.i4.7
	IL_0061: call void MGSC.UserModSystem::InvokeHook(class MGSC.State, valuetype MGSC.ModHookType)
	// 	_state.Get<GameLoop>().Tick_Dungeon();
	IL_0066: ldarg.0
	IL_0067: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_006c: callvirt instance !!0 MGSC.State::Get<class MGSC.GameLoop>()
	IL_0071: callvirt instance void MGSC.GameLoop::Tick_Dungeon()
	// 	UserModSystem.InvokeHook(_state, ModHookType.DungeonUpdateAfterGameLoop);
	IL_0076: ldarg.0
	IL_0077: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_007c: ldc.i4.8
	IL_007d: call void MGSC.UserModSystem::InvokeHook(class MGSC.State, valuetype MGSC.ModHookType)
	// 	_state.Get<FireDrawer>().Update(Time.deltaTime);
	IL_0082: ldarg.0
	IL_0083: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_0088: callvirt instance !!0 MGSC.State::Get<class MGSC.FireDrawer>()
	IL_008d: call float32 [UnityEngine.CoreModule]UnityEngine.Time::get_deltaTime()
	IL_0092: callvirt instance void MGSC.FireDrawer::Update(float32)
	// 	TurnMetadata turnMetadata = _state.Get<TurnMetadata>();
	IL_0097: ldarg.0
	IL_0098: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_009d: callvirt instance !!0 MGSC.State::Get<class MGSC.TurnMetadata>()
	IL_00a2: stloc.1
	// 	if (TurnSystem.IsPaused(turnMetadata))
	IL_00a3: ldloc.1
	IL_00a4: call bool MGSC.TurnSystem::IsPaused(class MGSC.TurnMetadata)
	IL_00a9: brfalse.s IL_00ac

	// 	TurnController turnController = _state.Get<TurnController>();
	IL_00ab: ret

	IL_00ac: ldarg.0
	IL_00ad: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_00b2: callvirt instance !!0 MGSC.State::Get<class MGSC.TurnController>()
	IL_00b7: stloc.2
	// 	turnController.Tick();
	IL_00b8: ldloc.2
	IL_00b9: callvirt instance void MGSC.TurnController::Tick()
	// 	if (UI.IsAnyShowing(typeof(DungeonHudScreen)))
	IL_00be: ldtoken MGSC.DungeonHudScreen
	IL_00c3: call class [mscorlib]System.Type [mscorlib]System.Type::GetTypeFromHandle(valuetype [mscorlib]System.RuntimeTypeHandle)
	IL_00c8: ldnull
	IL_00c9: ldnull
	IL_00ca: ldnull
	IL_00cb: ldnull
	IL_00cc: ldnull
	IL_00cd: ldnull
	IL_00ce: call bool MGSC.UI::IsAnyShowing(class [mscorlib]System.Type, class [mscorlib]System.Type, class [mscorlib]System.Type, class [mscorlib]System.Type, class [mscorlib]System.Type, class [mscorlib]System.Type, class [mscorlib]System.Type)
	IL_00d3: brfalse.s IL_00e5

	// 		SingletonMonoBehaviour<UI>.Instance.Process(out var _);
	IL_00d5: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.UI>::get_Instance()
	IL_00da: ldloca.s 4
	IL_00dc: callvirt instance void MGSC.UI::Process(bool&)
	// (no C# code)
	IL_00e1: ldloc.s 4
	IL_00e3: pop
	// 	if (UI.IsShowing<DungeonHudScreen>())
	IL_00e4: ret

	IL_00e5: call bool MGSC.UI::IsShowing<class MGSC.DungeonHudScreen>()
	IL_00ea: brfalse.s IL_00fd

	// 		UI.Get<DungeonHudScreen>().Process(out var interruptProcessing3);
	IL_00ec: call !!0 MGSC.UI::Get<class MGSC.DungeonHudScreen>()
	IL_00f1: ldloca.s 7
	IL_00f3: callvirt instance void MGSC.DungeonHudScreen::Process(bool&)
	// 		if (interruptProcessing3)
	IL_00f8: ldloc.s 7
	IL_00fa: brfalse.s IL_00fd

	// 			return;
	IL_00fc: ret

	// 	UI.Navigation.Diselect();
	IL_00fd: call class MGSC.Navigation MGSC.UI::get_Navigation()
	IL_0102: callvirt instance void MGSC.Navigation::Diselect()
	// 	UI.Navigation.ExecuteHotkey(out var interruptProcessing4);
	IL_0107: call class MGSC.Navigation MGSC.UI::get_Navigation()
	IL_010c: ldloca.s 5
	IL_010e: callvirt instance void MGSC.Navigation::ExecuteHotkey(bool&)
	// 	if (interruptProcessing4)
	IL_0113: ldloc.s 5
	IL_0115: brfalse.s IL_0118

	// 	PlayerCommandQueue playerCommandQueue = _state.Get<PlayerCommandQueue>();
	IL_0117: ret

	IL_0118: ldarg.0
	IL_0119: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_011e: callvirt instance !!0 MGSC.State::Get<class MGSC.PlayerCommandQueue>()
	IL_0123: stloc.s 6
	// 	if (Input.anyKeyDown && player.CreatureData.Health.Alive && player.Creature3dView.MoveToPosInProgress)
	IL_0125: call bool [UnityEngine.InputLegacyModule]UnityEngine.Input::get_anyKeyDown()
	IL_012a: brfalse.s IL_0153

	IL_012c: ldloc.0
	IL_012d: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_0132: ldfld class MGSC.HealthInfo MGSC.CreatureData::Health
	IL_0137: callvirt instance bool MGSC.HealthInfo::get_Alive()
	IL_013c: brfalse.s IL_0153

	// 		playerCommandQueue.Clear();
	IL_013e: ldloc.0
	IL_013f: callvirt instance class MGSC.Creature3dView MGSC.Creature::get_Creature3dView()
	IL_0144: callvirt instance bool MGSC.Creature3dView::get_MoveToPosInProgress()
	IL_0149: brfalse.s IL_0153

	IL_014b: ldloc.s 6
	IL_014d: callvirt instance void MGSC.PlayerCommandQueue::Clear()
	// 		if (!TurnSystem.CanProcessPlayerTurn(turnController, turnMetadata, Creatures))
	IL_0152: ret

	IL_0153: ldloc.2
	IL_0154: ldloc.1
	IL_0155: ldarg.0
	IL_0156: call instance class MGSC.Creatures MGSC.DungeonGameMode::get_Creatures()
	IL_015b: call bool MGSC.TurnSystem::CanProcessPlayerTurn(class MGSC.TurnController, class MGSC.TurnMetadata, class MGSC.Creatures)
	IL_0160: brtrue.s IL_0163

	// 		if (!player.FreeInventoryUse && player.AnyActionProcessedFlag)
	IL_0162: ret

	IL_0163: ldloc.0
	IL_0164: callvirt instance bool MGSC.Player::get_FreeInventoryUse()
	IL_0169: brtrue.s IL_017b

	IL_016b: ldloc.0
	IL_016c: callvirt instance bool MGSC.Player::get_AnyActionProcessedFlag()
	IL_0171: brfalse.s IL_017b

	// 			player.IsProcessing = false;
	IL_0173: ldloc.0
	IL_0174: ldc.i4.0
	IL_0175: callvirt instance void MGSC.Creature::set_IsProcessing(bool)
	// 		else if (!playerCommandQueue.Empty)
	IL_017a: ret

	IL_017b: ldloc.s 6
	IL_017d: callvirt instance bool MGSC.PlayerCommandQueue::get_Empty()
	IL_0182: brtrue IL_0227

	// 			PlayerInteractionSystem.ProcessCmd(_state.Get<Scenarios>(), _state.Get<MapGrid>(), _state.Get<MapMetadata>(), _state.Get<MapRenderer>(), _state.Get<MapController>(), Creatures, ItemsOnFloor, MapObstacles, _state.Get<MapEntities>(), playerCommandQueue, turnMetadata, _state.Get<RaidMetadata>(), _state.Get<CombatLog>(), playerCommandQueue.Pop(), _state.Get<FireController>(), _state.Get<Visibilities>(), out var clearCmdQueue);
	IL_0187: ldarg.0
	IL_0188: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_018d: callvirt instance !!0 MGSC.State::Get<class MGSC.Scenarios>()
	IL_0192: ldarg.0
	IL_0193: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_0198: callvirt instance !!0 MGSC.State::Get<class MGSC.MapGrid>()
	IL_019d: ldarg.0
	IL_019e: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_01a3: callvirt instance !!0 MGSC.State::Get<class MGSC.MapMetadata>()
	IL_01a8: ldarg.0
	IL_01a9: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_01ae: callvirt instance !!0 MGSC.State::Get<class MGSC.MapRenderer>()
	IL_01b3: ldarg.0
	IL_01b4: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_01b9: callvirt instance !!0 MGSC.State::Get<class MGSC.MapController>()
	IL_01be: ldarg.0
	IL_01bf: call instance class MGSC.Creatures MGSC.DungeonGameMode::get_Creatures()
	IL_01c4: ldarg.0
	IL_01c5: call instance class MGSC.ItemsOnFloor MGSC.DungeonGameMode::get_ItemsOnFloor()
	IL_01ca: ldarg.0
	IL_01cb: call instance class MGSC.MapObstacles MGSC.DungeonGameMode::get_MapObstacles()
	IL_01d0: ldarg.0
	IL_01d1: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_01d6: callvirt instance !!0 MGSC.State::Get<class MGSC.MapEntities>()
	IL_01db: ldloc.s 6
	IL_01dd: ldloc.1
	IL_01de: ldarg.0
	IL_01df: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_01e4: callvirt instance !!0 MGSC.State::Get<class MGSC.RaidMetadata>()
	IL_01e9: ldarg.0
	IL_01ea: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_01ef: callvirt instance !!0 MGSC.State::Get<class MGSC.CombatLog>()
	IL_01f4: ldloc.s 6
	IL_01f6: callvirt instance class MGSC.ICommand MGSC.PlayerCommandQueue::Pop()
	IL_01fb: ldarg.0
	IL_01fc: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_0201: callvirt instance !!0 MGSC.State::Get<class MGSC.FireController>()
	IL_0206: ldarg.0
	IL_0207: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_020c: callvirt instance !!0 MGSC.State::Get<class MGSC.Visibilities>()
	IL_0211: ldloca.s 8
	IL_0213: call void MGSC.PlayerInteractionSystem::ProcessCmd(class MGSC.Scenarios, class MGSC.MapGrid, class MGSC.MapMetadata, class MGSC.MapRenderer, class MGSC.MapController, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.MapEntities, class MGSC.PlayerCommandQueue, class MGSC.TurnMetadata, class MGSC.RaidMetadata, class MGSC.CombatLog, class MGSC.ICommand, class MGSC.FireController, class MGSC.Visibilities, bool&)
	// 			if (clearCmdQueue)
	IL_0218: ldloc.s 8
	IL_021a: brfalse IL_02c6

	// 				playerCommandQueue.Clear();
	IL_021f: ldloc.s 6
	IL_0221: callvirt instance void MGSC.PlayerCommandQueue::Clear()
	// 			PlayerInteractionSystem.ProcessInput(_state.Get<MapGrid>(), _state.Get<MapMetadata>(), _state.Get<MapRenderer>(), _state.Get<MapController>(), _state.Get<HazardController>(), MapObstacles, _state.Get<MapEntities>(), Creatures, ItemsOnFloor, GameCamera, playerCommandQueue, turnMetadata, _state.Get<RaidMetadata>(), Scenarios, _state.Get<CombatLog>(), _state.Get<FireController>(), _state.Get<Visibilities>(), _state.Get<Pathfinder>());
	IL_0226: ret

	IL_0227: ldarg.0
	IL_0228: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_022d: callvirt instance !!0 MGSC.State::Get<class MGSC.MapGrid>()
	IL_0232: ldarg.0
	IL_0233: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_0238: callvirt instance !!0 MGSC.State::Get<class MGSC.MapMetadata>()
	IL_023d: ldarg.0
	IL_023e: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_0243: callvirt instance !!0 MGSC.State::Get<class MGSC.MapRenderer>()
	IL_0248: ldarg.0
	IL_0249: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_024e: callvirt instance !!0 MGSC.State::Get<class MGSC.MapController>()
	IL_0253: ldarg.0
	IL_0254: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_0259: callvirt instance !!0 MGSC.State::Get<class MGSC.HazardController>()
	IL_025e: ldarg.0
	IL_025f: call instance class MGSC.MapObstacles MGSC.DungeonGameMode::get_MapObstacles()
	IL_0264: ldarg.0
	IL_0265: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_026a: callvirt instance !!0 MGSC.State::Get<class MGSC.MapEntities>()
	IL_026f: ldarg.0
	IL_0270: call instance class MGSC.Creatures MGSC.DungeonGameMode::get_Creatures()
	IL_0275: ldarg.0
	IL_0276: call instance class MGSC.ItemsOnFloor MGSC.DungeonGameMode::get_ItemsOnFloor()
	IL_027b: ldarg.0
	IL_027c: call instance class MGSC.GameCamera MGSC.DungeonGameMode::get_GameCamera()
	IL_0281: ldloc.s 6
	IL_0283: ldloc.1
	IL_0284: ldarg.0
	IL_0285: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_028a: callvirt instance !!0 MGSC.State::Get<class MGSC.RaidMetadata>()
	IL_028f: ldarg.0
	IL_0290: call instance class MGSC.Scenarios MGSC.DungeonGameMode::get_Scenarios()
	IL_0295: ldarg.0
	IL_0296: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_029b: callvirt instance !!0 MGSC.State::Get<class MGSC.CombatLog>()
	IL_02a0: ldarg.0
	IL_02a1: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_02a6: callvirt instance !!0 MGSC.State::Get<class MGSC.FireController>()
	IL_02ab: ldarg.0
	IL_02ac: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_02b1: callvirt instance !!0 MGSC.State::Get<class MGSC.Visibilities>()
	IL_02b6: ldarg.0
	IL_02b7: ldfld class MGSC.State MGSC.DungeonGameMode::_state
	IL_02bc: callvirt instance !!0 MGSC.State::Get<class MGSC.Pathfinder>()
	IL_02c1: call void MGSC.PlayerInteractionSystem::ProcessInput(class MGSC.MapGrid, class MGSC.MapMetadata, class MGSC.MapRenderer, class MGSC.MapController, class MGSC.HazardController, class MGSC.MapObstacles, class MGSC.MapEntities, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.GameCamera, class MGSC.PlayerCommandQueue, class MGSC.TurnMetadata, class MGSC.RaidMetadata, class MGSC.Scenarios, class MGSC.CombatLog, class MGSC.FireController, class MGSC.Visibilities, class MGSC.Pathfinder)

	// (no C# code)
	IL_02c6: ret
} // end of method DungeonGameMode::Update

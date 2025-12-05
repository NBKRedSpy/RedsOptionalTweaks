.method public hidebysig static 
	void ProcessInput (
		class MGSC.MapGrid mapGrid,
		class MGSC.MapMetadata mapMetadata,
		class MGSC.MapRenderer mapRenderer,
		class MGSC.MapController mapController,
		class MGSC.HazardController hazardController,
		class MGSC.MapObstacles mapObstacles,
		class MGSC.MapEntities mapEntities,
		class MGSC.Creatures creatures,
		class MGSC.ItemsOnFloor itemsOnFloor,
		class MGSC.GameCamera gameCam,
		class MGSC.PlayerCommandQueue playerCommandQueue,
		class MGSC.TurnMetadata turnMetadata,
		class MGSC.RaidMetadata raidMetadata,
		class MGSC.Scenarios scenarios,
		class MGSC.CombatLog combatLog,
		class MGSC.FireController fireController,
		class MGSC.Visibilities visibilities,
		class MGSC.Pathfinder pathfinder
	) cil managed 
{
	// Method begins at RVA 0xa215c
	// Header size: 12
	// Code size: 1402 (0x57a)
	.maxstack 16
	.locals init (
		[0] class MGSC.InputController,
		[1] class MGSC.DungeonHudScreen,
		[2] valuetype [UnityEngine.CoreModule]UnityEngine.Vector2,
		[3] int32,
		[4] valuetype MGSC.Direction
	)

	// 	InputController instance = SingletonMonoBehaviour<InputController>.Instance;
	IL_0000: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.InputController>::get_Instance()
	IL_0005: stloc.0
	// 	DungeonHudScreen dungeonHudScreen = UI.Get<DungeonHudScreen>();
	IL_0006: call !!0 MGSC.UI::Get<class MGSC.DungeonHudScreen>()
	IL_000b: stloc.1
	// 	if (instance.IsKeyDown("ZoomIn") && dungeonHudScreen.AllowCameraZoom)
	IL_000c: ldloc.0
	IL_000d: ldstr "ZoomIn"
	IL_0012: ldnull
	IL_0013: ldc.i4.0
	IL_0014: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0019: brfalse.s IL_002f

	IL_001b: ldloc.1
	IL_001c: callvirt instance bool MGSC.DungeonHudScreen::get_AllowCameraZoom()
	IL_0021: brfalse.s IL_002f

	// 		gameCam.ZoomIn();
	IL_0023: ldarg.s gameCam
	IL_0025: callvirt instance void MGSC.GameCamera::ZoomIn()
	// 	else if (instance.IsKeyDown("ZoomOut") && dungeonHudScreen.AllowCameraZoom)
	IL_002a: br IL_026d

	IL_002f: ldloc.0
	IL_0030: ldstr "ZoomOut"
	IL_0035: ldnull
	IL_0036: ldc.i4.0
	IL_0037: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_003c: brfalse.s IL_0052

	IL_003e: ldloc.1
	IL_003f: callvirt instance bool MGSC.DungeonHudScreen::get_AllowCameraZoom()
	IL_0044: brfalse.s IL_0052

	// 		gameCam.ZoomOut();
	IL_0046: ldarg.s gameCam
	IL_0048: callvirt instance void MGSC.GameCamera::ZoomOut()
	// 	else if (instance.IsKeyDown("MoveMode_Slowdown"))
	IL_004d: br IL_026d

	IL_0052: ldloc.0
	IL_0053: ldstr "MoveMode_Slowdown"
	IL_0058: ldnull
	IL_0059: ldc.i4.0
	IL_005a: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_005f: brfalse.s IL_0072

	// 		creatures.Player.ChangeMoveStateToPrev();
	IL_0061: ldarg.s creatures
	IL_0063: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0068: callvirt instance void MGSC.Player::ChangeMoveStateToPrev()
	// 	else if (instance.IsKeyDown("MoveMode_Speedup"))
	IL_006d: br IL_026d

	IL_0072: ldloc.0
	IL_0073: ldstr "MoveMode_Speedup"
	IL_0078: ldnull
	IL_0079: ldc.i4.0
	IL_007a: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_007f: brfalse.s IL_0092

	// 		creatures.Player.ChangeMoveStateToNext();
	IL_0081: ldarg.s creatures
	IL_0083: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0088: callvirt instance void MGSC.Player::ChangeMoveStateToNext()
	// 	else if (instance.IsKeyDown("SkipTurn"))
	IL_008d: br IL_026d

	IL_0092: ldloc.0
	IL_0093: ldstr "SkipTurn"
	IL_0098: ldnull
	IL_0099: ldc.i4.0
	IL_009a: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_009f: brfalse.s IL_00b2

	// 		creatures.Player.SkipTurn();
	IL_00a1: ldarg.s creatures
	IL_00a3: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_00a8: callvirt instance void MGSC.Player::SkipTurn()
	// 	else if (instance.IsKeyDown("Interact"))
	IL_00ad: br IL_026d

	IL_00b2: ldloc.0
	IL_00b3: ldstr "Interact"
	IL_00b8: ldnull
	IL_00b9: ldc.i4.0
	IL_00ba: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_00bf: brfalse.s IL_0128

	// 		Vector2 axis = instance.GetAxis("", "LookAt", out pressedCount);
	IL_00c1: ldloc.0
	IL_00c2: ldstr ""
	IL_00c7: ldstr "LookAt"
	IL_00cc: ldloca.s 3
	IL_00ce: ldc.r4 0.0
	IL_00d3: ldnull
	IL_00d4: callvirt instance valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 MGSC.InputController::GetAxis(string, string, int32&, float32, class MGSC.Timer)
	IL_00d9: stloc.2
	// 		if (axis != Vector2.zero)
	IL_00da: ldloc.2
	IL_00db: call valuetype [UnityEngine.CoreModule]UnityEngine.Vector2 [UnityEngine.CoreModule]UnityEngine.Vector2::get_zero()
	IL_00e0: call bool [UnityEngine.CoreModule]UnityEngine.Vector2::op_Inequality(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2, valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
	IL_00e5: brfalse.s IL_0116

	// 			Direction directionFromAxis = InputHelper.GetDirectionFromAxis(axis);
	IL_00e7: ldloc.2
	IL_00e8: call valuetype MGSC.Direction MGSC.InputHelper::GetDirectionFromAxis(valuetype [UnityEngine.CoreModule]UnityEngine.Vector2)
	IL_00ed: stloc.s 4
	// 			creatures.Player.ChangeDirection(directionFromAxis);
	IL_00ef: ldarg.s creatures
	IL_00f1: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_00f6: ldloc.s 4
	IL_00f8: ldc.i4.1
	IL_00f9: ldc.i4.1
	IL_00fa: ldc.i4.0
	IL_00fb: callvirt instance bool MGSC.Creature::ChangeDirection(valuetype MGSC.Direction, bool, bool, bool)
	IL_0100: pop
	// 			InteractObstacleInFrontOfPlayer(mapGrid, creatures, mapObstacles, playerCommandQueue, turnMetadata, scenarios);
	IL_0101: ldarg.0
	IL_0102: ldarg.s creatures
	IL_0104: ldarg.s mapObstacles
	IL_0106: ldarg.s playerCommandQueue
	IL_0108: ldarg.s turnMetadata
	IL_010a: ldarg.s scenarios
	IL_010c: call void MGSC.PlayerInteractionSystem::InteractObstacleInFrontOfPlayer(class MGSC.MapGrid, class MGSC.Creatures, class MGSC.MapObstacles, class MGSC.PlayerCommandQueue, class MGSC.TurnMetadata, class MGSC.Scenarios)
	// 			TakeItemOrLootCorpse(scenarios, creatures, mapObstacles, itemsOnFloor);
	IL_0111: br IL_026d

	IL_0116: ldarg.s scenarios
	IL_0118: ldarg.s creatures
	IL_011a: ldarg.s mapObstacles
	IL_011c: ldarg.s itemsOnFloor
	IL_011e: call void MGSC.PlayerInteractionSystem::TakeItemOrLootCorpse(class MGSC.Scenarios, class MGSC.Creatures, class MGSC.MapObstacles, class MGSC.ItemsOnFloor)
	// 	else if (instance.IsKeyDown("TakeItemFromFloor"))
	IL_0123: br IL_026d

	IL_0128: ldloc.0
	IL_0129: ldstr "TakeItemFromFloor"
	IL_012e: ldnull
	IL_012f: ldc.i4.0
	IL_0130: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0135: brfalse.s IL_0149

	// 		TakeItemOrLootCorpse(scenarios, creatures, mapObstacles, itemsOnFloor);
	IL_0137: ldarg.s scenarios
	IL_0139: ldarg.s creatures
	IL_013b: ldarg.s mapObstacles
	IL_013d: ldarg.s itemsOnFloor
	IL_013f: call void MGSC.PlayerInteractionSystem::TakeItemOrLootCorpse(class MGSC.Scenarios, class MGSC.Creatures, class MGSC.MapObstacles, class MGSC.ItemsOnFloor)
	// 	else if (instance.IsKeyDown("SwapAttackMode"))
	IL_0144: br IL_026d

	IL_0149: ldloc.0
	IL_014a: ldstr "SwapAttackMode"
	IL_014f: ldnull
	IL_0150: ldc.i4.0
	IL_0151: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0156: brfalse.s IL_0164

	// 		SwapFiremode(creatures);
	IL_0158: ldarg.s creatures
	IL_015a: call void MGSC.PlayerInteractionSystem::SwapFiremode(class MGSC.Creatures)
	// 	else if (instance.IsKeyDown("SwapMoveMode"))
	IL_015f: br IL_026d

	IL_0164: ldloc.0
	IL_0165: ldstr "SwapMoveMode"
	IL_016a: ldnull
	IL_016b: ldc.i4.0
	IL_016c: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0171: brfalse.s IL_017f

	// 		SwapMoveMode(creatures);
	IL_0173: ldarg.s creatures
	IL_0175: call void MGSC.PlayerInteractionSystem::SwapMoveMode(class MGSC.Creatures)
	// 	else if (instance.IsKeyDown("SwapWeapon"))
	IL_017a: br IL_026d

	IL_017f: ldloc.0
	IL_0180: ldstr "SwapWeapon"
	IL_0185: ldnull
	IL_0186: ldc.i4.0
	IL_0187: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_018c: brfalse.s IL_019a

	// 		SwapWeapon(creatures);
	IL_018e: ldarg.s creatures
	IL_0190: call void MGSC.PlayerInteractionSystem::SwapWeapon(class MGSC.Creatures)
	// 	else if (instance.IsKeyDown("Shoot") && !raidMetadata.StationVisit)
	IL_0195: br IL_026d

	IL_019a: ldloc.0
	IL_019b: ldstr "Shoot"
	IL_01a0: ldnull
	IL_01a1: ldc.i4.0
	IL_01a2: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_01a7: brfalse.s IL_01cd

	IL_01a9: ldarg.s raidMetadata
	IL_01ab: callvirt instance bool MGSC.RaidMetadata::get_StationVisit()
	IL_01b0: brtrue.s IL_01cd

	// 		UI.Chain<SelectShootTarget>().Show().SetBackgroundColor(Colors.Transparent);
	IL_01b2: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.SelectShootTarget>()
	IL_01b7: ldc.i4.1
	IL_01b8: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SelectShootTarget>::Show(bool)
	IL_01bd: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_Transparent()
	IL_01c2: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SelectShootTarget>::SetBackgroundColor(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
	IL_01c7: pop
	// 	else if (instance.IsKeyDown("PreciseCursorShoot") && !raidMetadata.StationVisit && !UI.EventSystem.IsPointerOverGameObject())
	IL_01c8: br IL_026d

	IL_01cd: ldloc.0
	IL_01ce: ldstr "PreciseCursorShoot"
	IL_01d3: ldnull
	IL_01d4: ldc.i4.0
	IL_01d5: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_01da: brfalse.s IL_0205

	IL_01dc: ldarg.s raidMetadata
	IL_01de: callvirt instance bool MGSC.RaidMetadata::get_StationVisit()
	IL_01e3: brtrue.s IL_0205

	// 		EvaluateCursorPreciseShoot(playerCommandQueue, gameCam, mapRenderer, creatures, itemsOnFloor, mapObstacles, mapEntities);
	IL_01e5: call class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem MGSC.UI::get_EventSystem()
	IL_01ea: callvirt instance bool [UnityEngine.UI]UnityEngine.EventSystems.EventSystem::IsPointerOverGameObject()
	IL_01ef: brtrue.s IL_0205

	IL_01f1: ldarg.s playerCommandQueue
	IL_01f3: ldarg.s gameCam
	IL_01f5: ldarg.2
	IL_01f6: ldarg.s creatures
	IL_01f8: ldarg.s itemsOnFloor
	IL_01fa: ldarg.s mapObstacles
	IL_01fc: ldarg.s mapEntities
	IL_01fe: call void MGSC.PlayerInteractionSystem::EvaluateCursorPreciseShoot(class MGSC.PlayerCommandQueue, class MGSC.GameCamera, class MGSC.MapRenderer, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.MapEntities)
	// 	else if (instance.IsKeyDown("ForceCursorMove") && !UI.EventSystem.IsPointerOverGameObject())
	IL_0203: br.s IL_026d

	IL_0205: ldloc.0
	IL_0206: ldstr "ForceCursorMove"
	IL_020b: ldnull
	IL_020c: ldc.i4.0
	IL_020d: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0212: brfalse.s IL_023a

	IL_0214: call class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem MGSC.UI::get_EventSystem()
	IL_0219: callvirt instance bool [UnityEngine.UI]UnityEngine.EventSystems.EventSystem::IsPointerOverGameObject()
	IL_021e: brtrue.s IL_023a

	// 		EvaluateCursorForceMove(playerCommandQueue, gameCam, mapRenderer, mapGrid, creatures, itemsOnFloor, mapObstacles, mapEntities, mapController, hazardController, pathfinder);
	IL_0220: ldarg.s playerCommandQueue
	IL_0222: ldarg.s gameCam
	IL_0224: ldarg.2
	IL_0225: ldarg.0
	IL_0226: ldarg.s creatures
	IL_0228: ldarg.s itemsOnFloor
	IL_022a: ldarg.s mapObstacles
	IL_022c: ldarg.s mapEntities
	IL_022e: ldarg.3
	IL_022f: ldarg.s hazardController
	IL_0231: ldarg.s pathfinder
	IL_0233: call void MGSC.PlayerInteractionSystem::EvaluateCursorForceMove(class MGSC.PlayerCommandQueue, class MGSC.GameCamera, class MGSC.MapRenderer, class MGSC.MapGrid, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.MapEntities, class MGSC.MapController, class MGSC.HazardController, class MGSC.Pathfinder)
	// 	else if (instance.IsKeyDown("PrimaryCursorAction") && !UI.EventSystem.IsPointerOverGameObject())
	IL_0238: br.s IL_026d

	IL_023a: ldloc.0
	IL_023b: ldstr "PrimaryCursorAction"
	IL_0240: ldnull
	IL_0241: ldc.i4.0
	IL_0242: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0247: brfalse.s IL_026d

	IL_0249: call class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem MGSC.UI::get_EventSystem()
	IL_024e: callvirt instance bool [UnityEngine.UI]UnityEngine.EventSystems.EventSystem::IsPointerOverGameObject()
	IL_0253: brtrue.s IL_026d

	// 		EvaluatePrimaryCursorAction(playerCommandQueue, gameCam, mapRenderer, mapGrid, creatures, itemsOnFloor, mapObstacles, mapEntities, mapController, hazardController, pathfinder);
	IL_0255: ldarg.s playerCommandQueue
	IL_0257: ldarg.s gameCam
	IL_0259: ldarg.2
	IL_025a: ldarg.0
	IL_025b: ldarg.s creatures
	IL_025d: ldarg.s itemsOnFloor
	IL_025f: ldarg.s mapObstacles
	IL_0261: ldarg.s mapEntities
	IL_0263: ldarg.3
	IL_0264: ldarg.s hazardController
	IL_0266: ldarg.s pathfinder
	IL_0268: call void MGSC.PlayerInteractionSystem::EvaluatePrimaryCursorAction(class MGSC.PlayerCommandQueue, class MGSC.GameCamera, class MGSC.MapRenderer, class MGSC.MapGrid, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.MapEntities, class MGSC.MapController, class MGSC.HazardController, class MGSC.Pathfinder)

	// 	if (instance.IsKeyDown("SecondaryCursorAction") && !UI.EventSystem.IsPointerOverGameObject())
	IL_026d: ldloc.0
	IL_026e: ldstr "SecondaryCursorAction"
	IL_0273: ldnull
	IL_0274: ldc.i4.0
	IL_0275: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_027a: brfalse.s IL_029c

	IL_027c: call class [UnityEngine.UI]UnityEngine.EventSystems.EventSystem MGSC.UI::get_EventSystem()
	IL_0281: callvirt instance bool [UnityEngine.UI]UnityEngine.EventSystems.EventSystem::IsPointerOverGameObject()
	IL_0286: brtrue.s IL_029c

	// 		EvaluateSecondaryCursorAction(playerCommandQueue, gameCam, mapRenderer, mapGrid, creatures, itemsOnFloor, mapObstacles, mapEntities);
	IL_0288: ldarg.s playerCommandQueue
	IL_028a: ldarg.s gameCam
	IL_028c: ldarg.2
	IL_028d: ldarg.0
	IL_028e: ldarg.s creatures
	IL_0290: ldarg.s itemsOnFloor
	IL_0292: ldarg.s mapObstacles
	IL_0294: ldarg.s mapEntities
	IL_0296: call void MGSC.PlayerInteractionSystem::EvaluateSecondaryCursorAction(class MGSC.PlayerCommandQueue, class MGSC.GameCamera, class MGSC.MapRenderer, class MGSC.MapGrid, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.MapEntities)
	// 	else if (instance.IsKeyDown("ReloadWeapon"))
	IL_029b: ret

	IL_029c: ldloc.0
	IL_029d: ldstr "ReloadWeapon"
	IL_02a2: ldnull
	IL_02a3: ldc.i4.0
	IL_02a4: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_02a9: brfalse.s IL_02b4

	// 		Reload(creatures);
	IL_02ab: ldarg.s creatures
	IL_02ad: ldnull
	IL_02ae: call void MGSC.PlayerInteractionSystem::Reload(class MGSC.Creatures, class MGSC.BasePickupItem)
	// }
	IL_02b3: ret

	// 	else if (instance.IsKeyDown("UseUltimate"))
	IL_02b4: ldloc.0
	IL_02b5: ldstr "UseUltimate"
	IL_02ba: ldnull
	IL_02bb: ldc.i4.0
	IL_02bc: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_02c1: brfalse.s IL_02fb

	// 		if (creatures.Player.CreatureData.HasUltimate)
	IL_02c3: ldarg.s creatures
	IL_02c5: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_02ca: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_02cf: ldfld bool MGSC.CreatureData::HasUltimate
	IL_02d4: brfalse.s IL_02e0

	// 			ActivateUltimatePerk(creatures, raidMetadata);
	IL_02d6: ldarg.s creatures
	IL_02d8: ldarg.s raidMetadata
	IL_02da: call void MGSC.PlayerInteractionSystem::ActivateUltimatePerk(class MGSC.Creatures, class MGSC.RaidMetadata)
	// 			SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
	IL_02df: ret

	IL_02e0: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
	IL_02e5: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
	IL_02ea: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
	IL_02ef: ldc.i4.0
	IL_02f0: ldc.r4 0.0
	IL_02f5: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
	// 	else if (instance.IsKeyDown("Objectives"))
	IL_02fa: ret

	IL_02fb: ldloc.0
	IL_02fc: ldstr "Objectives"
	IL_0301: ldnull
	IL_0302: ldc.i4.0
	IL_0303: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0308: brfalse.s IL_031d

	// 		UI.Chain<ManageRaidScreen>().Show().SetBackOnBackgroundClick(value: true);
	IL_030a: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.ManageRaidScreen>()
	IL_030f: ldc.i4.1
	IL_0310: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.ManageRaidScreen>::Show(bool)
	IL_0315: ldc.i4.1
	IL_0316: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.ManageRaidScreen>::SetBackOnBackgroundClick(bool)
	IL_031b: pop
	// 	else if (instance.IsKeyDown("Map"))
	IL_031c: ret

	IL_031d: ldloc.0
	IL_031e: ldstr "Map"
	IL_0323: ldnull
	IL_0324: ldc.i4.0
	IL_0325: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_032a: brfalse.s IL_033f

	// 		UI.Chain<MinimapScreen>().Show().SetBackOnBackgroundClick(value: true);
	IL_032c: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.MinimapScreen>()
	IL_0331: ldc.i4.1
	IL_0332: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.MinimapScreen>::Show(bool)
	IL_0337: ldc.i4.1
	IL_0338: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.MinimapScreen>::SetBackOnBackgroundClick(bool)
	IL_033d: pop
	// 	else if (instance.IsKeyDown("Implants"))
	IL_033e: ret

	IL_033f: ldloc.0
	IL_0340: ldstr "Implants"
	IL_0345: ldnull
	IL_0346: ldc.i4.0
	IL_0347: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_034c: brfalse.s IL_0361

	// 		UI.Chain<ActiveImplantsWindow>().Show().SetBackOnBackgroundClick(value: true);
	IL_034e: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.ActiveImplantsWindow>()
	IL_0353: ldc.i4.1
	IL_0354: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.ActiveImplantsWindow>::Show(bool)
	IL_0359: ldc.i4.1
	IL_035a: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.ActiveImplantsWindow>::SetBackOnBackgroundClick(bool)
	IL_035f: pop
	// 	else if (instance.IsKeyDown("Mercenary"))
	IL_0360: ret

	IL_0361: ldloc.0
	IL_0362: ldstr "Mercenary"
	IL_0367: ldnull
	IL_0368: ldc.i4.0
	IL_0369: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_036e: brfalse.s IL_0383

	// 		UI.Chain<MercenaryClassScreen>().Show().SetBackOnBackgroundClick(value: true);
	IL_0370: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.MercenaryClassScreen>()
	IL_0375: ldc.i4.1
	IL_0376: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.MercenaryClassScreen>::Show(bool)
	IL_037b: ldc.i4.1
	IL_037c: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.MercenaryClassScreen>::SetBackOnBackgroundClick(bool)
	IL_0381: pop
	// 	else if (instance.IsKeyDown("Health"))
	IL_0382: ret

	IL_0383: ldloc.0
	IL_0384: ldstr "Health"
	IL_0389: ldnull
	IL_038a: ldc.i4.0
	IL_038b: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0390: brfalse.s IL_03a5

	// 		UI.Chain<HealthScreen>().Show().SetBackOnBackgroundClick(value: true);
	IL_0392: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.HealthScreen>()
	IL_0397: ldc.i4.1
	IL_0398: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.HealthScreen>::Show(bool)
	IL_039d: ldc.i4.1
	IL_039e: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.HealthScreen>::SetBackOnBackgroundClick(bool)
	IL_03a3: pop
	// 	else if (instance.IsKeyDown("Skull"))
	IL_03a4: ret

	IL_03a5: ldloc.0
	IL_03a6: ldstr "Skull"
	IL_03ab: ldnull
	IL_03ac: ldc.i4.0
	IL_03ad: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_03b2: brfalse.s IL_03c7

	// 		UI.Chain<SkullProjectScreen>().Show().SetBackOnBackgroundClick(value: true);
	IL_03b4: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.SkullProjectScreen>()
	IL_03b9: ldc.i4.1
	IL_03ba: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SkullProjectScreen>::Show(bool)
	IL_03bf: ldc.i4.1
	IL_03c0: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SkullProjectScreen>::SetBackOnBackgroundClick(bool)
	IL_03c5: pop
	// 	else if (instance.IsKeyDown("Inventory"))
	IL_03c6: ret

	IL_03c7: ldloc.0
	IL_03c8: ldstr "Inventory"
	IL_03cd: ldnull
	IL_03ce: ldc.i4.0
	IL_03cf: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_03d4: brfalse.s IL_040d

	// 		UI.Chain<InventoryScreen>().Show().Invoke(delegate(InventoryScreen v)
	// 		{
	// 			v.ConfigureTabs();
	// 		})
	// 			.SetBackOnBackgroundClick(value: true);
	IL_03d6: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.InventoryScreen>()
	IL_03db: ldc.i4.1
	IL_03dc: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.InventoryScreen>::Show(bool)
	IL_03e1: ldsfld class [mscorlib]System.Action`1<class MGSC.InventoryScreen> MGSC.PlayerInteractionSystem/'<>c'::'<>9__22_0'
	IL_03e6: dup
	IL_03e7: brtrue.s IL_0400

	// (no C# code)
	IL_03e9: pop
	IL_03ea: ldsfld class MGSC.PlayerInteractionSystem/'<>c' MGSC.PlayerInteractionSystem/'<>c'::'<>9'
	IL_03ef: ldftn instance void MGSC.PlayerInteractionSystem/'<>c'::'<ProcessInput>b__22_0'(class MGSC.InventoryScreen)
	IL_03f5: newobj instance void class [mscorlib]System.Action`1<class MGSC.InventoryScreen>::.ctor(object, native int)
	IL_03fa: dup
	IL_03fb: stsfld class [mscorlib]System.Action`1<class MGSC.InventoryScreen> MGSC.PlayerInteractionSystem/'<>c'::'<>9__22_0'

	IL_0400: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.InventoryScreen>::Invoke(class [mscorlib]System.Action`1<!0>)
	IL_0405: ldc.i4.1
	IL_0406: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.InventoryScreen>::SetBackOnBackgroundClick(bool)
	IL_040b: pop
	// 	else if (instance.IsKeyDown("CombatLog"))
	IL_040c: ret

	IL_040d: ldloc.0
	IL_040e: ldstr "CombatLog"
	IL_0413: ldnull
	IL_0414: ldc.i4.0
	IL_0415: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_041a: brfalse.s IL_0423

	// 		dungeonHudScreen.ToggleLog();
	IL_041c: ldloc.1
	IL_041d: callvirt instance void MGSC.DungeonHudScreen::ToggleLog()
	// 	else if (instance.IsKeyDown("Vest"))
	IL_0422: ret

	IL_0423: ldloc.0
	IL_0424: ldstr "Vest"
	IL_0429: ldnull
	IL_042a: ldc.i4.0
	IL_042b: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0430: brfalse.s IL_0481

	// 		if (creatures.Player.CreatureData.Inventory.VestStore.Empty)
	IL_0432: ldarg.s creatures
	IL_0434: ldfld class MGSC.Player MGSC.Creatures::Player
	IL_0439: ldfld class MGSC.CreatureData MGSC.Creature::CreatureData
	IL_043e: ldfld class MGSC.Inventory MGSC.CreatureData::Inventory
	IL_0443: ldfld class MGSC.ItemStorage MGSC.Inventory::VestStore
	IL_0448: callvirt instance bool MGSC.ItemStorage::get_Empty()
	IL_044d: brfalse.s IL_046a

	// 			SingletonMonoBehaviour<SoundController>.Instance.PlayUiSound(SingletonMonoBehaviour<SoundsStorage>.Instance.EmptyAttack);
	IL_044f: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundController>::get_Instance()
	IL_0454: call !0 class MGSC.SingletonMonoBehaviour`1<class MGSC.SoundsStorage>::get_Instance()
	IL_0459: ldfld class [UnityEngine.AudioModule]UnityEngine.AudioClip MGSC.SoundsStorage::EmptyAttack
	IL_045e: ldc.i4.0
	IL_045f: ldc.r4 0.0
	IL_0464: callvirt instance void MGSC.SoundController::PlayUiSound(class [UnityEngine.AudioModule]UnityEngine.AudioClip, bool, float32)
	// 			UI.Chain<SelectVest>().Show().SetBackgroundColor(Colors.Transparent);
	IL_0469: ret

	IL_046a: call class MGSC.UI/CmdChain`1<!!0> MGSC.UI::Chain<class MGSC.SelectVest>()
	IL_046f: ldc.i4.1
	IL_0470: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SelectVest>::Show(bool)
	IL_0475: call valuetype [UnityEngine.CoreModule]UnityEngine.Color MGSC.Colors::get_Transparent()
	IL_047a: callvirt instance class MGSC.UI/CmdChain`1<!0> class MGSC.UI/CmdChain`1<class MGSC.SelectVest>::SetBackgroundColor(valuetype [UnityEngine.CoreModule]UnityEngine.Color)
	IL_047f: pop
	// 	else if (instance.IsKeyDown("Vest1"))
	IL_0480: ret

	IL_0481: ldloc.0
	IL_0482: ldstr "Vest1"
	IL_0487: ldnull
	IL_0488: ldc.i4.0
	IL_0489: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_048e: brfalse.s IL_049b

	// 		InteractVestSlot(creatures, raidMetadata, 1);
	IL_0490: ldarg.s creatures
	IL_0492: ldarg.s raidMetadata
	IL_0494: ldc.i4.1
	IL_0495: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 	else if (instance.IsKeyDown("Vest2"))
	IL_049a: ret

	IL_049b: ldloc.0
	IL_049c: ldstr "Vest2"
	IL_04a1: ldnull
	IL_04a2: ldc.i4.0
	IL_04a3: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_04a8: brfalse.s IL_04b5

	// 		InteractVestSlot(creatures, raidMetadata, 2);
	IL_04aa: ldarg.s creatures
	IL_04ac: ldarg.s raidMetadata
	IL_04ae: ldc.i4.2
	IL_04af: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 	else if (instance.IsKeyDown("Vest3"))
	IL_04b4: ret

	IL_04b5: ldloc.0
	IL_04b6: ldstr "Vest3"
	IL_04bb: ldnull
	IL_04bc: ldc.i4.0
	IL_04bd: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_04c2: brfalse.s IL_04cf

	// 		InteractVestSlot(creatures, raidMetadata, 3);
	IL_04c4: ldarg.s creatures
	IL_04c6: ldarg.s raidMetadata
	IL_04c8: ldc.i4.3
	IL_04c9: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 	else if (instance.IsKeyDown("Vest4"))
	IL_04ce: ret

	IL_04cf: ldloc.0
	IL_04d0: ldstr "Vest4"
	IL_04d5: ldnull
	IL_04d6: ldc.i4.0
	IL_04d7: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_04dc: brfalse.s IL_04e9

	// 		InteractVestSlot(creatures, raidMetadata, 4);
	IL_04de: ldarg.s creatures
	IL_04e0: ldarg.s raidMetadata
	IL_04e2: ldc.i4.4
	IL_04e3: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 	else if (instance.IsKeyDown("Vest5"))
	IL_04e8: ret

	IL_04e9: ldloc.0
	IL_04ea: ldstr "Vest5"
	IL_04ef: ldnull
	IL_04f0: ldc.i4.0
	IL_04f1: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_04f6: brfalse.s IL_0503

	// 		InteractVestSlot(creatures, raidMetadata, 5);
	IL_04f8: ldarg.s creatures
	IL_04fa: ldarg.s raidMetadata
	IL_04fc: ldc.i4.5
	IL_04fd: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 	else if (instance.IsKeyDown("Vest6"))
	IL_0502: ret

	IL_0503: ldloc.0
	IL_0504: ldstr "Vest6"
	IL_0509: ldnull
	IL_050a: ldc.i4.0
	IL_050b: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0510: brfalse.s IL_051d

	// 		InteractVestSlot(creatures, raidMetadata, 6);
	IL_0512: ldarg.s creatures
	IL_0514: ldarg.s raidMetadata
	IL_0516: ldc.i4.6
	IL_0517: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 	else if (instance.IsKeyDown("Vest7"))
	IL_051c: ret

	IL_051d: ldloc.0
	IL_051e: ldstr "Vest7"
	IL_0523: ldnull
	IL_0524: ldc.i4.0
	IL_0525: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_052a: brfalse.s IL_0537

	// 		InteractVestSlot(creatures, raidMetadata, 7);
	IL_052c: ldarg.s creatures
	IL_052e: ldarg.s raidMetadata
	IL_0530: ldc.i4.7
	IL_0531: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 	else if (instance.IsKeyDown("Vest8"))
	IL_0536: ret

	IL_0537: ldloc.0
	IL_0538: ldstr "Vest8"
	IL_053d: ldnull
	IL_053e: ldc.i4.0
	IL_053f: callvirt instance bool MGSC.InputController::IsKeyDown(string, string, bool)
	IL_0544: brfalse.s IL_0551

	// 		InteractVestSlot(creatures, raidMetadata, 8);
	IL_0546: ldarg.s creatures
	IL_0548: ldarg.s raidMetadata
	IL_054a: ldc.i4.8
	IL_054b: call void MGSC.PlayerInteractionSystem::InteractVestSlot(class MGSC.Creatures, class MGSC.RaidMetadata, int32)
	// 		ProcessCameraInput(instance, gameCam);
	IL_0550: ret

	IL_0551: ldloc.0
	IL_0552: ldarg.s gameCam
	IL_0554: call void MGSC.PlayerInteractionSystem::ProcessCameraInput(class MGSC.InputController, class MGSC.GameCamera)
	// 		ProcessMoveInput(instance, mapGrid, mapMetadata, mapRenderer, mapController, creatures, itemsOnFloor, mapObstacles, playerCommandQueue, turnMetadata, raidMetadata, combatLog, scenarios, fireController, visibilities, mapEntities);
	IL_0559: ldloc.0
	IL_055a: ldarg.0
	IL_055b: ldarg.1
	IL_055c: ldarg.2
	IL_055d: ldarg.3
	IL_055e: ldarg.s creatures
	IL_0560: ldarg.s itemsOnFloor
	IL_0562: ldarg.s mapObstacles
	IL_0564: ldarg.s playerCommandQueue
	IL_0566: ldarg.s turnMetadata
	IL_0568: ldarg.s raidMetadata
	IL_056a: ldarg.s combatLog
	IL_056c: ldarg.s scenarios
	IL_056e: ldarg.s fireController
	IL_0570: ldarg.s visibilities
	IL_0572: ldarg.s mapEntities
	IL_0574: call void MGSC.PlayerInteractionSystem::ProcessMoveInput(class MGSC.InputController, class MGSC.MapGrid, class MGSC.MapMetadata, class MGSC.MapRenderer, class MGSC.MapController, class MGSC.Creatures, class MGSC.ItemsOnFloor, class MGSC.MapObstacles, class MGSC.PlayerCommandQueue, class MGSC.TurnMetadata, class MGSC.RaidMetadata, class MGSC.CombatLog, class MGSC.Scenarios, class MGSC.FireController, class MGSC.Visibilities, class MGSC.MapEntities)
	// (no C# code)
	IL_0579: ret
} // end of method PlayerInteractionSystem::ProcessInput

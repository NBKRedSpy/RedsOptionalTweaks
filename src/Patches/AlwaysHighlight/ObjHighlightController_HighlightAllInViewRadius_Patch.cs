using HarmonyLib;
using MGSC;
using RedsOptionalTweaks.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using System.Runtime.Remoting.Messaging;
using UnityEngine;
using static HarmonyLib.Code;
using static Unity.IO.LowLevel.Unsafe.AsyncReadManagerMetrics;

namespace RedsOptionalTweaks.Patches.AlwaysHighlight
{
    [CopyWarning(typeof(ObjHighlightController), nameof(ObjHighlightController.HighlightAllInViewRadius))]
    [HarmonyPatch(typeof(ObjHighlightController), nameof(ObjHighlightController.HighlightAllInViewRadius))]
    public static class ObjHighlightController_HighlightAllInViewRadius_Patch
    {
        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableAlwaysHighlight),
                Plugin.Config.EnableAlwaysHighlight);
        }

        public static void Postfix(ObjHighlightController __instance, bool val)
        {

            //COPY WARNING - ObjHighlightController.HighlightAllInViewRadius.  This is a copy of the end of the function,
            //    with slight changes.
            DungeonHudScreen dungeonHudScreen = UI.Get<DungeonHudScreen>();
            foreach (Creature monster in __instance._creatures.Monsters)
            {
                bool flag2 = monster.IsSeenByPlayer;
                monster.Highlight(flag2, destroyable: false);


                if (flag2 && dungeonHudScreen.TryGetMonsterBar(monster, out var monsterBar))
                {
                    monsterBar.Focused = false;
                    monsterBar.AltFocus = false;
                }
            }

        }

    }
}

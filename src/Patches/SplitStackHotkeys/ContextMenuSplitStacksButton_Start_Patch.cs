using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using JetBrains.Annotations;
using MGSC;

namespace RedsOptionalTweaks.Patches.SplitStackHotkeys
{

    /// <summary>
    /// Attaches the SplitSlideComponent to the ContextMenuSplitStacksButton to enable hotkey functionality
    /// for the Split Stacks dialog.
    /// </summary>
    [HarmonyPatch(typeof(ContextMenuSplitStacksButton), nameof(ContextMenuSplitStacksButton.Start))]
    public static class ContextMenuSplitStacksButton_Start_Patch
    {
        public static bool Prepare()
        {
            return Plugin.Config.EnableSplitStacksKeys;
        }   

        public static void Postfix([NotNull] ContextMenuSplitStacksButton __instance)
        {
            SplitSlideComponent.AddTo(__instance);
        }   
    }
}


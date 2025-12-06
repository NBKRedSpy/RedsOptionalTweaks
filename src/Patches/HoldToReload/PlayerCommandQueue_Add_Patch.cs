using HarmonyLib;
using MGSC;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.HoldToReload
{

    /// <summary>
    /// Add a reload anytime a move command is added if the reload key is held.
    /// Required as otherwise move commands that are added in the middle of the turn will not have a reload added.
    /// Ex:  User starts a new turn in run mode.  They hold the Reload Key and click to move one or two tiles.  
    /// Without this code, the reload command would not be added before the move commands.
    /// </summary>
    [HarmonyPatch(typeof(PlayerCommandQueue), nameof(PlayerCommandQueue.Add))]
    public static class PlayerCommandQueue_Add_Patch
    {

        public static bool Prepare(ICommand command)
        {

            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableHoldToReload),
                Plugin.Config.EnableHoldToReload);
        }

        public static void Postfix(PlayerCommandQueue __instance, ICommand cmd)
        {
            if (cmd is MoveCommand && InputController.Instance.IsKey(Plugin.ReloadCommandKey))
            {
                //Add a reload command before the move command.
                __instance._commands.Insert(__instance._commands.IndexOf(cmd), new ReloadWeaponCommand());
            }

        }

    }
}

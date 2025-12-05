using HarmonyLib;
using MGSC;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.HoldToReload
{


    /// <summary>
    /// Since the movement commands are queued, add reload commands before each movement command if the reload key is held.
    /// The Skip Turn logic has to be handled in a different area.
    /// </summary>
    [HarmonyPatch(typeof(Player), nameof(Player.NextTurnStarted))]
    public static class Player_NextTurnStarted_Patch
    {

        public static bool Prepare()
        {
            return Plugin.Config.EnableHoldToReload;
        }

        /// <summary>
        /// Add the reload commands before each movement command if the reload key is held.
        /// Remove the reload commands if the reload key is not held.
        /// This is necessary to handle the user pressing and releasing the reload key when the movement commands are already queued.
        /// </summary>
        public static void Postfix()
        {
            PlayerCommandQueue playerCommandQueue = Bootstrap._state.Get<PlayerCommandQueue>();
            bool reloadWeapon = InputController.Instance.IsKey(Plugin.ReloadCommandKey);

            if (reloadWeapon)
            {

                //Add reload requests before every queued move.
                for (int i = 0; i < playerCommandQueue._commands.Count; i++)
                {
                    var command = playerCommandQueue._commands[i];
                    if (command is MoveCommand && (i == 0 || playerCommandQueue._commands[i - 1] is not ReloadWeaponCommand))
                    {
                        playerCommandQueue._commands.Insert(i, new ReloadWeaponCommand());
                    }
                }
            }
            else
            {
                //Remove any commands that are reloads.
                for (int i = playerCommandQueue._commands.Count - 1; i >= 0; i--)
                {
                    var command = playerCommandQueue._commands[i];
                    //Note - "ReloadCurrentWeaponCommand" is the console command, not a player command
                    if (command is ReloadWeaponCommand)
                    {
                        playerCommandQueue._commands.RemoveAt(i);
                    }
                }
            }

        }
    }
}

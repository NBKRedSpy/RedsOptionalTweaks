using HarmonyLib;
using MGSC;
using System.Reflection;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.ShowStationInfo
{

    /// <summary>
    /// Show the station info the user is holding down the alt key.  Otherwise, show the normal info.
    /// </summary>
    [HarmonyPatch(typeof(TooltipFactory), nameof(TooltipFactory.BuildStationTooltip))]
    public class TooltipFactory_BuildStationTooltip_Patch
    {
        public static bool Prepare()
        {
            return Plugin.DisableManager.IsFeatureEnabled(
                nameof(ModConfig.EnableShowStationInfo),
                Plugin.Config.EnableShowStationInfo);
        }

        public static bool  Prefix(TooltipFactory __instance, ref StationStatus stationStatus, ref Mission mission)
        {
            /// WARNING Function Takeover - This takes over the game's function when showing a mission.

            //Debug - override to use the trade station tooltip
            if (InputHelper.GetKey(KeyCode.LeftAlt))
            {
                stationStatus = StationStatus.Peaceful;
                mission = null;
            }
            else if(mission!= null)
            {
                //This is identical to the game's early exit code.
                //  But addsd the ShowAdditionalBlock call.
                __instance.BuildMissionTooltip(mission);

                //Add the "alt" for more information indicator.
                __instance._tooltip.ShowAdditionalBlock();
                return false; 

            }

            return true;
        }
    }
}

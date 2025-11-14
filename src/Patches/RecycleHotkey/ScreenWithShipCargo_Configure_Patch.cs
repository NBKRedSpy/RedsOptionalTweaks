using HarmonyLib;
using MGSC;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace RedsOptionalTweaks.Patches.RecycleHotkey
{
    /// <summary>
    /// Attaches the Recycling hotkey functionality to the Arsenal screen.
    /// </summary>

    [HarmonyPatch(typeof(ArsenalScreen), nameof(ArsenalScreen.Configure))]
    public static class ScreenWithShipCargo_Configure_Patch
    {
        public static void Prefix(ArsenalScreen __instance)
        {
            ShipCargoUpdateComponent.CreateComponent<ShipCargoUpdateComponent>(__instance);
        }
    }
}

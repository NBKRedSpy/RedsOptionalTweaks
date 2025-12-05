using HarmonyLib;
using MGSC;
using RedsOptionalTweaks.Mcm;
using RedsOptionalTweaks.Utils;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using UnityEngine;
using Logger = RedsOptionalTweaks.Utils.Logger;

namespace RedsOptionalTweaks
{
    public static class Plugin
    {
        public const string ReloadCommandKey = "ReloadWeapon";


        public static ConfigDirectories ConfigDirectories = new ConfigDirectories();

        public static ModConfig Config { get; private set; }

        public static Logger Logger = new Logger();

        public static State State { get; set; } = null;

        internal static McmConfiguration McmConfiguration { get; private set; }

        [Hook(ModHookType.AfterConfigsLoaded)]
        public static void AfterConfig(IModContext context)
        {

            //Verify version
            if (!IsCompatibleWithGameVersion()) return;

            State = context.State;  

            Directory.CreateDirectory(ConfigDirectories.ModPersistenceFolder);
            Config =  new ModConfig(ConfigDirectories.ConfigPath).LoadConfig();

            McmConfiguration = new McmConfiguration(Config);
            McmConfiguration.TryConfigure();

            ApplyNonHarmonyPatches();

            new Harmony("NBKRedSpy_" + ConfigDirectories.ModAssemblyName).PatchAll();
        }

        private static void ApplyNonHarmonyPatches()
        {
            //Increases the ship speed if enabled.
            if (Config.EnableShipSpeedBoost)
            {
                Data.Global.DistanceToHours /= Config.ShipSpeedIncrease;
            }
        }

        private static bool IsCompatibleWithGameVersion()
        {

            bool isCompatible = GetNumericVersion(Application.version) >= new Version(0, 9, 6);

            if(!isCompatible)
            {
                Logger.LogError($"Misc Tweaks mod is not compatible with game version {Application.version}.  Disabling mod.");
            }

            return isCompatible;
        }

        private static Version GetNumericVersion(string versionString)
        {
            // Only take the numeric parts as build and store version are store specific.

            List<string> numericParts =
                versionString.Split('.')
                .TakeWhile(x => Regex.IsMatch(x, @"^\d+$"))
                .ToList();

            // Pad with zeros if less than 2 parts (Version requires at least major, minor)
            while (numericParts.Count < 2) numericParts.Add("0");

            string numericVersion = string.Join(".", numericParts.Take(4).ToArray()); // Version supports up to 4 parts

            return new Version(numericVersion);
        }


    }
}

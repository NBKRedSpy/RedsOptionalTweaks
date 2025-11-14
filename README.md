# Quasimorph Red's Optional Tweaks Mod

![thumbnail icon](media/thumbnail.png)

**Important**: This currently *only* works with the beta.

# Description
A collection of various tweaks which are mostly QoL.  All are disabled by default and must be enabled in the Mods config on the main menu.
Enable by checking the "Enable" box for each piece of functionality.  After saving the changes, restart the game.

# Tweaks Overview
The mod has the following functionality:

**Quality of Life** - Does not affect game balance

* ⌨️ Mouse Quick Toss Rebind - Change the key bind for what the game calls "Fast Toss".  By default the game uses the Control key to move items between storage panes.
* ⌨️ Split Stacks Hotkeys - Adds hotkeys for amount presets and adds "increase" and "decrease" hotkeys.
* ⌨️ Hold R while hovering over items in the ship cargo to move that item to the recycler tab.

**Balance Change**
* 🚀 Ship Speed Boost - Increase the speed of ship travel.

More
* 🧪 More items in the future...

Each tweak can be configured in the Mods button on the main menu, under the "Red's Optional Tweaks" section.  
For details on each tweak, see the related section below.

## Maximum Compatibility
Each tweak works like its own mini-mod. Disable one, and it's as if it was never there.  This is useful for working around bugs or handling conflicts with other mods.

See the [Compatibility - Technical](#compatibility---technical) section for details.

# Tweaks
## Mouse Quick Toss Rebind
Allows the user to bind the "quick toss" key.  This is where the user can hold the ctrl key down while the mouse is over an item to move the item to the other inventory.
By default it is remapped to middle mouse button (AKA Mouse2).

## Ship Speed Boost
Changes the ship's speed to decrease travel times.  By default this sets the ship to 2x the speed.

## Split Stacks Hotkeys
When a stack of items is being split, the split dialog is shown.  This tweak adds the following:

Adds increase and decrease hotkeys to change the value by one.  By default it is A and D. 

Adds up to five preset amounts.  For example, the user can press 1 and the dialog will change the "keep" amount (the number on the right) to 10.
By default, 1 is set to 10, and 2 is set to 5.

## Move to Recycler
Hold R while hovering over items in the ship cargo to move that item to the recycler tab.
Avoids needing to move each item to the recycler with drag and drop.

# Compatibility - Technical
For modders, here are the technical details.

Each tweak contains their own patches and uses the enabled flag in the Harmony Prepare function to enable the tweak.  Non Harmony patches are gated by the same  enable flag.

# Configuration
The configuration can be changed with either the Mod Configuration Menu's "Mods" button on the main menu, or directly in the config file.  The "Mods" button is the preferred route.

The config file is found at is found at `%AppData%\..\LocalLow\Magnum Scriptum Ltd\Quasimorph_ModConfigs\RedsOptionalTweaks\config.json` and will be created the first time the game is run.  Changes will be applied when the game is restarted.

For any key binding items, see the [Key List](#key-list) section below.

## Key List
The list of valid keyboard keys can be found  at the bottom of https://docs.unity3d.com/ScriptReference/KeyCode.html
Beware that numbers 0-9 are Alpha0 - Alpha9.  Most of the other keys are as expected such as X for X.
Use "None" to not bind the key.

# Enjoying the Mods?
If you enjoy my mods and want to buy me a coffee, check out my [Ko-Fi](https://ko-fi.com/nbkredspy71915) page.
Thanks!

# Source Code
Source code is available on GitHub at https://github.com/NBKRedSpy/RedsOptionalTweaks

# Credits
* Special thanks to Crynano for his excellent Mod Configuration Menu.
* The TF2 RedSpy icon is from the reddit user [iwilding](https://www.reddit.com/user/iwilding/) from the post found [here](https://www.reddit.com/r/tf2/comments/2384j5/i_drew_a_red_spy/)
* The Ship Speed Boost is based on Steam user [critic](https://steamcommunity.com/id/cybercritic)'s mod [Ship Speed Boost](https://steamcommunity.com/sharedfiles/filedetails/?id=3548633074).  The functionality is replicated with permission.

# 1.1.0 
* Added "Move to Recycler" functionality
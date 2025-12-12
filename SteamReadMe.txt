[h1]Quasimorph Red's Optional Modifications Mod[/h1]


[h1]Modifications Overview[/h1]

Below is a list of functionality in mod.

By default, each individual piece of functionality has to be turned on in the Mods -> Red's Optional Tweaks screen.
This allows the user to choose only the changes they want.
[table]
[tr]
[td]Type
[/td]
[td]Name
[/td]
[td]Description
[/td]
[/tr]
[tr]
[td]Balance
[/td]
[td]Ship Speed Boost
[/td]
[td]Increase the speed of ship travel.
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]Implant Indicator
[/td]
[td]Changes the yellow "has augment" dot to green if the inspected creature has an implant
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]Recycle Hotkey Quick Move
[/td]
[td]Hold R while hovering over items in the ship cargo to move that item to the recycler tab.
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]Stack Total Inventory Count
[/td]
[td]When holding the alt key, the count on stacks will show the total amount of that item owned. This is identical to the number that is shown in the item's tooltip
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]Hold Reload
[/td]
[td]Can hold the reload key to keep reloading when waiting and moving.  Useful for single load weapons
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]Mouse Quick Toss Rebind
[/td]
[td]Change the key bind for what the game calls "Fast Toss". By default the game uses the Control key to move items between storage panes.
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]QMeter Visual
[/td]
[td]When in a raid, changes the QMorphos state name to yellow when above 800. This matches the music intensity change in the game at this level.
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]Show Station Info
[/td]
[td]When a station has a mission, hold the alt key to see the station info.  Important! Must hold down alt before entering the station's UI rectangle.
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]Split Stacks Hotkeys
[/td]
[td]Adds hotkeys for amount presets and adds "increase" and "decrease" hotkeys.
[/td]
[/tr]
[tr]
[td]QoL
[/td]
[td]Show Experience Maxed
[/td]
[td]Adds an asterisk to the Experience Item gain tooltip if the merc has the perk, but is already at the max level
[/td]
[/tr]
[/table]

🧪 More items in the future...

[h2]Notes[/h2]

Show Station Info: Currently pressing alt while hovering a station does not work. The user must hold alt [i]before[/i] hovering the desired station.

For details on each modification, see the related section below.

[h2]Maximum Compatibility[/h2]

Each modification works like its own mini-mod. Disable one, and it's as if it was never there.  This is useful for working around bugs or handling conflicts with other mods.

See the Compatibility - Technical section for details.

[h1]Modifications[/h1]

[h2]Q-Meter Visual[/h2]


Changes the color of the Q-Meter text to yellow once the level gets over 800.
If the user is playing with the background music off, they do not have the music change as an indicator of a high Q-Meter.

[h2]Ship Speed Boost[/h2]

Changes the ship's speed to decrease travel times.  By default this sets the ship to 2x the speed.

[h2]Implant Indicator[/h2]


When inspecting a creature during a raid, the yellow "has augment" indicator will be green if there is an implant installed.

[h2]Mouse Quick Toss Rebind[/h2]

Allows the user to bind the "quick toss" key.  This is where the user can hold the ctrl key down while the mouse is over an item to move the item to the other inventory.
By default it is remapped to middle mouse button (AKA Mouse2).

[h2]Hold Reload[/h2]

When moving or waiting a turn, holding the Reload key will continue to reload.  For example, if a shotgun requires a reload, the user can hold the Reload key while moving. For each step, a reload will occur as long as the user is still holding the Reload key.  Note that when holding reload, the reload doesn't actually start until the user ends the action.

If you are looking for an automated version of the reload, check out Traveler's "Walk and Auto Reload" mod found [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3601126533]here[/url]

The purpose of my modification is to mirror the base game's requirement to remember to reload, but remove the need to spam the Reload key. I think that forgetting to reload makes some memorable situations.

[h2]Show Experience Maxed[/h2]


[h2]Show Station Info[/h2]


Allows the user to see the station info, even when there is a mission.
Important! Currently you must hold the alt key down [i]before[/i] hovering over the station.

[h2]Split Stacks Hotkeys[/h2]

When a stack of items is being split, the split dialog is shown.  This modification adds the following:

Adds increase and decrease hotkeys to change the value by one.  By default it is A and D.

Adds up to five preset amounts.  For example, the user can press 1 and the dialog will change the "keep" amount (the number on the right) to 10.
By default, 1 is set to 10, and 2 is set to 5.

[h2]Recycle Hotkey Quick Move[/h2]

Hold R while hovering over items in the ship cargo to move that item to the recycler tab.  Avoids needing to move each item to the recycler with drag and drop.

[h2]Stack Total Inventory Count[/h2]

When in a screen that shows item stacks, holding alt will show the total amount of each item type that are owned.  This is the same count as found in the tooltip when hovering an item.

[b]Normal count showing how many items are in the stack:[/b]

[b]Holding alt shows the amount currently owned.[/b]

This allows the user to quickly determine if they want to pickup item X or item Y depending on how much of each they already have back in the ship.
The green color indicates that the user owns 20 or less of that item.  The value can be completely turned off by setting the threshold value to zero.
This number is identical to what is shown on the tooltip, so items that are dropped off in the shuttle or drop pod are not included in the count.

[h1]Compatibility - Technical[/h1]

For modders, here are the technical details.

Each modification contains their own patches and uses the enabled flag in the Harmony Prepare function to enable the modification.  Non Harmony patches are gated by the same  enable flag.

[h1]Configuration[/h1]

The configuration can be changed with either the Mod Configuration Menu's "Mods" button on the main menu, or directly in the config file.  The "Mods" button is the preferred route.

The config file is found at is found at [i]%AppData%\..\LocalLow\Magnum Scriptum Ltd\Quasimorph_ModConfigs\RedsOptionalTweaks\config.json[/i] and will be created the first time the game is run.  Changes will be applied when the game is restarted.

For any key binding items, see the Key List section below.

[h2]Key List[/h2]

The list of valid keyboard keys can be found  at the bottom of https://docs.unity3d.com/ScriptReference/KeyCode.html
Beware that numbers 0-9 are Alpha0 - Alpha9.  Most of the other keys are as expected such as X for X.
Use "None" to not bind the key.

[h1]Enjoying the Mods?[/h1]

If you enjoy my mods and want to buy me a coffee, check out my [url=https://ko-fi.com/nbkredspy71915]Ko-Fi[/url] page.
Thanks!

[h1]Source Code[/h1]

Source code is available on GitHub at https://github.com/NBKRedSpy/RedsOptionalTweaks

[h1]Changes[/h1]

See the [url=./CHANGELOG.md]CHANGELOG.md[/url] for the list of changes.

[h1]Credits[/h1]
[list]
[*]Special thanks to Crynano for his excellent Mod Configuration Menu.
[*]The TF2 RedSpy icon is from the reddit user [url=https://www.reddit.com/user/iwilding/]iwilding[/url] from the post found [url=https://www.reddit.com/r/tf2/comments/2384j5/i_drew_a_red_spy/]here[/url]
[*]The Ship Speed Boost is based on Steam user [url=https://steamcommunity.com/id/cybercritic]critic[/url]'s mod [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3548633074]Ship Speed Boost[/url].  The functionality is replicated with permission.
[*]TF2 Font is from [url=https://www.fontriver.com/font/tf2_build/]fontriver[/url]
[/list]

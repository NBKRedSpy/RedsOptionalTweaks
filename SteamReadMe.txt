[h1]Quasimorph Red's Optional Tweaks Mod[/h1]


[b]Important[/b]: This currently [i]only[/i] works with the beta.

[h1]Description[/h1]

A collection of various tweaks which are mostly QoL.  All are disabled by default and must be enabled in the Mods config on the main menu.
Enable by checking the "Enable" box for each piece of functionality.  After saving the changes, restart the game.

[h1]Tweaks Overview[/h1]

The mod has the following functionality:

[b]Quality of Life[/b] - Does not affect game balance
[list]
[*]⌨️ Mouse Quick Toss Rebind - Change the key bind for what the game calls "Fast Toss".  By default the game uses the Control key to move items between storage panes.
[*]⌨️ Split Stacks Hotkeys - Adds hotkeys for amount presets and adds "increase" and "decrease" hotkeys.
[*]⌨️ Hold R while hovering over items in the ship cargo to move that item to the recycler tab.
[/list]

[b]Balance Change[/b]
[list]
[*]🚀 Ship Speed Boost - Increase the speed of ship travel.
[/list]

More
[list]
[*]🧪 More items in the future...
[/list]

Each tweak can be configured in the Mods button on the main menu, under the "Red's Optional Tweaks" section.
For details on each tweak, see the related section below.

[h2]Maximum Compatibility[/h2]

Each tweak works like its own mini-mod. Disable one, and it's as if it was never there.  This is useful for working around bugs or handling conflicts with other mods.

See the Compatibility - Technical section for details.

[h1]Tweaks[/h1]

[h2]Mouse Quick Toss Rebind[/h2]

Allows the user to bind the "quick toss" key.  This is where the user can hold the ctrl key down while the mouse is over an item to move the item to the other inventory.
By default it is remapped to middle mouse button (AKA Mouse2).

[h2]Ship Speed Boost[/h2]

Changes the ship's speed to decrease travel times.  By default this sets the ship to 2x the speed.

[h2]Split Stacks Hotkeys[/h2]

When a stack of items is being split, the split dialog is shown.  This tweak adds the following:

Adds increase and decrease hotkeys to change the value by one.  By default it is A and D.

Adds up to five preset amounts.  For example, the user can press 1 and the dialog will change the "keep" amount (the number on the right) to 10.
By default, 1 is set to 10, and 2 is set to 5.

[h2]Move to Recycler[/h2]

Hold R while hovering over items in the ship cargo to move that item to the recycler tab.
Avoids needing to move each item to the recycler with drag and drop.

[h1]Compatibility - Technical[/h1]

For modders, here are the technical details.

Each tweak contains their own patches and uses the enabled flag in the Harmony Prepare function to enable the tweak.  Non Harmony patches are gated by the same  enable flag.

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

[h1]Credits[/h1]
[list]
[*]Special thanks to Crynano for his excellent Mod Configuration Menu.
[*]The TF2 RedSpy icon is from the reddit user [url=https://www.reddit.com/user/iwilding/]iwilding[/url] from the post found [url=https://www.reddit.com/r/tf2/comments/2384j5/i_drew_a_red_spy/]here[/url]
[*]The Ship Speed Boost is based on Steam user [url=https://steamcommunity.com/id/cybercritic]critic[/url]'s mod [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3548633074]Ship Speed Boost[/url].  The functionality is replicated with permission.
[/list]

[h1]1.1.0[/h1]
[list]
[*]Added "Move to Recycler" functionality
[/list]

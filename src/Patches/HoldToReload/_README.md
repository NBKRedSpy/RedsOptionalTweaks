Most of this work is due to needing to add the reload *before* a movement command so the player isn't stuck with a reload
in queue when spotting an enemy.

The "hold to reload" required a suprising number of patches as there are several scenarios to handle:
* Skipping turn
* Skipping turn while an enemy is in sight (different area)
* Starting reload in middle of queued movement
* Releasing reload key mid queued movement
* Preventing clearing of command queue when reload key is held down

# Patches

## DungeonGameMode_Update_Patch
Ensures holding the reload key down doesn't clear the command queue.  There is a generic 
anyKey check.

## Player_NextTurnStarted_Patch.cs
Handles if the user holds the reload key down *after* movements have been queued.  
The game queues up all of the movement commands when a move is started, so can't use 
the command queue "add" method patch for this.

Also handles if the user releases the reload key mid queued movement.

## Player_ProcessActionPoint_Patch
Handles if the user is holding to reload, but still sees a threat.

## PlayerCommandQueue_Add_Patch
Handles if the user holds the reload while in the same turn.  For example, a single step, or two steps.
Otherwise reloading would not actually start until the next turn.

## PlayerInteractionSystem_ProcessCmd_Patch.cs
Handles not clearing the command queue if the reload key is held.
Targets the ReloadWeapon command section.

## PlayerInteractionSystem_ProcessInput_Patch.cs
Handles if the user holds the reload key down while skipping a turn.
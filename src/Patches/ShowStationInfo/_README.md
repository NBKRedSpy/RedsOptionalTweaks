# Show Station Info

## Purpose
Allows players to view the underlying station information (such as trade goods and production) even when a mission is active on that node.

## Implementation
- **TooltipFactory_BuildStationTooltip_Patch**: 
  - Hooks into `TooltipFactory.BuildStationTooltip`.
  - If the `LeftAlt` key is held, it temporarily modifies the arguments to trick the game into thinking there is no mission and the station is peaceful, triggering the standard station trade tooltip.
  - If a mission exists and Alt is not held, it renders the mission tooltip but adds an indicator that more information is available.

## Interactions
- Overrides the default tooltip behavior for mission nodes.

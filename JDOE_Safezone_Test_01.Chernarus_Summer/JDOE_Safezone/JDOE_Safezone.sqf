/*
	Author: JohnDoe
	Main script for the JDOE_Safezone script bundle.
	These scripts have 3 features:
		1. Show message when fired INSIDE a safezone
		2. Show a hint when fired OUTSIDE a safezone INTO a safezone
		3. Do not show a message when INSIDE a unsafezone that is INSIDE a safezone
*/

if(!isServer) exitWith
{
	//
};

private ["_debugPrefix", "_zones"];
_debugPrefix = "[JD Safezone]:";

// Import functions
JDOE_fnc_findSafezones = compile preprocessFile "JDOE_Safezone\Functions\JDOE_fnc_findSafezones.sqf";
JDOE_fnc_debugLog = compile preprocessFile "JDOE_Safezone\Functions\JDOE_fnc_debugLog.sqf";

["Initializing..."] call JDOE_fnc_debugLog; // DEBUG

// Initialize markers
_zones = call JDOE_fnc_findSafezones;
safezones = _zones select 0;
unsafezones = _zones select 1;
publicVariable "safezones";
publicVariable "unsafezones";

// Check if markers have been found
if(count safezones == 0) then
{
	["Found no safezone markers"] call JDOE_fnc_debugLog; // DEBUG
};
if(count unsafezones == 0) then
{
	["Found no unsafezone markers"] call JDOE_fnc_debugLog; // DEBUG
};

["Initialized!"] call JDOE_fnc_debugLog; // DEBUG
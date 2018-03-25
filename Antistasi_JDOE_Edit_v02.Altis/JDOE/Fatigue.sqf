/*
	Author: JohnDoe
	This script wil enable/disable the fatique effect on the player
	It also adds an eventHandler to re enable/disable fatique after respawning
*/

JDOE_EHrespawnID = -1;
_enableFatigue = _this select 0;

// Remove old eventhandler if present
if (JDOE_EHrespawnID != -1) then
{
	player removeEventHandler ["respawn", JDOE_EHrespawnID];
	JDOE_EHrespawnID = -1;
};

player enableFatigue _enableFatigue;
JDOE_EHrespawnID = player addEventHandler["respawn", {player enableFatigue _enableFatigue;}];
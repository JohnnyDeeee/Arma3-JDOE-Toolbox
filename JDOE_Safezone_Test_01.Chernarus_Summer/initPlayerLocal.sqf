// Import eventhandler function
JDOE_fnc_firedHandler = compile preprocessFile "JDOE_Safezone\Functions\JDOE_fnc_firedHandler.sqf";

// Add the EH
player addEventHandler["FiredMan", {[_this select 0, _this select 6] call JDOE_fnc_firedHandler}]; // Add custom event
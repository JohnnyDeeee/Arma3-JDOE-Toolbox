// Author: JohnDoe

/* CONSTANTS (sort of) */
JDOE_Airstrike_onMapSingleClick = "jdoe_airstrike_onMapSingleClick";

/* FUNCTIONS */
JDOE_GetMapClickLocation = {
	openMap true;
	[JDOE_Airstrike_onMapSingleClick, "onMapSingleClick", {
		[_pos, JDOE_Airstrike_setting_planeAllowDamage, JDOE_Airstrike_setting_bombName, JDOE_Airstrike_setting_planeName, JDOE_Airstrike_setting_timeout] spawn JDOE_Airstrike;
		openMap false;
	}, []] call BIS_fnc_addStackedEventHandler;
};

JDOE_CreateRadioOption = {
	params ["_unit"];
	private ["_trigger"];

	_trigger = createTrigger["EmptyDetector", getPos _unit];
	_trigger setTriggerActivation["ALPHA", "PRESENT", true];
	_trigger setTriggerText "Call airstrike";
	_trigger setTriggerStatements["this", "[] call JDOE_GetMapClickLocation;", ""];
};

// TODO: Gotta test this
JDOE_remoteCommandChat = {
	params ["_caller", "_message"];
	[_caller, _message] remoteExec ["sideChat", 0, true];
};

JDOE_Airstrike = {
	params ["_dropPos", "_allowDamage", "_bombName", "_vehicleName", "_timeout"];

	// Remove onMapSingleClick handler
	[JDOE_Airstrike_onMapSingleClick, "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

	_airbaseIdentity = [west, "AirBase"];

	if (!isNil "_dropPos") then { // Positions are arrays [x,y,z]
		if (serverTime >= JDOE_LastAirstrikeTime + _timeout) then {
			JDOE_LastAirstrikeTime = serverTime;
			[_dropPos, _allowDamage, _bombName, _vehicleName, _airbaseIdentity] spawn {
				// Variable initialization
				_dropPos = _this select 0;
				_allowDamage = _this select 1;
				_bombName = _this select 2;
				_vehicleName = _this select 3;
				_airbaseIdentity = _this select 4;
				_dropGrid = mapGridPosition _dropPos;
				_planePrecision = getNumber (configFile >> "CfgVehicles" >> _vehicleName >> "precision"); // Used for calculating how big the trigger should be, because planes are not "precise"

				// Chat
				[caller, format ["Requesting airstrike at grid: %1", _dropGrid]] spawn JDOE_remoteCommandChat;
				sleep 10;
				[_airbaseIdentity, "Coordinates received, airstrike inbound!"] spawn JDOE_remoteCommandChat;

				// Create plane
				_group = createGroup west;
				_group setCombatMode "BLUE"; // Never fire
				_group setBehaviour "CARELESS";
				_group move _dropPos;

				_simCAS = [_dropPos vectorAdd [1500, 1500, 800], 0, _vehicleName, _group] call BIS_fnc_spawnVehicle;
				_testCAS = _simCAS select 0;
				_testCAS setVehicleAmmo 0;
				_testCAS allowDamage _allowDamage;
				_testCAS setDir ((getPos _testCAS) getDir _dropPos); // Face the drop position

				(_simCAS select 2) move _dropPos;

				{ _x setCaptive true } forEach crew _testCAS; // Make crew neutral (they dont show up as civilians ...?)

				// Create trigger on drop position
				JDOE_BombTriggerActivation = {
					params ["_bombName", "_dropPos", "_airbaseIdentity", "_entityList"];
					_testCAS = _entityList select 0;

					sleep 1; // Let plane get to center of trigger (not accurate, if plane precision is really larger this would not do any good, for that i would need to get the velocity and measure distance to center of trigger and calculate a sleep number from that ...)

					// Create bomb
					_bomb = _bombName createVehicle _dropPos;
					_bomb setPosATL [_dropPos select 0, _dropPos select 1, (_dropPos select 2) + ((getPosATL _testCAS) select 2) ];
					_bomb setVelocity [0,0,-200];
					_bomb setVectorDirAndUp [[0,0,-1],[0,1,0]];

					// Chat
					[_airbaseIdentity, "Splash out."] spawn JDOE_remoteCommandChat;

					// Fly back up high so nobody will see the despawn
					(vehicle _testCAS) flyInHeight 5000;

					// Delete plane
					sleep 15;
					{ _testCAS deleteVehicleCrew _x } forEach crew _testCAS; // Delete crew
					deleteVehicle _testCAS; // Delete plane
				};
				_bombTrigger = createTrigger["EmptyDetector", _dropPos];
				// TODO: Make smaller (width), so the bomb doesn't drop until the plane is right above the drop position (or check that sleep 1 comment)
				_bombTrigger setTriggerArea [_planePrecision, _planePrecision, 0, false, 0]; // 0 height = infinitely tall
				_bombTrigger triggerAttachVehicle [_testCAS];
				_bombTrigger setTriggerActivation ["VEHICLE", "PRESENT", false];
				call compile format ["_bombTrigger setTriggerStatements ['this', '[%1, %2, %3, thisList] spawn JDOE_BombTriggerActivation', '']", str _bombName, _dropPos, _airbaseIdentity];
			};
		} else {
			_airbaseIdentity sideChat format ["You need to wait %1 seconds before you can call in another airstrike.", ceil ((JDOE_LastAirstrikeTime + _timeout) - serverTime)];
		};
	} else {
		_airbaseIdentity sideChat "Invalid coordinates!";
	};
};

/* INIT */
JDOE_Airstrike_Init = {
	params ["_JDOE_Airstrike_setting_caller", "_JDOE_Airstrike_setting_planeAllowDamage", "_JDOE_Airstrike_setting_bombName", "_JDOE_Airstrike_setting_planeName", "_JDOE_Airstrike_setting_timeout"];

	JDOE_Airstrike_setting_caller = _JDOE_Airstrike_setting_caller;
	JDOE_Airstrike_setting_planeAllowDamage = _JDOE_Airstrike_setting_planeAllowDamage;
	JDOE_Airstrike_setting_bombName = _JDOE_Airstrike_setting_bombName;
	JDOE_Airstrike_setting_planeName = _JDOE_Airstrike_setting_planeName;
	JDOE_Airstrike_setting_timeout = _JDOE_Airstrike_setting_timeout;

	// Default values
	if (isNil "_JDOE_Airstrike_setting_caller") exitWith { diag_log "JDOE_Airstrike: Caller is not provided!" };
	if (isNil "_JDOE_Airstrike_setting_planeAllowDamage") then { JDOE_Airstrike_setting_planeAllowDamage = false }; // God mode for plane
	if (isNil "_JDOE_Airstrike_setting_bombName") then { JDOE_Airstrike_setting_bombName = "Bo_GBU12_LGB" }; // Bomb model
	if (isNil "_JDOE_Airstrike_setting_planeName") then { JDOE_Airstrike_setting_planeName = "O_Plane_CAS_02_F" }; // Plane model
	if (isNil "_JDOE_Airstrike_setting_timeout") then { JDOE_Airstrike_setting_timeout = 100 }; // Timeout between airstrike calls

	JDOE_LastAirstrikeTime = 0;
	[caller] spawn JDOE_CreateRadioOption; // Give "caller" (name of the unit), the radio option to call in airstrikes
};
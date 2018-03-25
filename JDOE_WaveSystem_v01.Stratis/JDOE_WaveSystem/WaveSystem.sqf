if(!isServer)
	exitWith {};

// Make sure to spawn this because we are using sleeps
_handle = [_this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 5, _this select 6, _this select 7] spawn
{
	private ["_centerMarker", "_radius", "_waves", "_waveTime", "_minSpawnDistance", "_spawnableUnits", "_unitAmount", "_unitGroupSide", "_i"];
	// Get center marker
	_centerMarker = _this select 0;
	// Get radius to spawn enemies in
	_radius = _this select 1; // Meters
	// Get amount of waves
	_waves = _this select 2;
	// Get time between spawn waves
	_waveTime =  _this select 3; // Seconds
	// Get min distance from radius center to enemy spawn
	_minSpawnDistance = _this select 4; // Meters
	// Get list of units available for spawn (or make list to exclude units.. that would be a smaller list)
	_spawnableUnits = _this select 5;
	// Get amount of units per spawn
	_unitAmount = _this select 6;
	// Get unit group side
	_unitGroupSide = _this select 7;

	sleep 0.5; // Needed otherwise first message is not visible

	for [{_i=1}, {_i <= _waves}, {_i = _i+1}] do
	{
		// Spawn units
		[_radius, _centerMarker, _minSpawnDistance, _spawnableUnits, _unitAmount, _unitGroupSide] call JDOE_fn_SpawnUnitsInRadius;

		// Feedback message
		_message = "Wave " + (str _i) + " started!";
		_message remoteExec ["systemChat", 0];

		// Wait before going to next wave
		if(_i != _waves) then
		{ sleep _waveTime; };
	};

 	"Waves are finsihed!" remoteExec ["systemChat", 0]; // End message
};

// TODO: Make groups that spawn together
// TODO: Make spawn options (maybe have options for paradrop, insertion or driving)
JDOE_fn_SpawnUnitsInRadius =
{
	params ["_radius", "_centerMarker", "_minSpawnDistance", "_spawnableUnits", "_unitAmount", "_unitGroupSide", "_unit", "_position", "_waypoint"];
	private ["_i"];
	_radius = _this select 0;
	_centerMarker = _this select 1;
	_minSpawnDistance = _this select 2;
	_spawnableUnits = _this select 3;
	_unitAmount = _this select 4;
	_unitGroup = createGroup [_unitGroupSide, true];

	// Loop foreach unit amount and spawn unit
	for [{_i=0}, {_i <= _unitAmount}, {_i=_i+1}] do
	{
		_position = [_centerMarker, _minSpawnDistance, _radius, 0, 0] call BIS_fnc_findSafePos;
		_unitClassIndex = floor random [0,((count _spawnableUnits)/2),(count _spawnableUnits)]; // Generate random index
		_unit = _unitGroup createUnit [_spawnableUnits select _unitClassIndex, _position, [], 0, "NONE"]; // Spawn the actual unit

		// DEBUG
		{
			_x addCuratorEditableObjects [[_unit], true];
		} forEach allCurators;
		// END DEBUG
	};

	// Add waypoint to the group
	_waypoint = _unitGroup addWaypoint [_centerMarker, 0];
	_waypoint setWaypointType "DESTROY";
};
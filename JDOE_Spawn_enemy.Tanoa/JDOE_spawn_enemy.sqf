_obj = _this select 0;
_id = _this select 2;
_obj removeAction _id;
_marker = _this select 3 select 0;
_amount_of_units = _this select 3 select 1;
_radius = _this select 3 select 2;
_marker_text = markerText _marker;
_group = createGroup east;

/*systemChat format["Spawning %1 unit(s) at marker: %2", _amount_of_units, _marker_text];*/
for "_i" from 0 to _amount_of_units do {
	// Find a good position
	_center = getMarkerPos _marker;
	_minDistance = 0;
	_maxDistance = _radius; // meters????
	_safePos = [_center, _minDistance, _maxDistance] call BIS_fnc_findSafePos;

	// Spawn unit
	"RyanZombieB_Soldier_02_f" createUnit[_safePos, _group];
};

/*systemChat "Done!";*/
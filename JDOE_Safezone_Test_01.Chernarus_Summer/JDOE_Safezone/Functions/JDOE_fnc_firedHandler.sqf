/*
	Function: JDOE_fnc_firedHandler
	Author: JohnDoe
	Params: Object that activated the handler
			Projectile that is used by the handler
	Return: Nothing
*/
private ["_player", "_projectile", "_safezonesPlayerIsIn", "_unsafezonesPlayerIsIn"];

_player = _this select 0;
_projectile = _this select 1;
_safezonesPlayerIsIn = [];
_unsafezonesPlayerIsIn = [];

// Get safezone(s) player is in
{
	if((position _player) inArea _x) then
	{
		_safezonesPlayerIsIn pushBack _x;
	};
} forEach safezones;

// Get unsafezone(s) player is in
{
	if((position _player) inArea _x) then
	{
		_unsafezonesPlayerIsIn pushBack _x;
	};
} forEach unsafezones;

// Catch players shooting if they are inside
// a safezone that doesnt have an unsafezone
if(count _safezonesPlayerIsIn > 0 &&
   count _unsafezonesPlayerIsIn == 0) then
{
	deleteVehicle _projectile;
	["Please do not shoot or throw grenades inside the safezone!", "Warning", true, false] spawn BIS_fnc_GUImessage;
};

// Track projectile if player is not in safezone
if(count _safezonesPlayerIsIn == 0 || count _unsafezonesPlayerIsIn > 0) then
{
	// Track projectile
	[_projectile] spawn {
		_projectile = _this select 0;
		_lastPos = 0;

		// Track position
		while {alive _projectile} do
		{
			_lastPos = position _projectile;
			sleep 0.01;
		};

		// Check if projectile position is in safezone
		// TODO: Does not delete projectile!!!
		{
			_safezone = _x;
			{
				_unsafezone = _x;
				if(_lastPos inArea _safezone && !(_lastPos inArea _unsafezone)) exitWith
				{
					hint "Please do not shoot or throw grenades towards the safezone!";
					sleep 3.00;
					hint ""; // Clear the hint message
				};
			} forEach unsafezones;
		} forEach safezones;
	};
};
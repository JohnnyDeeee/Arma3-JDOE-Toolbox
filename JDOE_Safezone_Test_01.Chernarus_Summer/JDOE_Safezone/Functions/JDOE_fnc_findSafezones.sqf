/*
	Function: JDOE_fnc_findSafezones
	Author: JohnDoe
	Params: N/A
	Return: Array of markers that have the prefix inside their name
*/
private ["_safezones", "_safezonePrefix", "_unsafezones", "_unsafezonePrefix"];

_safezones = [];
_safezonePrefix = "jdoe_safezone";
_unsafezones = [];
_unsafezonePrefix = "jdoe_unsafezone";

{
	// Check for markers where the name/text contains 'jd_safezone'
	if((toLower _x) find _safezonePrefix != -1) then
	{
		// Check if marker name isnt already on the list
		if(_safezones find _x == -1) then
		{
			_strLog = format["Found safezone: %1", _x];
			[_strLog] call JDOE_fnc_debugLog; // DEBUG
			_safezones pushBack _x; // Add marker to array
		};
	};
	if((toLower _x) find _unsafezonePrefix != -1) then
	{
		// Check if marker name isnt already on the list
		if(_unsafezones find _x == -1) then
		{
			_strLog = format["Found unsafezone: %1", _x];
			[_strLog] call JDOE_fnc_debugLog; // DEBUG
			_unsafezones pushBack _x; // Add marker to array
		};
	};
} forEach allMapMarkers;

[_safezones, _unsafezones]; // Return the array
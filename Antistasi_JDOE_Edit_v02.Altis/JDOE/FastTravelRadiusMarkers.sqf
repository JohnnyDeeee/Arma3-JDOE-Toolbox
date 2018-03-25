/*
	Author: JohnDoe
	This script will draw the radius of the fasttravel zones
	on the map
*/

_method = _this select 0;
if(isNil "JDOE_FastTravelMarkers") then
{
	JDOE_FastTravelMarkers = [];
};

// Create the radius markers
if(_method == "create" && count JDOE_FastTravelMarkers == 0) then
{
	_markers = marcadores + ["respawn_west"] - campsFIA;

	{
		// Exclude roadblocks
		if(!((_x in controles) and (_x in mrkAAF))) then
		{
			_marker = createMarkerLocal[_x + "_fasttravel_radius", getMarkerPos _x];
			_marker setMarkerShapeLocal "ELLIPSE";
			_marker setMarkerSizeLocal [PARAMS_JDOE_FastTravelRadius, PARAMS_JDOE_FastTravelRadius];
			_marker setMarkerAlphaLocal 0.3;
			_marker setMarkerColorLocal "ColorBlue";
			JDOE_FastTravelMarkers pushBack _marker;
		};
	} forEach _markers;
};

// Delete the radius markers
if(_method == "delete" && count JDOE_FastTravelMarkers > 0) then
{
	{
		deleteMarkerLocal _x;
	} forEach JDOE_FastTravelMarkers;
	JDOE_FastTravelMarkers = []; // Reset the array
};
/*
	Function: JDOE_fnc_debugLog
	Author: JohnDoe
	Params: String to log
	Return: Nothing
*/

private ["_debugPrefix", "_logString"];

_debugPrefix = "[JDOE_Safezone]: ";
_logString = _this select 0;

systemChat format["%1 %2", _debugPrefix, _logString];
if (savingClient) exitWith {hint "Your personal stats are being saved"};
if (!isDedicated) then
	{
	savingClient = true;
	["gogglesPlayer", goggles player] call fn_SaveStat;
	["vestPlayer", vest player] call fn_SaveStat;
	["outfit", uniform player] call fn_SaveStat;
	["hat", headGear player] call fn_SaveStat;
	if (isMultiplayer) then
		{
		["AS_session_client", server getVariable "AS_session_server"] call fn_SaveStat;
		["scorePlayer", player getVariable "score"] call fn_SaveStat;
		["rankPlayer",rank player] call fn_SaveStat;
		_resfondo = player getVariable "dinero";
		{
		_amigo = _x;
		if ((!isPlayer _amigo) and (alive _amigo)) then
			{
			_resfondo = _resfondo + (server getVariable (typeOf _amigo));
			if (vehicle _amigo != _amigo) then
				{
				_veh = vehicle _amigo;
				_tipoVeh = typeOf _veh;
				if (not(_veh in staticsToSave)) then
					{
					if ((_veh isKindOf "StaticWeapon") or (driver _veh == _amigo)) then
						{
						_resfondo = _resfondo + ([_tipoVeh] call vehiclePrice);
						if (count attachedObjects _veh != 0) then {{_resfondo = _resfondo + ([typeOf _x] call vehiclePrice)} forEach attachedObjects _veh};
						};
					};
				};
			};
		} forEach units group player;
		["dinero",_resfondo] call fn_SaveStat;
		_personalGarage = personalGarage;
		["personalGarage",_personalGarage] call fn_SaveStat;
		};
	savingClient = false;
	};

 if (!isServer) exitWith {};
 if (savingServer) exitWith {"Server data save is still in process" remoteExecCall ["hint",stavros]};
 savingServer = true;
 	["AS_session_server", server getVariable ["AS_session_server", round (random 100000)]] call fn_SaveStat;
	diag_log format ["Maintenance -- Server's sessionID saved: %1", profileNameSpace getVariable ("AS_session_server" + serverID)];
	["cuentaCA", cuentaCA] call fn_SaveStat;
	["smallCAmrk", smallCAmrk] call fn_SaveStat;
	["miembros", miembros] call fn_SaveStat;
	["antenas", antenasmuertas] call fn_SaveStat;
	["mrkAAF", mrkAAF - controles] call fn_SaveStat;
	["mrkFIA", mrkFIA - puestosFIA - controles] call fn_SaveStat;
	["posHQ", getMarkerPos "respawn_west"] call fn_Savestat;
	["prestigeNATO", server getVariable "prestigeNATO"] call fn_SaveStat;
	["prestigeCSAT", server getVariable "prestigeCSAT"] call fn_SaveStat;
	["APCAAFcurrent", APCAAFcurrent] call fn_SaveStat;
	["tanksAAFcurrent",tanksAAFcurrent] call fn_SaveStat;
	["planesAAFcurrent", planesAAFcurrent] call fn_SaveStat;
	["helisAAFcurrent", helisAAFcurrent] call fn_SaveStat;
	["fecha", date] call fn_SaveStat;
	["resourcesAAF", server getVariable "resourcesAAF"] call fn_SaveStat;
	["skillFIA", server getVariable "skillFIA"] call fn_SaveStat;
	["skillAAF", skillAAF] call fn_SaveStat;
	["destroyedCities", destroyedCities] call fn_SaveStat;
	["destroyedBuildings", destroyedBuildings] call fn_SaveStat;
	["distanciaSPWN", distanciaSPWN] call fn_SaveStat;
	["civPerc", civPerc] call fn_SaveStat;
	["minimoFPS", minimoFPS] call fn_SaveStat;
	["unlockedWeapons", unlockedWeapons] call fn_SaveStat;
	["unlockedItems", unlockedItems] call fn_SaveStat;
	["unlockedMagazines", unlockedMagazines] call fn_SaveStat;
	["unlockedBackpacks", unlockedBackpacks] call fn_SaveStat;

	["BE_data", ([] call fnc_BE_save)] call fn_SaveStat;

private ["_hrfondo","_resfondo","_veh","_tipoVeh","_armas","_municion","_items","_mochis","_contenedores","_arrayEst","_posVeh","_dierVeh","_prestigeOPFOR","_prestigeBLUFOR","_ciudad","_datos","_marcadores","_garrison","_arrayMrkMF","_arrayPuestosFIA","_pospuesto","_tipoMina","_posMina","_detectada","_tipos","_exists","_amigo","_arrayCampsFIA","_enableFTold","_enableMemAcc","_campList"];

_hrfondo = (server getVariable "hr") + ({(alive _x) and (not isPlayer _x) and (_x getVariable ["BLUFORSpawn",false])} count allUnits);
_resfondo = server getVariable "resourcesFIA";

_armas = weaponCargo caja;
_municion = magazineCargo caja;
_items = itemCargo caja;
_mochis = [];
_vehInGarage = vehInGarage;
{
_amigo = _x;
if (_amigo getVariable ["BLUFORSpawn",false]) then
	{
	if ((alive _amigo) and (!isPlayer _amigo)) then
		{
		if ((isPlayer leader _amigo) or (group _amigo in (hcAllGroups stavros)) and (not((group _amigo) getVariable ["esNATO",false]))) then
			{
			if (isPlayer (leader group _amigo)) then
				{
				if (!isMultiplayer) then
					{
					_precio = server getVariable (typeOf _amigo);
					if (!(isNil "_precio")) then {_resfondo = _resfondo + _precio};
					};
				{if (([_x] call BIS_fnc_baseWeapon) in lockedWeapons) then {_armas pushBack ([_x] call BIS_fnc_baseWeapon)}} forEach weapons _amigo;
				{if (not(_x in unlockedMagazines)) then {_municion pushBack _x}} forEach magazines _amigo;
				_items = _items + (items _amigo) + (primaryWeaponItems _amigo) + (assignedItems _amigo) + (secondaryWeaponItems _amigo);
				};
			if (vehicle _amigo != _amigo) then
				{
				_veh = vehicle _amigo;
				_tipoVeh = typeOf _veh;
				if (not(_veh in staticsToSave)) then
					{
					if ((_veh isKindOf "StaticWeapon") or (driver _veh == _amigo)) then
						{
						if ((group _amigo in (hcAllGroups stavros)) or (!isMultiplayer)) then
							{
							_resfondo = _resfondo + ([_tipoVeh] call vehiclePrice);
							if (count attachedObjects _veh != 0) then {{_resfondo = _resfondo + ([typeOf _x] call vehiclePrice)} forEach attachedObjects _veh};
							};
						};
					};
				};
			};
		};
	};
} forEach allUnits;


["resourcesFIA", _resfondo] call fn_SaveStat;
["hr", _hrfondo] call fn_SaveStat;
["vehInGarage", _vehInGarage] call fn_SaveStat;

if (count backpackCargo caja > 0) then
	{
	{
	_mochis pushBack (_x call BIS_fnc_basicBackpack);
	} forEach backPackCargo caja;
	};
_contenedores = everyBackpack caja;
if (count _contenedores > 0) then
	{
	for "_i" from 0 to (count _contenedores - 1) do
		{
		_armas = _armas + weaponCargo (_contenedores select _i);
		_municion = _municion + magazineCargo (_contenedores select _i);
		_items = _items + itemCargo (_contenedores select _i);
		};
	};

if (isMultiplayer) then
	{
	{
	{if ([_x] call BIS_fnc_baseWeapon in lockedWeapons) then {_armas pushBack ([_x] call BIS_fnc_baseWeapon)}} forEach weapons _x;
	_municion = _municion + magazines _x + [currentMagazine _x];
	_items = _items + ((items _x) + (primaryWeaponItems _x)+ (assignedItems _x));
	_mochi = (backpack _x) call BIS_fnc_basicBackpack;
	if ((not(_mochi in unlockedBackpacks)) and (_mochi != "")) then
		{
		_mochis pushBack _mochi;
		};
	} forEach playableUnits;
	}
else
	{
	{if ([_x] call BIS_fnc_baseWeapon in lockedWeapons) then {_armas pushBack ([_x] call BIS_fnc_baseWeapon)}} forEach weapons player;
	_municion = _municion + magazines player + [currentMagazine player];
	_items = _items + ((items player) + (primaryWeaponItems player)+ (assignedItems player));
	_mochi = (backpack player) call BIS_fnc_basicBackpack;
	if ((not(_mochi in unlockedBackpacks)) and (_mochi != "")) then
		{
		_mochis pushBack _mochi;
		};
	//_mochis pushBack ((backpack player) call BIS_fnc_basicBackpack);
	};

_statMrks = [];
{if ((_x in puestos) || (_x in power) || (_x in recursos) || (_x in fabricas) || (_x in puertos) ||  (_x == "FIA_HQ")) then {_statMrks pushBack _x;};} forEach mrkFIA;

_arrayEst = [];
{
_veh = _x;
_tipoVeh = typeOf _veh;

_test = [_statMrks,getPos _veh] call BIS_fnc_nearestPosition;
_testPos = getMarkerPos _test;
_testDist = _veh distance _testPos;

if ((_veh isKindOf "StaticWeapon") and (_testDist < 50)) then {
	_posVeh = getPos _veh;
	_dirVeh = getDir _veh;
	_arrayEst = _arrayEst + [[_tipoVeh,_posVeh,_dirVeh]];
};

if (_veh distance getMarkerPos "respawn_west" < 50) then
	{
	if ((not (_veh isKindOf "StaticWeapon")) && !(_veh isKindOf "ThingX") and (not (_veh isKindOf "ReammoBox")) and (not (_veh isKindOf "FlagCarrier")) and (not(_veh isKindOf "Building")) and (not (_tipoVeh in planesNATO)) and (not (_tipoVeh in vehNATO)) and (not (_tipoVeh == "C_Van_01_box_F")) and (count attachedObjects _veh == 0) and (alive _veh) and ({(alive _x) and (!isPlayer _x)} count crew _veh == 0) and (not(_tipoVeh == "WeaponHolderSimulated"))) then
		{
		_posVeh = getPos _veh;
		_dirVeh = getDir _veh;
		_arrayEst = _arrayEst + [[_tipoVeh,_posVeh,_dirVeh]];
		_armas = _armas + weaponCargo _veh;
		_municion = _municion + magazineCargo _veh;
		_items = _items + itemCargo _veh;
		if (count backpackCargo _veh > 0) then
			{
			{
			_mochis pushBack (_x call BIS_fnc_basicBackpack);
			} forEach backpackCargo _veh;
			};
		};
	};
} forEach vehicles - [caja,bandera,fuego,cajaveh,mapa];


["estaticas", _arrayEst] call fn_SaveStat;
["armas", _armas] call fn_SaveStat;
["municion", _municion] call fn_SaveStat;
["items", _items] call fn_SaveStat;
["mochis", _mochis] call fn_SaveStat;

_prestigeOPFOR = [];
_prestigeBLUFOR = [];

{
_ciudad = _x;
_datos = server getVariable _ciudad;
_prestigeOPFOR = _prestigeOPFOR + [_datos select 2];
_prestigeBLUFOR = _prestigeBLUFOR + [_datos select 3];
} forEach ciudades;

["prestigeOPFOR", _prestigeOPFOR] call fn_SaveStat;
["prestigeBLUFOR", _prestigeBLUFOR] call fn_SaveStat;

_marcadores = mrkFIA - puestosFIA - controles - ciudades;
_garrison = [];
{
_garrison = _garrison + [garrison getVariable [_x,[]]];
} forEach _marcadores;

["garrison",_garrison] call fn_SaveStat;

_arrayMinas = [];
{
_tipoMina = typeOf _x;
_posMina = getPos _x;
_dirMina = getDir _x;
_detectada = false;
if (_x mineDetectedBy side_blue) then {_detectada = true};
_arrayMinas = _arrayMinas + [[_tipoMina,_posMina,_detectada,_dirMina]];
} forEach allMines;

["minas", _arrayMinas] call fn_SaveStat;

_arraypuestosFIA = [];

{
_pospuesto = getMarkerPos _x;
_arraypuestosFIA = _arraypuestosFIA + [_pospuesto];
} forEach puestosFIA;

["puestosFIA", _arraypuestosFIA] call fn_SaveStat;

if (count campList != 0) then {
	_campList = [];
	{
		_posCamp = getMarkerPos (_x select 0);
		_campName = _x select 1;
		_campList = _campList + [[_posCamp, _campName]];
	} forEach campList;
}
else {
	_campList = [];
	{
		_posCamp = getMarkerPos _x;
		_campName = markerText _x;
		_campList = _campList + [[_posCamp, _campName]];
	} forEach campsFIA;
};

["campList", _campList] call fn_SaveStat;

_arrayCampsFIA = [];
{
_pospuesto = getMarkerPos _x;
_arrayCampsFIA = _arrayCampsFIA + [_pospuesto];
} forEach campsFIA;

["campsFIA", _arrayCampsFIA] call fn_SaveStat;

_enableFTold = server getVariable "enableFTold";
["enableFTold", _enableFTold] call fn_SaveStat;

_enableMemAcc = server getVariable "enableMemAcc";
["enableMemAcc", _enableMemAcc] call fn_SaveStat;

if (!isDedicated) then
	{
	_tipos = [];
	{
	if (_x in misiones) then
		{
		_state = [_x] call BIS_fnc_taskState;
		if (_state == "CREATED") then
			{
			_tipos = _tipos + [_x];
			};
		};
	} forEach ["AS","CON","DES","LOG","RES","CONVOY","DEF_HQ","AtaqueAAF"];

	["tasks",_tipos] call fn_SaveStat;
	};

_datos = [];
{
_datos pushBack [_x,server getVariable _x];
} forEach (aeropuertos + bases);

["idleBases",_datos] call fn_SaveStat;

[] call fn_SaveProfile;

savingServer = false;

_text = "Savegame Done.\n\nYou won't lose your stats in the event of a game update.\n\nRemember: if you want to preserve any vehicle, it must be near the HQ Flag with no AI inside.\nIf AI inside, you will save the funds you spent on it.\n\nAI will be refunded\n\nStolen and purchased Static Weapons need to be ASSEMBLED in order to get saved. Disassembled weapons may get saved in your ammobox\n\nMounted Statics (Mortar/AA/AT squads) won't get saved, but you will be able to recover the cost.\n\nSame for assigned vehicles more than 50 mts far from HQ";
[petros,"save",_text] remoteExec ["commsMP",stavros];
diag_log "Maintenance: game successfully saved.";
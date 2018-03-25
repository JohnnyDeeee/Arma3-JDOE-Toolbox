/*_centerMarker = getMarkerPos "respawn_west"; // This is where the units will spawn around
_radius = 500; // This is the maximum distance of where units can spawn
_waves = 3; // Amount of waves that will be spawned
_waveTime =  5; // How long between each wave spawn
_minSpawnDistance = 400; // Minimum distance where units can spawn
_spawnableUnits = ["I_G_Soldier_F", "I_G_Soldier_AR_F", "I_G_engineer_F"]; // Units class names that will be used when spawning units
_unitAmount = 10; // Amount of units spawned per wave
_unitGroupSide = resistance;  // Side of the units defined in _spawnableUnits (They all MUST be of the side you define here, otherwise they will shoot eachother..) sides are: west, east, civilian, resistance

[_centerMarker, _radius, _waves, _waveTime, _minSpawnDistance, _spawnableUnits, _unitAmount, _unitGroupSide] execVM "JDOE_WaveSystem\WaveSystem.sqf";*/
// XLA fixed arsenal
if !(isnil "XLA_fnc_addVirtualItemCargo") then {
	["AmmoboxInit",[caja,false,{true},"Arsenal",true]] call XLA_fnc_arsenal;
} else {
	["AmmoboxInit",[caja,false,{true}]] call BIS_fnc_arsenal;
};

call compile preprocessFileLineNumbers "Compositions\FIA_RB.sqf";
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";
call compile preprocessFileLineNumbers "Lists\basicLists.sqf";
call compile preprocessFileLineNumbers "Lists\gearList.sqf";

minefieldAAF = compile preProcessFileLineNumbers "CREATE\minefieldAAF.sqf";
tempMoveMrk = compile preProcessFileLineNumbers "tempMoveMrk.sqf";
hasRadio = compile preProcessFileLineNumbers "AI\hasRadio.sqf";
accionArsenal = compile preProcessFileLineNumbers "Municion\accionArsenal.sqf";
powerCheck = compile preProcessFileLineNumbers "powerCheck.sqf";
AAFKilledEH = compile preProcessFileLineNumbers "AI\AAFKilledEH.sqf";
handleDamageAAF = compile preProcessFileLineNumbers "Revive\handleDamageAAF.sqf";
CSATVEHinit = compile preProcessFileLineNumbers "CREATE\CSATVEHinit.sqf";
NATOVEHinit = compile preProcessFileLineNumbers "CREATE\NATOVEHinit.sqf";
civVEHinit = compile preProcessFileLineNumbers "CREATE\civVEHinit.sqf";
smokeCoverAuto = compile preProcessFileLineNumbers "AI\smokeCoverAuto.sqf";
landThreatEval = compile preProcessFileLineNumbers "AI\landThreatEval.sqf";
mortarPos = compile preProcessFileLineNumbers "CREATE\mortarPos.sqf";
REP_Antena = compile preProcessFileLineNumbers "Missions\REP_Antena.sqf";
placementSelection = compile preProcessFileLineNumbers "placementselection.sqf";
isMember = compile preProcessFileLineNumbers "orgPlayers\isMember.sqf";
vaciar = compile preProcessFileLineNumbers "Municion\vaciar.sqf";
AS_specOP = compile preProcessFileLineNumbers "Missions\AS_specOP.sqf";
artySupport = compile preProcessFileLineNumbers "AI\artySupport.sqf";
teclas = compile preProcessFileLineNumbers "teclas.sqf";
distanceUnits = compile preProcessFileLineNumbers "distanceUnits.sqf";
munitionTransfer = compile preProcessFileLineNumbers "Municion\munitionTransfer.sqf";
fn_location = compile preProcessFileLineNumbers "fn_location.sqf";
borrarTask = compile preProcessFileLineNumbers "Missions\borrarTask.sqf";
undercover = compile preProcessFileLineNumbers "undercover.sqf";
puertasLand = compile preProcessFileLineNumbers "AI\puertasLand.sqf";
AAthreatEval = compile preProcessFileLineNumbers "AI\AAthreatEval.sqf";
mortyAI = compile preProcessFileLineNumbers "AI\mortyAI.sqf";
surrenderAction = compile preProcessFileLineNumbers "AI\surrenderAction.sqf";
guardDog = compile preProcessFileLineNumbers "AI\guardDog.sqf";
VEHdespawner = compile preProcessFileLineNumbers "CREATE\VEHdespawner.sqf";
randomRifle = compile preProcessFileLineNumbers "Municion\randomRifle.sqf";
findSafeRoadToUnload = compile preProcessFileLineNumbers "AI\findSafeRoadToUnload.sqf";
garageVehicle = compile preProcessFileLineNumbers "garageVehicle.sqf";
garage = compile preProcessFileLineNumbers "garage.sqf";
ranksMP = compile preProcessFileLineNumbers "OrgPlayers\ranksMP.sqf";
arsenalManage = compile preProcessFileLineNumbers "Municion\arsenalManage.sqf";
undercoverAI = compile preProcessFileLineNumbers "AI\undercoverAI.sqf";
memberAdd = compile preProcessFileLineNumbers "OrgPlayers\memberAdd.sqf";
donateMoney = compile preProcessFileLineNumbers "OrgPlayers\donateMoney.sqf";
stavrosSteal = compile preProcessFileLineNumbers "OrgPlayers\stavrosSteal.sqf";
resourcesPlayer = compile preProcessFileLineNumbers "OrgPlayers\resourcesPlayer.sqf";
numericRank = compile preProcessFileLineNumbers "numericRank.sqf";
inconsciente = compile preProcessFileLineNumbers "Revive\inconsciente.sqf";
respawn = compile preProcessFileLineNumbers "Revive\respawn.sqf";
handleDamage = compile preProcessFileLineNumbers "Revive\handleDamage.sqf";
initRevive = compile preProcessFileLineNumbers "Revive\initRevive.sqf";
pedirAyuda = compile preProcessFileLineNumbers "AI\pedirAyuda.sqf";
ayudar = compile preProcessFileLineNumbers "AI\ayudar.sqf";
cubrirConHumo = compile preProcessFileLineNumbers "AI\cubrirConHumo.sqf";
returnMuzzle = compile preProcessFileLineNumbers "returnMuzzle.sqf";
autoRearm = compile preProcessFileLineNumbers "AI\autoRearm.sqf";
destroyCheck = compile preProcessFileLineNumbers "destroyCheck.sqf";
garrisonInfo = compile preProcessFileLineNumbers "garrisonInfo.sqf";
groupComposition = compile preProcessFileLineNumbers "REINF\groupComposition.sqf";
vehiclePrice = compile preProcessFileLineNumbers "REINF\vehiclePrice.sqf";
resourcesAAF = compile preProcessFileLineNumbers "resourcesAAF.sqf";
VANTinfo = compile preProcessFileLineNumbers "AI\VANTinfo.sqf";
garrisonAdd = compile preProcessFileLineNumbers "REINF\garrisonAdd.sqf";
garrisonDialog = compile preProcessFileLineNumbers "REINF\garrisonDialog.sqf";
isFrontline = compile preProcessFileLineNumbers "isFrontline.sqf";
timingCA = compile preProcessFileLineNumbers "timingCA.sqf";
destroyCity = compile preProcessFileLineNumbers "destroyCity.sqf";
CSATpunish = compile preProcessFileLineNumbers "CREATE\CSATpunish.sqf";
FIAradio = compile preProcessFileLineNumbers "FIAradio.sqf";
deleteControles = compile preProcessFileLineNumbers "deleteControles.sqf";
cleanserVeh = compile preProcessFileLineNumbers "CREATE\cleanserVeh.sqf";
crearControles = compile preProcessFileLineNumbers "crearControles.sqf";
citiesToCivPatrol = compile preProcessFileLineNumbers "citiesToCivPatrol.sqf";
NATOCAS = compile preProcessFileLineNumbers "REINF\NATOCAS.sqf";
NATOArty = compile preProcessFileLineNumbers "REINF\NATOArty.sqf";
NATOCrate = compile preProcessFileLineNumbers "Municion\NATOCrate.sqf";
NATOAmmo = compile preProcessFileLineNumbers "Missions\NATOAmmo.sqf";
puestoDialog = compile preProcessFileLineNumbers "puestoDialog.sqf";
mineDialog = compile preProcessFileLineNumbers "Dialogs\mineDialog.sqf";
onPlayerDisconnect = compile preProcessFileLineNumbers "onPlayerDisconnect.sqf";
playerScoreAdd = compile preProcessFileLineNumbers "orgPlayers\playerScoreAdd.sqf";
assignStavros = compile preProcessFileLineNumbers "orgPlayers\assignStavros.sqf";
stavrosInit = compile preProcessFileLineNumbers "orgPlayers\stavrosInit.sqf";
castigo = compile preProcessFileLineNumbers "castigo.sqf";
createFIApuestos2 = compile preProcessFileLineNumbers "CREATE\createFIApuestos2.sqf";
crearPuestosFIA = compile preProcessFileLineNumbers "crearPuestosFIA.sqf";
fpsChange = compile preProcessFileLineNumbers "fpsChange.sqf";
FIAinit = compile preProcessFileLineNumbers "REINF\FIAinit.sqf";
postmortem = compile preProcessFileLineNumbers "REINF\postmortem.sqf";
commsMP = compile preProcessFileLineNumbers "commsMP.sqf";
radioCheck = compile preProcessFileLineNumbers "radioCheck.sqf";
autoGarrison = compile preProcessFileLineNumbers "REINF\autoGarrison.sqf";
sellVehicle = compile preProcessFileLineNumbers "sellVehicle.sqf";
resourceCheckSkipTime = compile preProcessFileLineNumbers "resourcecheckSkipTime.sqf";
CONVOY = compile preProcessFileLineNumbers "Missions\CONVOY.sqf";
RES_Prisioneros = compile preProcessFileLineNumbers "Missions\RES_Prisioneros.sqf";
RES_Refugiados = compile preProcessFileLineNumbers "Missions\RES_Refugiados.sqf";
LOG_Bank = compile preProcessFileLineNumbers "Missions\LOG_Bank.sqf";
LOG_Suministros = compile preProcessFileLineNumbers "Missions\LOG_Suministros.sqf";
LOG_Ammo = compile preProcessFileLineNumbers "Missions\LOG_Ammo.sqf";
DES_Vehicle = compile preProcessFileLineNumbers "Missions\DES_Vehicle.sqf";
DES_Heli = compile preProcessFileLineNumbers "Missions\DES_Heli.sqf";
DES_Antena = compile preProcessFileLineNumbers "Missions\DES_Antena.sqf";
CON_Puestos = compile preProcessFileLineNumbers "Missions\CON_Puestos.sqf";
ataqueHQ = compile preProcessFileLineNumbers "Missions\ataqueHQ.sqf";
localizar = compile preProcessFileLineNumbers "localizar.sqf";
AS_Oficial = compile preProcessFileLineNumbers "Missions\AS_Oficial.sqf";
ASS_Traidor = compile preProcessFileLineNumbers "Missions\ASS_Traidor.sqf";
missionrequest = compile preProcessFileLineNumbers "Missions\missionrequest.sqf";
missionrequestAUTO = compile preProcessFileLineNumbers "Missions\missionrequestAUTO.sqf";
cajaAAF = compile preProcessFileLineNumbers "Municion\cajaAAF.sqf";
createNATObases = compile preProcessFileLineNumbers "CREATE\createNATObases.sqf";
flagaction = compile preProcessFileLineNumbers "flagaction.sqf";
resourcesFIA = compile preProcessFileLineNumbers "resourcesFIA.sqf";
prestige = compile preProcessFileLineNumbers "prestige.sqf";
createCIV = compile preProcessFileLineNumbers "CREATE\createCIV.sqf";
createFIArecursos = compile preProcessFileLineNumbers "CREATE\createFIArecursos.sqf";
createFIApuestos = compile preProcessFileLineNumbers "CREATE\createFIApuestos.sqf";
createFIApower = compile preProcessFileLineNumbers "CREATE\createFIApower.sqf";
createNATOaerop = compile preProcessFileLineNumbers "CREATE\createNATOaerop.sqf";
FIAinitBases = compile preProcessFileLineNumbers "CREATE\FIAinitBASES.sqf";
reinfPlayer = compile preProcessFileLineNumbers "REINF\reinfplayer.sqf";
addFIAsquadHC = compile preProcessFileLineNumbers "REINF\addFIAsquadHC.sqf";
addFIAveh = compile preProcessFileLineNumbers "REINF\addFIAveh.sqf";
FIAskillAdd = compile preProcessFileLineNumbers "REINF\FIAskillAdd.sqf";
CSATinit = compile preProcessFileLineNumbers "CREATE\CSATinit.sqf";
NATOinit = compile preProcessFileLineNumbers "CREATE\NATOinit.sqf";
NATOinitCA = compile preProcessFileLineNumbers "CREATE\NATOinitCA.sqf";
CIVinit = compile preProcessFileLineNumbers "CREATE\CIVinit.sqf";
VEHinit = compile preProcessFileLineNumbers "CREATE\VEHinit.sqf";
patrolCA = compile preProcessFileLineNumbers "CREATE\patrolCA.sqf";
combinedCA = compile preProcessFileLineNumbers "CREATE\combinedCA.sqf";
NATOCA = compile preProcessFileLineNumbers "CREATE\NATOCA.sqf";
AAFassets = compile preProcessFileLineNumbers "AAFassets.sqf";
AAFeconomics = compile preProcessFileLineNumbers "AAFeconomics.sqf";
findBasesForCA = compile preProcessFileLineNumbers "findBasesForCA.sqf";
findBasesForConvoy = compile preProcessFileLineNumbers "findBasesForConvoy.sqf";
findAirportsForCA = compile preProcessFileLineNumbers "findAirportsForCA.sqf";
patrolDestinos = compile preProcessFileLineNumbers "patrolDestinos.sqf";
ataqueAAF = compile preProcessFileLineNumbers "ataqueAAF.sqf";
citySupportChange = compile preProcessFileLineNumbers "citySupportChange.sqf";
distancias3 = compile preProcessFileLineNumbers "distancias3.sqf";
inmuneConvoy = compile preProcessFileLineNumbers "AI\inmuneConvoy.sqf";
smokeCover = compile preProcessFileLineNumbers "AI\smokeCover.sqf";
fastropeAAF = compile preProcessFileLineNumbers "AI\fastropeAAF.sqf";
fastropeCSAT = compile preProcessFileLineNumbers "AI\fastropeCSAT.sqf";
fastropeNATO = compile preProcessFileLineNumbers "AI\fastropeNATO.sqf";
airdrop = compile preProcessFileLineNumbers "AI\airdrop.sqf";
airstrike = compile preProcessFileLineNumbers "AI\airstrike.sqf";
artilleria = compile preProcessFileLineNumbers "AI\artilleria.sqf";
artilleriaNATO = compile preProcessFileLineNumbers "AI\artilleriaNATO.sqf";
dismountFIA = compile preProcessFileLineNumbers "AI\dismountFIA.sqf";
powerReorg = compile preProcessFileLineNumbers "powerReorg.sqf";
apagon = compile preProcessFileLineNumbers "apagon.sqf";
sizeMarker = compile preProcessFileLineNumbers "sizeMarker.sqf";
mrkWIN = compile preProcessFileLineNumbers "mrkWIN.sqf";
mrkLOOSE = compile preProcessFileLineNumbers "mrkLOOSE.sqf";
mrkUpdate = compile preProcessFileLineNumbers "mrkUpdate.sqf";
moveHQ = compile preProcessFileLineNumbers "moveHQ.sqf";
buildHQ = compile preProcessFileLineNumbers "buildHQ.sqf";
statistics = compile preProcessFileLineNumbers "statistics.sqf";
/*
Generics
*/
createAirbase= compile preProcessFileLineNumbers "CREATE\createAirbase.sqf";
createBase = compile preProcessFileLineNumbers "CREATE\createBase.sqf";
createCity = compile preProcessFileLineNumbers "CREATE\createCity.sqf";
createOutpost = compile preProcessFileLineNumbers "CREATE\createOutpost.sqf";
createOutpostAA = compile preProcessFileLineNumbers "CREATE\createOutpostAA.sqf";
createPower = compile preProcessFileLineNumbers "CREATE\createPower.sqf";
createResources = compile preProcessFileLineNumbers "CREATE\createResources.sqf";
createRoadblock = compile preProcessFileLineNumbers "CREATE\createRoadblock.sqf";
createWatchpost = compile preProcessFileLineNumbers "CREATE\createWatchpost.sqf";
createAAsite = compile preProcessFileLineNumbers "CREATE\createAAsite.sqf";
templateRHS = compile preProcessFileLineNumbers "CREATE\templateRHS.sqf";
templateAAF = compile preProcessFileLineNumbers "CREATE\templateAAF.sqf";
templateOPFOR_CSAT = compile preProcessFileLineNumbers "CREATE\templateOPFOR_CSAT.sqf";
genInit = compile preProcessFileLineNumbers "CREATE\genInit.sqf";
genInitBASES = compile preProcessFileLineNumbers "CREATE\genInitBASES.sqf";
genRoadPatrol = compile preProcessFileLineNumbers "CREATE\genRoadPatrol.sqf";
genVEHinit = compile preProcessFileLineNumbers "CREATE\genVEHinit.sqf";
generateCrew = compile preProcessFileLineNumbers "CREATE\generateCrew.sqf";

NATOUAV = compile preProcessFileLineNumbers "REINF\NATOUAV.sqf";
NATORoadblock = compile preProcessFileLineNumbers "REINF\NATORoadblock.sqf";
unlockVehicle = compile preProcessFileLineNumbers "unlockVehicle.sqf";
altFastTravel = compile preProcessFileLineNumbers "altFastTravel.sqf";
ftravelDialog = compile preProcessFileLineNumbers "ftravelDialog.sqf";
establishCamp = compile preProcessFileLineNumbers "establishCamp.sqf";
createCampFIA = compile preProcessFileLineNumbers "CREATE\createCampFIA.sqf";
heal = compile preProcessFileLineNumbers "heal.sqf";
emptyCrate = compile preProcessFileLineNumbers "Municion\emptyCrate.sqf";
createNATOpuesto = compile preProcessFileLineNumbers "CREATE\createNATOpuesto.sqf";
NATOQRF = compile preProcessFileLineNumbers "CREATE\NATOQRF.sqf";
expandGroup = compile preProcessFileLineNumbers "CREATE\expandGroup.sqf";
enemyQRF = compile preprocessFileLineNumbers "CREATE\enemyQRF.sqf";
LOG_Medical = compile preProcessFileLineNumbers "Missions\LOG_Medical.sqf";
missionSelect = compile preProcessFileLineNumbers "Missions\missionSelect.sqf";
FND_CivCon = compile preProcessFileLineNumbers "Missions\FND_CivCon.sqf";
FND_MilCon = compile preProcessFileLineNumbers "Missions\FND_MilCon.sqf";
FND_ExpDealer = compile preProcessFileLineNumbers "Missions\FND_ExpDealer.sqf";
compNATORoadblock = compile preprocessFileLineNumbers "Compositions\cmpNATO_RB.sqf";
buyGear = compile preProcessFileLineNumbers "Municion\buyGear.sqf";
pBarMP = compile preProcessFileLineNumbers "pBarMP.sqf";
createConv = compile preProcessFileLineNumbers "createConv.sqf";
HQ_adds = compile preprocessFileLineNumbers "Compositions\HQ_adds.sqf";
misReqCiv = compile preProcessFileLineNumbers "Missions\misReqCiv.sqf";
misReqMil = compile preProcessFileLineNumbers "Missions\misReqMil.sqf";
CON_Power = compile preProcessFileLineNumbers "Missions\CON_Power.sqf";
PR_Pamphlet = compile preProcessFileLineNumbers "Missions\PR_Pamphlet.sqf";
CON_AA = compile preProcessFileLineNumbers "Missions\CON_AA.sqf";
PR_Brainwash = compile preProcessFileLineNumbers "Missions\PR_Brainwash.sqf";
DEF_Camp = compile preProcessFileLineNumbers "Missions\DEF_Camp.sqf";
jamLRRadio = compile preProcessFileLineNumbers "jamLRRadio.sqf";
refuel = compile preProcessFileLineNumbers "refuel.sqf";
suspendTransfer = compile preProcessFileLineNumbers "Municion\suspendTransfer.sqf";
attackWaves = compile preprocessFileLineNumbers "Scripts\attackWaves.sqf";
teleport = compile preprocessFileLineNumbers "teleport.sqf";

ACErespawn = compile preProcessFileLineNumbers "Revive\ACErespawn.sqf";
cleanGear = compile preProcessFileLineNumbers "OrgPlayers\cleanGear.sqf";
rankCheck = compile preprocessFileLineNumbers "Scripts\rankCheck.sqf";
petrosAnimation = compile preprocessFileLineNumbers "Scripts\petrosAnimation.sqf";
skillAdjustments = compile preprocessFileLineNumbers "Scripts\skillAdjustments.sqf";
localSupport = compile preprocessFileLineNumbers "Scripts\localSupport.sqf";

execVM "statSave\saveFuncs.sqf";

if ((isMultiplayer) and (isServer)) then {[[petros,"hint","Functions Init Completed"],"commsMP"] call BIS_fnc_MP};

call compile preprocessFileLineNumbers "Compositions\campList.sqf";
call compile preprocessFileLineNumbers "Compositions\cmpMTN.sqf";
call compile preprocessFileLineNumbers "Compositions\cmpOP.sqf";
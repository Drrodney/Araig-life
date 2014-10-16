enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;
tf_no_auto_long_range_radio = true;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.5";
[] execVM "briefing.sqf";
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "core\fn_antiCheat.sqf";
[] execVM "scripts\noGlobal.sqf";
[] execVM "scripts\nosidechat.sqf";
[] execVM "scripts\messages.sqf";
[] execVM "teargas.sqf";

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};


while {true} do {
player setfatigue 0;
sleep 3;
};
	[
		60, // seconds to delete dead bodies (0 means don't delete) 
		5*60, // seconds to delete dead vehicles (0 means don't delete)
		3*60, // seconds to delete immobile vehicles (0 means don't delete)
		2*60, // seconds to delete dropped weapons (0 means don't delete)
		10*60, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM 'repetitive_cleanup.sqf';


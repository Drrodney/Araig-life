[] spawn {
	disableSerialization;
	DS_really_loud_sounds = {[60,15] call fnc_usec_pitchWhine;for "_i" from 1 to 15 do {playSound format ["%1",_this select 0];};};
	DS_double_cut = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};
	DS_slap_them = {_randomnr = [2,-1] call BIS_fnc_selectRandom;(vehicle player) SetVelocity [_randomnr * random (4) * cos getdir 
	(vehicle player), _randomnr * random (4) * cos getdir (vehicle player), random (4)];};

	fnc_usec_pitchWhine = 
	{	
		_visual = _this select 0;
		_sound = _this select 1;
		0 fadeSound 0;
		playMusic ["PitchWhine",0];
		if (!r_player_unconscious) then 
		{
			_visual call fnc_usec_bulletHit;
			_sound fadeSound 1;
		};
			r_pitchWhine = true;
	
	[] spawn 
		{
		sleep 32;
		r_pitchWhine = false;
		};
	};
	
	while {true} do {
		waitUntil {sleep 1;((!isNull findDisplay 63) && (!isNull findDisplay 55))};
		if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then 
		{
			if (ctrlText ((findDisplay 63) displayCtrl 101) == localize "str_channel_global") then 
			{
				[] spawn {
					if (isNil "reset_timer") then {
						reset_timer = true;
						sleep 300;
						disconnect_me = nil;
						warn_one = nil;
						warn_two = nil;warn_last = nil;
						reset_timer = nil;
					};
			};
			if (isNil "disconnect_me") then {disconnect_me = 0;} else {disconnect_me = disconnect_me + 1;};
			if (disconnect_me == 0) then {
				if (isNil "warn_one") then {
					warn_one = true;
					systemChat ("Please do not use voice on global chat, this is your first warning.");
					cutText ["STAY OFF GLOBAL PLEASE", "PLAIN"];
					};
				};
					if (disconnect_me == 1) then {if (isNil "warn_two") then {warn_two = true;
					systemChat ("Please do not use voice on global chat, this is your final warning..");systemChat ("You will be frozen and then disconnected!");cutText ["LAST WARNING TO STAY OFF GLOBAL PLEASE", "PLAIN"];};};if (disconnect_me >= 2) then {if (isNil "warn_last") then {warn_last = true;playMusic ["PitchWhine",0];[] spawn DS_slap_them;cutText ["YOU ARE BEING DISCONNECTED - STAY OFF OF GLOBAL PLEASE", "BLACK"];1 fademusic 10;
					1 fadesound 10;
					disableUserInput true;
					startLoadingScreen ["You are being disconnected for using global chat"];
					progressLoadingScreen 0.4;
					sleep 2.25;
					progressLoadingScreen 0.8;
					sleep 2.25;
					endLoadingScreen;
					sleep 0.5;
					disableUserInput false;
					endMission "LOSER";	};};};};sleep 1;};};
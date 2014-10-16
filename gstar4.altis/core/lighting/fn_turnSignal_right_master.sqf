/*
	File Name: fn_turnSignal_right_master.sqf
	File Created: 5/28/2014
	File Version: 1.0
	File Author: @Foamy 
	File Last Edit Date: 5/28/2014
	File Description: Turn Signal (Right) Master Script
	
*/

private ["_vehicle","_turnSignal_right_front","_turnSignal_right_rear","_lightYellow","_rightTS","_brightness","_attach"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights_tSR")) exitWith {};

switch (typeOf _vehicle) do 
{	
	case "C_Offroad_01_F": { _attach = [[0.80, 2.1, -.33], [0.805, -2.99, -.358]]; };
	case "C_SUV_01_F": { _attach = [[.855, 1.87, -.45],[0.68, -2.92, -.22]]; };	
	case "B_MRAP_01_F": { _attach = [[1, -2.8, 0.55],[0.95, -0.87, 0.56]]; };
	case "C_Hatchback_01_F": { _attach = [[.81, 1.7, -.52],[1.3, -2.35, -.3]]; };
};

_lightYellow = [255, 178, 0];

//------------------------------------------------------------------------------------

_turnSignal_right_front = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_turnSignal_right_rear = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_turnSignal_right_front setLightColor _lightYellow;
_turnSignal_right_rear setLightColor _lightYellow;

_turnSignal_right_front setLightBrightness 0;
_turnSignal_right_rear setLightBrightness 0;

_turnSignal_right_front lightAttachObject [_vehicle, _attach select 0];
_turnSignal_right_rear lightAttachObject [_vehicle, _attach select 1];

_turnSignal_right_front setLightAttenuation [0.181, 40, 1000, 40];
_turnSignal_right_rear setLightAttenuation [0.181, 40, 1000, 40];

_turnSignal_right_front setLightIntensity 3;
_turnSignal_right_rear setLightIntensity 3;

_turnSignal_right_front setLightFlareSize 1;
_turnSignal_right_rear setLightFlareSize 1;

_turnSignal_right_front setLightFlareMaxDistance 20;
_turnSignal_right_rear setLightFlareMaxDistance 20;

_turnSignal_right_front setLightUseFlare true;
_turnSignal_right_rear setLightUseFlare true;

_turnSignal_right_front setLightDayLight true;
_turnSignal_right_rear setLightDayLight true;

if (sunOrMoon < 1) then {
	_brightness = 1;
} else {
	_brightness = 10;
};

_rightTS = true;  
while {(alive _vehicle)} do { 
	if (!(_vehicle getVariable "lights_tSR")) exitWith {};
	if (_rightTS) then {  
		_rightTS = false;		
		_turnSignal_right_front setLightBrightness 0;
		_turnSignal_right_rear setLightBrightness 0;
		sleep .5;
		_turnSignal_right_front setLightBrightness _brightness;
		_turnSignal_right_rear setLightBrightness _brightness;
		_rightTS = true;		
	};
	sleep 0.22;  
};  
deleteVehicle _turnSignal_right_front;
deleteVehicle _turnSignal_right_rear;
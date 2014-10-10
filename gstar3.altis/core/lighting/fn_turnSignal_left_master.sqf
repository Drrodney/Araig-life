/*
	File Name: fn_turnSignal_left_master.sqf
	File Created: 5/28/2014
	File Version: 1.0
	File Author: @Foamy 
	File Last Edit Date: 5/28/2014
	File Description: Turn Signal (Left) Master Script
	
*/

private ["_vehicle","_turnSignal_left_front","_turnSignal_left_rear","_lightYellow","_leftTL","_brightness","_attach"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights_tSL")) exitWith {};

switch (typeOf _vehicle) do 
{
	case "C_Offroad_01_F": { _attach = [[-0.88, 2.1, -.33],[-0.945, -2.99, -.358]]; };
	case "C_SUV_01_F": { _attach = [[-.875, 1.87, -.45],[-0.68, -2.9, -.22]]; };
	case "B_MRAP_01_F": { _attach = [[-1.1, 1.43, -.56],[-0.6, -4.2, -.8]]; };
	case "C_Hatchback_01_F": { _attach = [[-0.74, 1.7, -.5],[-0.7, -2.35, -.3]]; };
};

_lightYellow = [255, 178, 0];

_turnSignal_left_front = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_turnSignal_left_rear = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_turnSignal_left_front setLightColor _lightYellow;
_turnSignal_left_rear setLightColor _lightYellow;

_turnSignal_left_front setLightBrightness 0;
_turnSignal_left_rear setLightBrightness 0;

_turnSignal_left_front lightAttachObject [_vehicle, _attach select 0];
_turnSignal_left_rear lightAttachObject [_vehicle, _attach select 1];

_turnSignal_left_front setLightAttenuation [0.181, 40, 1000, 40];
_turnSignal_left_rear setLightAttenuation [0.181, 40, 1000, 40];

_turnSignal_left_front setLightIntensity 3;
_turnSignal_left_rear setLightIntensity 3;

_turnSignal_left_front setLightFlareSize 1;
_turnSignal_left_rear setLightFlareSize 1;

_turnSignal_left_front setLightFlareMaxDistance 20;
_turnSignal_left_rear setLightFlareMaxDistance 20;

_turnSignal_left_front setLightUseFlare true;
_turnSignal_left_rear setLightUseFlare true;

_turnSignal_left_front setLightDayLight true;
_turnSignal_left_rear setLightDayLight true;

if (sunOrMoon < 1) then {
	_brightness = 1;
} else {
	_brightness = 10;
};

_leftTL = true;  
while {(alive _vehicle)} do { 
	if (!(_vehicle getVariable "lights_tSL")) exitWith {};
	if (_leftTL) then {  
		_leftTL = false;
		_turnSignal_left_front setLightBrightness 0;
		_turnSignal_left_rear setLightBrightness 0;
		sleep .5;
		_turnSignal_left_front setLightBrightness _brightness;
		_turnSignal_left_rear setLightBrightness _brightness;
		_leftTL = true;		
	};
	sleep 0.22;  
};  
deleteVehicle _turnSignal_left_front;
deleteVehicle _turnSignal_left_rear;
/*
	File Name: fn_hazard_lights_master.sqf
	File Created: 5/28/2014
	File Version: 1.0
	File Author: @Foamy 
	File Last Edit Date: 5/28/2014
	File Description: Hazard Lights Master Script
	
*/

private ["_vehicle","_hazlight_left_front","_hazlight_left_rear","_hazlight_right_front","_hazlight_right_rear","_lightYellow","_leftYellow","_brightness","_attach"];
//_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights_hazard")) exitWith {};

switch (typeOf _vehicle) do 
{
	case "C_Offroad_01_F": { _attach = [[-0.88, 2.1, -.33],[0.80, 2.1, -.33],[-0.945, -2.99, -.358],[0.805, -2.99, -.358]]; };
	case "C_SUV_01_F": { _attach = [[-.875, 1.87, -.45],[.855, 1.87, -.45],[-0.68, -2.9, -.22],[0.68, -2.92, -.22]]; };
	case "B_MRAP_01_F": { _attach = [[-1.1, 1.43, -.56],[1.15, 1.45, -.56],[-0.6, -4.2, -.8],[.6, -4.3, -.8]]; };
	case "C_Hatchback_01_F": { _attach = [[-0.74, 1.7, -.5],[.81, 1.7, -.52],[-0.7, -2.35, -.3],[1.3, -2.35, -.3]]; };
};

_lightYellow = [255, 178, 0];

_hazlight_left_front = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_hazlight_left_rear = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_hazlight_left_front setLightColor _lightYellow;
_hazlight_left_rear setLightColor _lightYellow;

_hazlight_left_front setLightBrightness 0;
_hazlight_left_rear setLightBrightness 0;

_hazlight_left_front lightAttachObject [_vehicle, _attach select 0];
_hazlight_left_rear lightAttachObject [_vehicle, _attach select 2];

_hazlight_left_front setLightAttenuation [0.181, 40, 1000, 40];
_hazlight_left_rear setLightAttenuation [0.181, 40, 1000, 40];

_hazlight_left_front setLightIntensity 3;
_hazlight_left_rear setLightIntensity 3;

_hazlight_left_front setLightFlareSize 1;
_hazlight_left_rear setLightFlareSize 1;

_hazlight_left_front setLightFlareMaxDistance 20;
_hazlight_left_rear setLightFlareMaxDistance 20;

_hazlight_left_front setLightUseFlare true;
_hazlight_left_rear setLightUseFlare true;

_hazlight_left_front setLightDayLight true;
_hazlight_left_rear setLightDayLight true;

//------------------------------------------------------------------------------------

_hazlight_right_front = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_hazlight_right_rear = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_hazlight_right_front setLightColor _lightYellow;
_hazlight_right_rear setLightColor _lightYellow;

_hazlight_right_front setLightBrightness 0;
_hazlight_right_rear setLightBrightness 0;

_hazlight_right_front lightAttachObject [_vehicle, _attach select 1];
_hazlight_right_rear lightAttachObject [_vehicle, _attach select 3];

_hazlight_right_front setLightAttenuation [0.181, 40, 1000, 40];
_hazlight_right_rear setLightAttenuation [0.181, 40, 1000, 40];

_hazlight_right_front setLightIntensity 3;
_hazlight_right_rear setLightIntensity 3;

_hazlight_right_front setLightFlareSize 1;
_hazlight_right_rear setLightFlareSize 1;

_hazlight_right_front setLightFlareMaxDistance 20;
_hazlight_right_rear setLightFlareMaxDistance 20;

_hazlight_right_front setLightUseFlare true;
_hazlight_right_rear setLightUseFlare true;

_hazlight_right_front setLightDayLight true;
_hazlight_right_rear setLightDayLight true;

if (sunOrMoon < 1) then {
	_brightness = 1;
} else {
	_brightness = 10;
};

_leftYellow = true;  
while {(alive _vehicle)} do { 
	if (!(_vehicle getVariable "lights_hazard")) exitWith {};
	if (_leftYellow) then {  
		_leftYellow = false;
		_hazlight_left_front setLightBrightness 0;
		_hazlight_left_rear setLightBrightness 0;		
		_hazlight_right_front setLightBrightness 0;
		_hazlight_right_rear setLightBrightness 0;
		sleep .5;
		_hazlight_left_front setLightBrightness _brightness;
		_hazlight_left_rear setLightBrightness _brightness;
		_hazlight_right_front setLightBrightness _brightness;
		_hazlight_right_rear setLightBrightness _brightness;
		_leftYellow = true;		
	};
	sleep 0.22;  
};  
deleteVehicle _hazlight_left_front;
deleteVehicle _hazlight_left_rear;
deleteVehicle _hazlight_right_front;
deleteVehicle _hazlight_right_rear;
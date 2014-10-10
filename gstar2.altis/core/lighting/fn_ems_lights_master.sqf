/*
	File Name: fn_ems_lights_master.sqf
	File Created: 5/8/2014
	File Author: @Foamy / @ Waldron
	File Last Edit Date: 5/28/2014
	File Description: EMS Lights Master Script
*/

private ["_vehicle","_lightRed","_lightBlue","_lightleft1","_lightleft2","_lightright1","_lightright2","_leftRed","_brightness","_attach"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "ems_lights")) exitWith {};

switch (typeOf _vehicle) do 
{
	case "C_Offroad_01_F": { _attach = [[-0.57, 0.0, 0.56], [0.27, 0.0, 0.56], [-0.27, 0.0, 0.56], [0.47, 0.0, 0.56]]; };
};

//RED
_lightRed = [20, 0.1, 0.1];

_lightleft1 = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_lightleft2 = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightleft1 setLightColor _lightRed;
_lightleft2 setLightColor _lightRed;

_lightleft1 setLightBrightness 0;
_lightleft2 setLightBrightness 0;

_lightleft1 lightAttachObject [_vehicle, _attach select 0];
_lightleft2 lightAttachObject [_vehicle, _attach select 3];

_lightleft1 setLightAttenuation [0.181, 0, 1000, 130];
_lightleft2 setLightAttenuation [0.181, 0, 1000, 130];

_lightleft1 setLightIntensity 20;
_lightleft2 setLightIntensity 20;

_lightleft1 setLightFlareSize 0.38;
_lightleft2 setLightFlareSize 0.38;

_lightleft1 setLightFlareMaxDistance 150;
_lightleft2 setLightFlareMaxDistance 150;

_lightleft1 setLightUseFlare true;
_lightleft2 setLightUseFlare true;

_lightleft1 setLightDayLight true;
_lightleft2 setLightDayLight true;

//------------------------------------------------------------------------------------

_lightright1 = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_lightright2 = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightright1 setLightColor _lightRed;
_lightright2 setLightColor _lightRed;

_lightright1 setLightBrightness 0;
_lightright2 setLightBrightness 0;

_lightright1 lightAttachObject [_vehicle, _attach select 1];
_lightright2 lightAttachObject [_vehicle, _attach select 2];

_lightright1 setLightAttenuation [0.181, 0, 1000, 130];
_lightright2 setLightAttenuation [0.181, 0, 1000, 130];

_lightright1 setLightIntensity 5;
_lightright2 setLightIntensity 5;

_lightright1 setLightFlareSize 0.38;
_lightright2 setLightFlareSize 0.38;

_lightright1 setLightFlareMaxDistance 150;
_lightright2 setLightFlareMaxDistance 150;

_lightright1 setLightUseFlare true;
_lightright2 setLightUseFlare true;

_lightright1 setLightDayLight true;
_lightright2 setLightDayLight true;

if (sunOrMoon < 1) then 
{
	_brightness = 6;
} 
else 
{
	_brightness = 50;
};

_leftRed = true;  
while {(alive _vehicle)} do 
{ 
	if (!(_vehicle getVariable "ems_lights")) exitWith {};
	if (_leftRed) then 
	{  
		_leftRed = false;  
		_lightright1 setLightBrightness 0;
		_lightright2 setLightBrightness 0;		
		sleep 0.05;
		_lightleft1 setLightBrightness _brightness;
		_lightleft2 setLightBrightness _brightness;
		sleep 0.05;
		_lightleft1 setLightBrightness 0;
		_lightleft2 setLightBrightness 0;		
		sleep 0.05;
		_lightright1 setLightBrightness _brightness;  
		_lightright2 setLightBrightness _brightness; 		
	} 
	else 
	{  
		_leftRed = true;  
		_lightright1 setLightBrightness 0;
		_lightright2 setLightBrightness 0;		
		sleep 0.2;
		_lightleft1 setLightBrightness _brightness;
		_lightleft2 setLightBrightness _brightness;
		sleep 0.2;
		_lightleft1 setLightBrightness 0;
		_lightleft2 setLightBrightness 0;		
		sleep 0.2;
		_lightright1 setLightBrightness _brightness;  
		_lightright2 setLightBrightness _brightness; 	
	};
	sleep 0.3;  
};  
deleteVehicle _lightleft1;
deleteVehicle _lightleft2;
deleteVehicle _lightright1;
deleteVehicle _lightright2;
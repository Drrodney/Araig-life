/*
	File Name: fn_police_aux_lights_master.sqf
	File Created: 5/8/2014
	File Version: 1.0
	File Author: @Foamy 
	File Last Edit Date: 5/28/2014
	File Description: Police Aux (Front Bumper) Lights Master Script	
*/

private ["_vehicle","_lightColor","_lightleft","_lightright","_leftBlue","_brightness","_attach"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "cop_lights_aux")) exitWith {};

switch (typeOf _vehicle) do 
	{	
	// Front Grill
	case "C_Offroad_01_F": { _attach = [[-0.28, 2.65, -.50], [0.18, 2.65, -.50]]; };
	};

// Blue
_lightColor = [0.1, 0.1, 20];

_lightleft = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];

sleep 0.2;
_lightleft setLightColor _lightColor;

_lightleft setLightBrightness 5;

_lightleft lightAttachObject [_vehicle, _attach select 0];
_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 1;
_lightleft setLightFlareMaxDistance 50;
_lightleft setLightUseFlare true;
_lightleft setLightDayLight true;


//------------------------------------------------------------------------------------

_lightright = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightright setLightColor _lightColor;
_lightright setLightBrightness 5;
_lightright lightAttachObject [_vehicle, _attach select 1];
_lightright setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightIntensity 10;
_lightright setLightFlareSize 1;
_lightright setLightFlareMaxDistance 50;
_lightright setLightUseFlare true;
_lightright setLightDayLight true;

if (sunOrMoon < 1) then 
{
	_brightness = 6;
} 
else 
{
	_brightness = 40;
};

_leftBlue = true;  
while {(alive _vehicle)} do 
{ 
	if (!(_vehicle getVariable "cop_lights_aux")) exitWith {};
	if (_leftBlue) then 
	{  
		_leftBlue = false;  
		_lightleft setLightBrightness _brightness;		
		sleep 0.05;
		_lightleft setLightBrightness 0;
		sleep 0.05;
		_lightleft setLightBrightness _brightness;		
		sleep 0.05;
		_lightleft setLightBrightness 0;		
	} 
	else
	{  
		_leftBlue = true;  
		_lightright setLightBrightness _brightness;		
		sleep 0.05;
		_lightright setLightBrightness 0; 
		sleep 0.05;
		_lightright setLightBrightness _brightness;
		sleep 0.05;
		_lightright setLightBrightness 0;
	};
	sleep 0.22;  
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;
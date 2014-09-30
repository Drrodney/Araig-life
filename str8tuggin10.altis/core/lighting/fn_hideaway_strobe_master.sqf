/*
	File Name: fn_hideaway_strobe_master.sqf
	File Created: 9/23/2014
	File Author: @Foamy / @ Waldron
	File Last Edit Date: 9/23/2014
	File Description: Hideaway Strobes
*/

private ["_vehicle","_lightRed","_lightBlue","_lightleft1","_lightleft2","_lightright1","_lightright2","_leftRed","_brightness","_attach"];

_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "hideaway_strobe")) exitWith {};

switch (typeOf _vehicle) do 
{
	case "C_Offroad_01_F": { _attach = [[-0.88, 2.1, -.33],[0.80, 2.1, -.33],[-0.945, -2.99, -.358],[0.805, -2.99, -.358]]; };
	case "C_SUV_01_F": { _attach = [[-.875, 1.87, -.45],[.855, 1.87, -.45],[-0.68, -2.9, -.22],[0.68, -2.92, -.22]]; };
	case "B_MRAP_01_F": { _attach = [[-1.1, 1.43, -.56],[1.15, 1.45, -.56],[-0.6, -4.2, -.8],[.6, -4.3, -.8]]; };
	case "C_Hatchback_01_F": { _attach = [[-0.74, 1.7, -.5],[.81, 1.7, -.52],[-0.7, -2.35, -.3],[1.3, -2.35, -.3]]; };
};

//White
_lightWhite = [255, 255, 255];

_lightleft1 = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
_lightleft2 = createVehicle ["#lightpoint", getPos _vehicle, [], 0, "CAN_COLLIDE"];
sleep 0.2;
_lightleft1 setLightColor _lightWhite;
_lightleft2 setLightColor _lightWhite;

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
_lightright1 setLightColor _lightWhite;
_lightright2 setLightColor _lightWhite;

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
	_brightness = .5;
} 
else 
{
	_brightness = 25;
};

_leftRed = true;  
while {(alive _vehicle)} do 
{ 
	if (!(_vehicle getVariable "hideaway_strobe")) exitWith {};
	if (_leftRed) then 
	{  
		_leftRed = false;  
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
	sleep 0.1;  
};  
deleteVehicle _lightleft1;
deleteVehicle _lightleft2;
deleteVehicle _lightright1;
deleteVehicle _lightright2;
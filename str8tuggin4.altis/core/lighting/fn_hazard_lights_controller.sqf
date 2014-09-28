/*
	File Name: fn_hazard_lights_controller.sqf
	File Created: 5/28/2014
	File Version: 1.0
	File Author: @Foamy 
	File Last Edit Date: 5/28/2014
	File Description: Hazard Lights Controller Script
	Based off:
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine

*/

private["_vehicle","_lights_hazard_TF"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; 
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_F"])) exitWith {}; 
_lights_hazard_TF = _vehicle getVariable["lights_hazard",FALSE];
if(_lights_hazard_TF) then 
{
	_vehicle setVariable["lights_hazard",FALSE,TRUE];
} 
else 
{
	_vehicle setVariable["lights_hazard",TRUE,TRUE];
	[[_vehicle],"life_fnc_hazard_lights_master",true,false] call life_fnc_MP;
};
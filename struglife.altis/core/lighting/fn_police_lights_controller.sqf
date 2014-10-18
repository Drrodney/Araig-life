/*
	File Name: fn_police_lights_controller.sqf
	File Created: 5/28/2014
	File Author: @Foamy
	File Description: Police Lights Controller Script
	Based off:
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine

*/

private["_vehicle","_cop_lights_TF"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"])) exitWith {}; 
_cop_lights_TF = _vehicle getVariable["cop_lights",FALSE];
if(_cop_lights_TF) then 
{
	_vehicle setVariable["cop_lights",FALSE,TRUE];
} 
else
{
	_vehicle setVariable["cop_lights",TRUE,TRUE];
	[[_vehicle],"life_fnc_police_lights_master",true,false] call life_fnc_MP;
};
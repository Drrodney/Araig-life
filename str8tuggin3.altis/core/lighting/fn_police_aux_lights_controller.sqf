/*
	File Name: fn_police_aux_lights_controller.sqf
	File Created: 5/28/2014
	File Version: 1.0
	File Author: @Foamy 
	File Last Edit Date: 5/28/2014
	File Description: Police Aux Lights Controller Script
	Based off:
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwinec

*/

private["_vehicle","_cop_lights_aux_TF"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_01_F"])) exitWith {};
_cop_lights_aux_TF = _vehicle getVariable["cop_lights_aux",FALSE];
if(_cop_lights_aux_TF) then 
{
	_vehicle setVariable["cop_lights_aux",FALSE,TRUE];
} 
else 
{
	_vehicle setVariable["cop_lights_aux",TRUE,TRUE];
	[[_vehicle],"life_fnc_police_aux_lights_master",true,false] call life_fnc_MP;
};
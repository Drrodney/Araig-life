/*
	File Name: fn_turnSignal_right_controller.sqf
	File Created: 5/28/2014
	File Version: 1.0
	File Author: @Foamy 
	File Last Edit Date: 5/28/2014
	File Description: Turn Signal (Right) Controller Script
	Based off:
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine

*/

private["_vehicle","_lights_tSR_TF"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; 
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_F"])) exitWith {}; 
_lights_tSR_TF = _vehicle getVariable["lights_tSR",FALSE];
if(_lights_tSR_TF) then 
{
	_vehicle setVariable["lights_tSR",FALSE,TRUE];
}
else
{
	_vehicle setVariable["lights_tSR",TRUE,TRUE];
	[[_vehicle],"life_fnc_turnSignal_right_master",true,false] call life_fnc_MP;
};
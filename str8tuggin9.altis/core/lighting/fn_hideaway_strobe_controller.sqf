/*
	File Name: fn_hideaway_strobe_controller.sqf
	File Created: 9/23/2014
	File Version: 1.0
	File Author: @Foamy / @Waldron
	File Last Edit Date: 9/23/2014
	File Description: Hide Away Strobe Lights
	Based off:
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine

*/

private["_vehicle","_hideaway_strobe_TF"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; 
if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_F"])) exitWith {}; 
_hideaway_strobe_TF = _vehicle getVariable["hideaway_strobe",FALSE];
if(_hideaway_strobe_TF) then 
{
	_vehicle setVariable["hideaway_strobe",FALSE,TRUE];
} 
else 
{
	_vehicle setVariable["hideaway_strobe",TRUE,TRUE];
	[[_vehicle],"life_fnc_hideaway_strobe_master",true,false] call life_fnc_MP;
};
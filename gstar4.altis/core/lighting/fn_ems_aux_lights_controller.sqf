/*
	File Name: fn_ems_aux_lights_controller.sqf
	File Created: 9/23/2014
	File Author: @Foamy / @Waldron
	File Description: EMS Auxiliary Lights Controller Script
*/

private["_vehicle","_ems_lights_aux_TF"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_01_F"])) exitWith {};
_ems_lights_aux_TF = _vehicle getVariable["ems_lights_aux",FALSE];
if(_ems_lights_aux_TF) then 
{
	_vehicle setVariable["ems_lights_aux",FALSE,TRUE];
} 
else 
{
	_vehicle setVariable["ems_lights_aux",TRUE,TRUE];
	[[_vehicle],"life_fnc_ems_aux_lights_master",true,false] call life_fnc_MP;
};
#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_Rangemaster","Cop Uniform",25]];
		
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["U_BG_Guerilla2_1",nil,500]];
			_ret set[count _ret,["U_BG_Guerilla2_3",nil,500]];
			_ret set[count _ret,["U_I_G_Story_Protagonist_F",nil,500]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_ret set[count _ret,["U_NikosAgedBody",nil,500]];
		};
		if(!license_cop_swat) then
		{
			_ret set[count _ret,["U_B_CombatUniform_mcam",nil,1000]];
		};
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,75]];
			_ret set[count _ret,["H_Cap_blk",nil,120]];
			_ret set[count _ret,["H_HelmetB",nil,200]];
		};
		
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_Watchcap_blk",nil,100]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt",nil,800]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["V_TacVest_blk_POLICE",nil,1500]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret, ["V_PlateCarrier1_blk",nil,1000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["V_TacVestIR_blk",nil,1500]];
			_ret set[count _ret,["V_Chestrig_blk",nil,1000]];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_OutdoorPack_blk",nil,2500],
			["B_OutdoorPack_tan",nil,4500],
			["B_OutdoorPack_blu",nil,3500],
			["B_HuntingBackpack",nil,3000],
			["B_AssaultPack_khk",nil,4500],
			["B_AssaultPack_dgtl",nil,4500],
			["B_AssaultPack_rgr",nil,5000],
			["B_AssaultPack_sgg",nil,5000],
			["B_AssaultPack_blk",nil,2500],
			["B_AssaultPack_cbr",nil,4500],
			["B_AssaultPack_mcamo",nil,3500],
			["B_Kitbag_mcamo",nil,3000],
			["B_Kitbag_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_FieldPack_blk",nil,5000],
			["B_FieldPack_ocamo",nil,5000],
			["B_FieldPack_oucamo",nil,2500],
			["B_FieldPack_cbr",nil,4500],
			["B_Bergen_sgg",nil,3500],
			["B_Bergen_mcamo",nil,3000],
			["B_Bergen_rgr",nil,4500],
			["B_Bergen_blk",nil,4500],
			["B_Carryall_ocamo",nil,5000],
			["B_Carryall_oucamo",nil,5000],
			["B_Carryall_mcamo",nil,2500],
			["B_Carryall_oli",nil,4500],
			["B_Carryall_khk",nil,3500],
			["B_Carryall_cbr",nil,3000]
		];
	};
};

_ret;
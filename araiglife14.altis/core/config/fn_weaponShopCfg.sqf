#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,500],
						["HandGrenade_Stone","Flashbang",700],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["SmokeShell",nil,1700],
						["Chemlight_Blue",nil,50],
						["tf_anprc152",nil,150],
						["tf_rt1523g",nil,5000]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000],
						["tf_anprc152",nil,150],
						["tf_rt1523g",nil,5000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["SMG_02_ACO_F",nil,1800],
						["HandGrenade_Stone","Flashbang",700],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,200],
						["optic_Arco",nil,500],
						["muzzle_snds_H",nil,750],
						["30Rnd_9x21_Mag",nil,250],
						["tf_anprc152",nil,150],
						["tf_rt1523g",nil,5000]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["SMG_02_ACO_F",nil,2000],
						["SMG_01_ACO_F",nil,1800],
						["arifle_TRG20_F",nil,1200],
						["hgun_Rook40_F",nil,500],
						["hgun_ACPC2_F",nil,500],
						["srifle_EBR_ARCO_pointer_F",nil,1700],
						["HandGrenade_Stone","Flashbang",700],
						["arifle_MXC_F",nil,15000],
						["arifle_MXC_Black_F",nil,2000],
						["arifle_MX_Black_F",nil,2000],
						["arifle_MX_F",nil,2000],
						["optic_Arco",nil,450],
						["optic_MRCO",nil,500],
						["optic_LRPS",nil,700],
						["muzzle_snds_H",nil,750],
						["30Rnd_65x39_caseless_mag",nil,35],
						["30Rnd_9x21_Mag",nil,30],
						["30Rnd_556x45_Stanag",nil,30],
						["20Rnd_762x51_Mag",nil,40],
						["30Rnd_45ACP_Mag_SMG_01",nil,30],
						["9Rnd_45ACP_Mag",nil,30],
						["tf_anprc152",nil,150],
						["tf_rt1523g",nil,5000]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F",nil,25000],
						["arifle_Mk20C_F",nil,2500],
						["arifle_Mk20C_plain_F",nil,2500],
						["arifle_Katiba_C_F",nil,30000],
						["srifle_DMR_01_F",nil,50000],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["optic_Hamr",nil,7500],
						["optic_LRPS",nil,3000],
						["acc_flashlight",nil,1000],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275],
						["tf_pnr1000a",nil,300],
						["tf_fadak",nil,3000],
						["tf_mr3000",nil,10000]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_Pistol_heavy_01_F",nil,12000],
						["optic_MRD",nil,2500],
						["optic_Yorris",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["11Rnd_45ACP_Mag",nil,45],
						["tf_anprc154",nil,200],
						["tf_anprc148jem",nil,2000],
						["tf_anprc155",nil,7000]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_Pistol_heavy_01_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["optic_MRD",nil,950],
						["optic_Yorris",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["11Rnd_45ACP_Mag",nil,45]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};

// Admin Tool and Anti Hack costomized by aalexx
waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561198089127216","76561198020932453","76561198063853907","76561198069062935"]) then {
	sleep 10;
	
	execVM "admintool\main.sqf";
	
	hint "Admin Tool Loaded";
}else {
   execVM "admintool\hackerSpanker.sqf";
   execVM "admintool\hackerSpanker2.sqf";
};
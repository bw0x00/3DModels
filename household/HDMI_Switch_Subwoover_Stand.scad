// Render Precision
$fn=50;

// Variables 
tolerance = 25;

wall = 5;
floor = 5;
ceiling = 10;

bottom_switch_height = 30 + tolerance;
bottom_switch_depth= 120 + tolerance;
bottom_switch_width= 300 + tolerance;
bottom_switch_cable = 68;

top_sub_height= 230 + tolerance;
top_sub_depth = 140 + tolerance;
top_sub_width= 230 + tolerance;

module base(){
	cube([bottom_switch_width + 2*wall,
		bottom_switch_depth + wall,
		bottom_switch_height+floor+ceiling]); 
}

base();

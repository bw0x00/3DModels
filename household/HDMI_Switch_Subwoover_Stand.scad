// Imports
use <MCAD/boxes.scad>

// Render Precision
$fn=50;

// Variables 
tolerance = 25;

wall = 5;
floor = 5;
ceiling = 10;

bottom_switch_height = 30 + tolerance;
bottom_switch_depth = 120 + tolerance;
bottom_switch_width_front = 300 + tolerance;
bottom_switch_width_back= 285 + tolerance;
bottom_switch_cable = 68;

top_sub_height= 230 + tolerance;
top_sub_depth = 140 + tolerance;
top_sub_width= 230 + tolerance;

module base(){
	roundedBox(size=[bottom_switch_width_front + 2*wall,
		bottom_switch_depth + wall,
		bottom_switch_height+floor+ceiling],
		radius=1
		);
}

module cut(){
	color("blue")
	cube([bottom_switch_width_front,
		bottom_switch_depth+10,
		bottom_switch_height]);
}

//difference(){
%	base();
	translate([-bottom_switch_width_front/2,-bottom_switch_depth/2-5,-bottom_switch_height/2]){
		cut();
//	}
}
	


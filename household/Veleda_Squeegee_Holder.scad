// Render Precision
$fn=50;

/*
 Dimensions Definitions
*/
total_height = 50;
hook_strength = 5;
handle_width = 50;
holder_hook_depth = 20;
holder_hook_height = 10;
holder_hook_width = handle_width+2*hook_strength;
glass_thickness = 6+0.1;
glass_hook_width = 50;
glass_hook_height= total_height/2;


// Form the Glass Hook
module glass_hook(){
	color("blue")
	difference(){
		cube([glass_hook_width, 2*hook_strength+glass_thickness, total_height]);

		translate([-0.1,hook_strength-0.1,-hook_strength])
			cube([glass_hook_width+0.2, glass_thickness+0.2, total_height]);
		translate([-0.1, -0.1, -0.1])
			cube([glass_hook_width+0.2, hook_strength+0.2, glass_hook_height+0.1]);
	}
}

// Form the Squeegee Hook
module holder(){
	color("green")
	difference(){
		translate([-(holder_hook_width-glass_hook_width)/2, hook_strength+glass_thickness, 0])
			cube([holder_hook_width, 2*hook_strength+holder_hook_depth, total_height]);

		translate([-0.1-(holder_hook_width-glass_hook_width)/2, 2*hook_strength+glass_thickness, hook_strength])
			cube([holder_hook_width+0.2, holder_hook_depth, total_height]);
		translate([-0.1-(holder_hook_width-glass_hook_width)/2, 2*hook_strength+glass_thickness+holder_hook_depth-0.1,hook_strength+holder_hook_height]) 
			cube([holder_hook_width+0.2, hook_strength+0.2, total_height]);
		translate([-(handle_width-glass_hook_width)/2, 2*hook_strength+glass_thickness, -0.1])
			cube([handle_width, holder_hook_depth+hook_strength+0.1, holder_hook_height+hook_strength+0.2]);
	}
}

glass_hook();
holder();

	

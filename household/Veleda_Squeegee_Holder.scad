// Render Precision
$fn=50;

/*
 Dimensions Definitions
*/
hook_strength = 5;
handle_width = 50;
holder_hook_depth = 20;
holder_hook_height = 2*hook_strength;
holder_hook_width = handle_width+2*hook_strength;
holder_height = 50;
glass_thickness = 6+0.1;
glass_hook_width = 50;
glass_hook_height= glass_hook_width;
overlapp = glass_hook_height/2;
total_height = glass_hook_height - overlapp + holder_height;


// Form the Glass Hook
module glass_hook_base(){
	color("blue")
	difference(){
        translate([0,0,0])
    		cube([glass_hook_width, 2*hook_strength+glass_thickness, glass_hook_height]);

	    translate([-0.1,hook_strength-0.1,0])
			cube([glass_hook_width+0.2, glass_thickness+0.2, glass_hook_height*2/3]);
	}
}

module glass_hook_rounded(){
    intersection(){
        translate([glass_hook_width/2,hook_strength+glass_thickness/2,glass_hook_height/2])
            resize([glass_hook_width,5*hook_strength,glass_hook_height]) sphere([1,1,1]);
        glass_hook_base();
    }
}

// Form the Squeegee Hook
module holder(){
    color("green")
	difference(){
		cube([holder_hook_width, 2*hook_strength+holder_hook_depth, holder_height]);
        translate([-0.1, hook_strength, hook_strength])
    		cube([holder_hook_width+0.2, holder_hook_depth, holder_height]);
		translate([-0.1, holder_hook_depth+hook_strength-0.1, holder_hook_height])
            cube([holder_hook_width+0.2, hook_strength+0.2, holder_height]);
        translate([hook_strength, hook_strength,-0.1])
    		cube([handle_width, holder_hook_depth+hook_strength+0.1, holder_hook_height+hook_strength+0.2]);
	}
}

glass_hook_rounded();
translate([(glass_hook_width-holder_hook_width)/2,hook_strength+glass_thickness,overlapp-glass_hook_height])
    holder();

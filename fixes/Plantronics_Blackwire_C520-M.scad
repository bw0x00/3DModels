$fn=100;
cabel_positionXY=[6.25-2,21/2,0];

module tube (outer_r,inner_r,length){
	difference(){
		cylinder(r=outer_r,h=length);
		translate ([0,0,-0.5])
			cylinder(r=inner_r,h=length+1);
	}
}

difference() {
	union() {
		difference(){
		    minkowski(){
	        	linear_extrude(height=66) polygon(points=[[0,0],[0,21],[11,18],[11,3]]);
		        sphere(r=2);
		    }
		    minkowski() {
        		translate([0,0,0])
		            linear_extrude(height=66)
        		        polygon(points=[[0,0],[0,21],[11,18],[11,3]]);
	        	sphere(r=0.5);
		    }
		    translate([-2.3,0,0]) cube([4,21,66]);
		}

		translate(cabel_positionXY+[0,0,-6.9]) tube (outer_r=5/2,inner_r=3.8/2,length=6);
		translate(cabel_positionXY+[0,0,-6.9-8.9]) tube (outer_r=5/2,inner_r=2.7/2,length=15-6);
		translate(cabel_positionXY+[0,0,66.9]) tube (outer_r=5/2,inner_r=3.8/2,length=6);
		translate(cabel_positionXY+[0,0,66.9+5.9]) tube (outer_r=5/2,inner_r=2.7/2,length=15-6);
	}

	translate(cabel_positionXY+[-8,-3.9/2,-6.1]) cube([8,3.9,78.2]);
	translate(cabel_positionXY+[-8,-2.8/2,-16.1]) cube([8,2.7,98.2]);
	translate(cabel_positionXY+[0,0,-6.1]) tube(outer_r=3.8/2,inner_r=0,length=78.2);
}


$fn=50;
cabel_positionXY=[6.25-2,21/2,0];

module tube (outer,thickness,length){
	difference(){
		cylinder(r=outer/2,h=length);
		translate ([0,0,-0.5])
			cylinder(r=outer/2-thickness,h=length+1);
	}
}

difference() {
	union() {
		difference(){
		    minkowski(){
	        	linear_extrude(height=66) polygon(points=[[0,0],[0,21],[11,18],[11,3]]);
		        sphere(r=1.25);
		    }
		    minkowski() {
        		translate([0,0,0])
		            linear_extrude(height=66)
        		        polygon(points=[[0,0],[0,21],[11,18],[11,3]]);
	        	sphere(r=0.5);
		    }
		    translate([-1.3,0,0])
		    cube([2,21,66]);
		}

		translate(cabel_positionXY+[0,0,-6.9]) tube (outer=4.7,thickness=(4.7-3.1)/2,length=6);
		translate(cabel_positionXY+[0,0,-6.9-8.9]) tube (outer=4.7,thickness=(4.7-2.7)/2,length=15-6);
		translate(cabel_positionXY+[0,0,66.9]) tube (outer=4.7,thickness=(4.7-3.1)/2,length=6);
		translate(cabel_positionXY+[0,0,66.9+5.9]) tube (outer=4.7,thickness=(4.7-2.7)/2,length=15-6);
	}

	translate(cabel_positionXY+[-8,-3.1/2,-6.1]) cube([8,3,78.2]);
	translate(cabel_positionXY+[-8,-2.8/2,-16.1]) cube([8,2.7,98.2]);
	translate(cabel_positionXY+[0,0,-6.1]) tube(outer=3.1,thickness=3.1/2,length=78.2);
}


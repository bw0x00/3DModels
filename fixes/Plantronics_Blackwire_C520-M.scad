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
		minkowski(){
	        	linear_extrude(height=66) polygon(points=[[0,0],[0,21],[10,18],[10,3]]);
		        sphere(r=2);
		}
		

		translate(cabel_positionXY+[0,0,-6.9]) tube (outer_r=3,inner_r=2.1,length=6);
		translate(cabel_positionXY+[0,0,-6.9-8.9]) tube (outer_r=3,inner_r=2.7/2,length=15-6);
		translate(cabel_positionXY+[0,0,66.9]) tube (outer_r=3,inner_r=2,length=6);
		translate(cabel_positionXY+[0,0,66.9+5.9]) tube (outer_r=3,inner_r=2.7/2,length=15-6);
	}

	translate(cabel_positionXY+[-8,-2.1,-7.1]) cube([8,4.2,80.2]);
	translate(cabel_positionXY+[-8,-2.2/2,-16.1]) cube([8,2.2,98.2]);
	translate(cabel_positionXY+[0,0,-7.1]) tube(outer_r=4.2/2,inner_r=0,length=80.2);

	minkowski() {
		linear_extrude(height=66)
        		polygon(points=[[0,0],[0,21],[10,18],[10,3]]);
 		sphere(r=0.5);
	}
 	translate([-2.3,0,0]) cube([4,21,66]);

}


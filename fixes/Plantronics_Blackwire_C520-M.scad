$fn=50;
cabel_positionXY=[6.25-2,21/2,0];

module tube (outer,thickness,length){
	difference(){
		cylinder(r=outer,h=length);
		translate ([0,0,-0.5])
			cylinder(r=outer-thickness,h=length+1);
	}
}

difference(){
    minkowski(){
        linear_extrude(height=66) polygon(points=[[0,0],[0,21],[11,18],[11,3]]);
        sphere(r=1);
    }
    minkowski() {
        translate([0,0,0])
            linear_extrude(height=66)
                polygon(points=[[0,0],[0,21],[11,18],[11,3]]);
        sphere(r=0.5);
    }
    translate([-1.25,0,0])
    cube([1.5,21,66]);
}

translate(cabel_positionXY+[0,0,-6.9]) tube (outer=4,thickness=0.5,length=6);
translate(cabel_positionXY+[0,0,66.9]) tube (outer=4,thickness=0.5,length=6);


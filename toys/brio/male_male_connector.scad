$fn=80;

length = 35;
dia = 12.5;
inner_dia=dia/2;
strength = 6.1;
height = 12.4;

module tube(h,r,inner_r,center) {
	difference() {
		cylinder(h=h, r=r, center=center);
		translate([0,0,-0.1]) cylinder(h=h+0.3, r=inner_r, center=center);
	}
}

translate([dia/2,0,0]) tube(h=height,r=dia/2,,inner_r=inner_dia/2,center=true);
translate([length-dia/2,0,0]) tube(h=height,r=dia/2,inner_r=inner_dia/2,center=true);

translate([dia/2+inner_dia/2,-strength/2,-height/2]) cube([length-(dia+inner_dia),strength,height]);

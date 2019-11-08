/*
Case length = 269.875mm
Case width = 110mm
Hipro max thickness = 30mm
Hipro low thickness = 20mm

Case wall thickness = 3mm
*/ 

use <rounded_cubes/round_cube.scad>

module keyboard() {
	length = 270;
	width = 110;
	height = 30;
	// For centering
	translate([length, width, height] * -0.5)
	difference() {
		round_cube([length, width, height], radius=3, $fn=90);
		translate([-2, 0, 15])
		rotate([atan(5/110), 0, 0])
		cube([300, 200, 50]);
	}
}

difference() {
	translate([0, 0, -2.7])
	scale([1.01, 1.04, 1])
	keyboard();
	keyboard();
	}

difference() {
	translate([0, -54, -17.731])
	scale([1.01, 1.2, 1.51])
	scale([1, 1, 1/3])
	intersection() {
		intersection() { 
			translate([-150, -70, 0])
			round_cube([300, 80, 80]);
			rotate([0, 90, 0])
			cylinder(r=30, h=270, center=true, $fn=90);
		}
		scale([1, 1, 3/1.51])
		translate([-135, -60, 0])
		round_cube([270, 80, 80], radius=3, $fn=90);
	}
	keyboard();
}

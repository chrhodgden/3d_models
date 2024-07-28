
module frame_parts (size=1) {
	translate([0, 0, 2.5])
		import("src/frame-waist-v6.stl");
}

translate([0, 0, 0]) 
	rotate([0, 0, 90])
		frame_parts(1);

translate([20, 0, 0]) 
	frame_parts(0.99);


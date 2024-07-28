
use <../supports/runner.scad>;

module frame_parts (size=1) {
	translate([20.5, 10.5, 0]) {
		scale(size) 
			translate([0, 0, 2.5])
				import("src/frame-hips-v3.stl");
		translate([5.5, 10, 0])
			rotate([0, 0, 90])
				scale(size)
					translate([0, 0, 2.5])
						import ("src/frame-waist-v6.stl");
	}
	translate([15, 0, 0]) {
		difference() {
			cube([10, 5, 0.5]);
			translate([10 / 2, 5 / 2 , 0.25])
				linear_extrude(height = 1)
					text(str(size), size = 1, halign = "center", valign = "center");
		}
	}
}

runner(140, 60);

translate([0, 0, 0]) 
	frame_parts(1);

translate([25, 0, 0]) 
	frame_parts(0.99);

translate([50, 0, 0]) 
	frame_parts(0.98);

translate([75, 0, 0]) 
	frame_parts(0.97);

translate([100, 0, 0]) 
	frame_parts(0.96);

translate([0, 30, 0]) 
	frame_parts(0.95);

translate([25, 30, 0]) 
	frame_parts(0.94);

translate([50, 30, 0]) 
	frame_parts(0.93);

translate([75, 30, 0]) 
	frame_parts(0.92);

translate([100, 30, 0]) 
	frame_parts(0.91);



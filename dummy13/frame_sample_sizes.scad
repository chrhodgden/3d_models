
use <../supports/runner.scad>;

module frame_parts (size=1.0) {
	translate([15.5, 7.7, 0])
		scale(size) 
			translate([0, 0, 2.5])
				import("src/frame-hips-v3.stl");
	translate([12, 20, 0])
		scale(size)
			translate([0, 0, 2.5])
				import ("src/frame-waist-v6.stl");
	*translate([18, 28, 0]) {
		difference() {
			cube([10, 5, 0.5]);
			translate([10 / 2, 5 / 2 , 0.25])
				linear_extrude(height = 1)
					text(str(size), size = 2, halign = "center", valign = "center");
		}
	}
}

*runner(60, 37.5, frequency=7.5);

spacing_x = 30;

translate([0*spacing_x, 0, 0]) 
	frame_parts();

translate([1*spacing_x, 0, 0]) 
	frame_parts(0.99);

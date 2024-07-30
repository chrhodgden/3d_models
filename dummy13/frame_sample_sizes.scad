
use <../supports/runner.scad>;

module frame_parts (size=1.0) {
	translate([0, 7.7, 0])
		scale(size)
			translate([0, 0, 2.5])
				import("src/frame-hips-v3.stl");
	translate([0, 20, 0])
		scale(size)
			translate([0, 0, 2.5])
				import ("src/frame-waist-v6.stl");
	translate([6, 28, 0]) {
		difference() {
			cube([10, 5, 0.5]);
			translate([10 / 2, 5 / 2 , 0.25])
				linear_extrude(height = 1)
					text(str(size), size = 2, halign = "center", valign = "center");
		}
	}
}

starting_size = 1.00;
spacing_x = 30;
spacing_y = 37.5;
iterations_x = 5;
iterations_y = 1;

translate([-15.5, 0, 0])
	runner(
		(spacing_x * iterations_x) + 7, 
		spacing_y * iterations_y, 
		spacing=7.5
	);

for (i = [0:iterations_x-1]) {
	translate([i*spacing_x, 0, 0]) 
		frame_parts(starting_size-(i*0.01));
}

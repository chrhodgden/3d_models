
use <../lib/bezier.scad>;

$fn = 100;
base_radius = 7/8;
top_radius = base_radius * 0.75;
top_height = top_radius * 2;
total_height = 10;
stem_height = total_height - top_height;

module stick() {
	cylinder(stem_height + 0.01, base_radius, top_radius);

	control_points = [
		[top_radius, 0],
		[0.25, 0.5],
		[0.4, top_height],
		[0, top_height]
	];
	// adjust curve_facets for low & odd $fn values
	curve_facets = $fn/2;
	head_curve = bezier_curve(control_points, $fn=curve_facets);
	top_curve = concat(head_curve, [[0, 0]]);

	translate([0, 0, stem_height])
		rotate_extrude()
			polygon(top_curve);

	translate([0, 0, total_height-0.5])
		cylinder(r = 0.03);
};

difference() {
	// Base Mold Block
	translate([-1.5, -1.5, 0.01])
		cube([6, 6, total_height]);
	
	// Mold of each stick
	translate([0, 0, 0]) stick();
	translate([3, 0, 0]) stick();
	translate([0, 3, 0]) stick();
	translate([3, 3, 0]) stick();

	// Cut Molds in half
	// Print 2 of these to form full mold	
	translate([-1.51, -1.51, 0])
		cube([6.02, 1.51, total_height + 0.02]);
	translate([-1.51, 3, 0])
		cube([6.02, 1.51, total_height + 0.02]);
};


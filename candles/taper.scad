
use <../lib/bezier.scad>;

$fn = 100;
base_radius = 3/8;
top_radius = base_radius * 0.75;
top_height = top_radius * 2;
total_height = 7.5;
stem_height = total_height - top_height;

cylinder(stem_height, base_radius, top_radius);

control_points = [
	[top_radius, 0],
	[0.125, top_height/4],
	[0.125, top_height/2],
	[0.125, top_height],
	[0, top_height]
];
// adjust curve_facets for low & odd $fn values
curve_facets = $fn/2;
head_curve = bezier_curve(control_points, $fn=curve_facets);
top_curve = concat(head_curve, [[0, 0]]);

translate([0, 0, stem_height])
	rotate_extrude()
		polygon(top_curve);


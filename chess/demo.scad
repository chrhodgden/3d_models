
use <../lib/bezier.scad>;

$fn = 100;

p0 = [0, 0];
p1 = [0.5, 0.5];
pn = [1, 0];

p_set_1 = [p0, p1, pn];

points_list_p1 = bezier_curve(p_set_1, $fn=$fn);

translate([0, 0, 0])
	//rotate_extrude(angle = 360)
		polygon(points_list_p1);

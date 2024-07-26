
use <bezier.scad>;

$fn = 8;

p0 = [0, 0];
p1 = [10, 0];
pb = [1, 5];
pn = [0, 10];

p_set_1 = [p0, p1, pn];
p_set_2 = [p0, p1, pb, pn];

points_list_p1 = bezier_curve(p_set_1);
points_list_p2 = bezier_curve(p_set_2);

translate([0, 0, 0])
	rotate_extrude(angle = 360)
		polygon(points_list_p1);

translate([20, 0, 0])
	rotate_extrude(angle = 360)
		polygon(points_list_p2);

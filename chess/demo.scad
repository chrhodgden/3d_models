// https://youtu.be/tOx5UI8GGns

$fn = 8;

function bezier_3(p0, p1, p2, t) =
	(( 1 - t) ^ 2) * p0
	+ 2 * (1 - t) * t * p1
	+ (t ^ 2) * p2;

function bezier_4(p0, p1, p2, p3, t) =
	(( 1 - t) ^ 3) * p0
	+ 3 * ((1 - t) ^ 2) * t * p1
	+ 3 * (1 - t) * (t ^ 2) * p2
	+ (t ^ 3) * p3;

p0 = [0, 0];
p1 = [10, 0];
p2 = [0, 10];
p3 = [0, 5];

points = $fn;

points_list = [for (i=[0:points]) bezier_3(p0, p1, p2, i/points)];

rotate_extrude(angle = 360)
	polygon(points_list);

points_list_2 = [for (i=[0:points]) bezier_4(p0, p1, p3, p2, i/points)];

translate([20, 0, 0])
	rotate_extrude(angle = 360)
		polygon(points_list_2);

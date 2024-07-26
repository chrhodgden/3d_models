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

function sum(array, index = 0) =
	index < len(array) - 1 ?
	array[index] + sum(array, index + 1) :
	array[index] ;

function factorial(x) = 
	x > 1 ?
	x * factorial(x - 1) :
	1 ;

function binomial_coefficient(degree, index) = 
	factorial(degree) / (factorial(index) * factorial(degree - index)) ;

function bezier_p0(point, degree, index, t) = 
	binomial_coefficient(degree, index) * ((1 - t) ^ (degree - index)) * (t ^ index) * point;

function bezier_p(points, t) =
	[for (i=[1:len(points)-1]) sum(bezier_p0(points[i], len(points)-1, i, t))];
		
function bezier_p_debug(points, t) =
	[for (i=[1:len(points)-2]) sum(bezier_p0(points[i], len(points)+1, i, t))];
		
function de_casteljau(points, t) = 
    len(points) == 1 ?
	points[0] : 
    de_casteljau(
		[for (i = [0:len(points)-2]) (1 - t) * points[i] + t * points[i + 1]], 
		t
	) ;

function bezier_curve(points, $fn=$fn) = 
    [for (i = [0:$fn]) de_casteljau(points, i / $fn)] ;

p0 = [0, 0];
p1 = [10, 0];
pb = [1, 5];
pn = [0, 10];

points = $fn;

points_list = [for (i=[0:points]) bezier_3(p0, p1, pn, i/points)];

//rotate_extrude(angle = 360)
	polygon(points_list);

points_list_2 = [for (i=[0:points]) bezier_4(p0, p1, pb, pn, i/points)];

translate([20, 0, 0])
	//rotate_extrude(angle = 360)
		polygon(points_list_2);

p_set_1 = [p0, p1, pn];
p_set_2 = [p0, p1, pb, pn];

points_list_p1 = bezier_curve(p_set_1);
points_list_p2 = [for (i=[0:$fn]) bezier_p(p_set_2, i/$fn)];
points_list_p2d = bezier_curve(p_set_2);

for (i=[0:$fn]) {
	echo("i", i, bezier_p(p_set_2, i/$fn));
	echo("i", i, bezier_p_debug(p_set_2, i/$fn));
	for (j=[1:len(p_set_2[0])]) {
		echo("j", j, sum(bezier_p0(p_set_2[j], len(p_set_2[j]), j, i/$fn)));
		echo("j", j, bezier_p0(p_set_2[j], len(p_set_2[j]), j, i/$fn));
	}
}

//echo(points_list);
//echo(points_list_p1);
echo(points_list_2);
echo(points_list_p2d);
echo(points_list_p2);

translate([0, 20, 0])
	//rotate_extrude(angle = 360)
		polygon(points_list_p1);

translate([20, 20, 0])
	//rotate_extrude(angle = 360)
		polygon(points_list_p2d);

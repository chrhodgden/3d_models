function bezier(points, t) = 
    len(points) == 1 ? points[0] : 
    bezier([for (i = [0:len(points)-2]) 
        (1 - t) * points[i] + t * points[i + 1]], t);

function bezier_curve(points, $fn=$fn) = 
    [for (i = [0:$fn]) bezier(points, i / $fn)];

points = [[0, 0], [10, 0], [1, 5], [20, 1], [0, 10]];
$fn = 100;
	
curve = bezier_curve(points);

polygon(curve);

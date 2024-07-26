function bezier(points, t) = 
    len(points) == 1 ? points[0] : 
    bezier([for (i = [0:len(points)-2]) 
        (1 - t) * points[i] + t * points[i + 1]], t);

function bezier_curve(points, steps) = 
    [for (i = [0:steps]) bezier(points, i / steps)];

points = [[0, 0], [10, 0], [1, 5], [0, 10]];
steps = 100;
curve = bezier_curve(points, steps);

polygon(curve);

// alt

points2 = [[0, 0, 0], [10, 0, 5], [1, 5, 10], [0, 10, 15]];
// steps = 100;
curve2 = bezier_curve(points2, steps);

polyhedron(points=curve2, faces=[[for (i=[0:len(curve2)-2]) [i, i+1]]]);

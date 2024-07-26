
function de_casteljau(points, t) = 
	len(points) == 1 ?
	points[0] : 
	de_casteljau(
		[for (i = [0:len(points)-2]) (1 - t) * points[i] + t * points[i + 1]], 
		t
	) ;

function bezier_curve(points, $fn=$fn) = 
	[for (i = [0:$fn]) de_casteljau(points, i / $fn)] ;


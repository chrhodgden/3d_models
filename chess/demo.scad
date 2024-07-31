
$fn = 8;

difference () {
	cylinder(1.4, r=1.7);

	translate([0, 0, 0.5])
		rotate_extrude(angle = 360)
			translate([1.6, 0, 0])
				circle(r=1);

	rotate_extrude(angle = 360)
		translate([1.5, 0, 0]) 
			rotate([0, 0, 90])
				difference() {
					square(1.5);
					circle(r=1.5);
				}

	for (i = [1:8]) {
		rotate([0, 0, 45*i])
			translate([0.75, 0.75, 1.65])
				rotate([0, -75, 45])
					sphere(0.75, $fn=4);
	}		
}


translate([0, 0, 1.25])
	sphere(r=0.5);

translate([0, 0, 1.85])
	sphere(r=0.15);

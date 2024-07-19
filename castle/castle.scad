
module tower (coord) {
	translate(coord) {
		rotate([0, 0, (360/8)/2]) {
			cylinder(11, 2.5, 2.5, $fn=8);
			translate([0, 0, 10])
				cylinder(2, 3, 3, $fn=8);
		}
	}
}

// towers blue
tower([0, 0, 0]);
tower([20, 0, 0]);
tower([0, 20, 0]);
tower([20, 20, 0]);

//walls are red
translate ([0, -1, 0]) 
	cube([20, 2, 7.5]);
translate ([0, 19, 0]) 
	cube([20, 2, 7.5]);
translate ([-1, 0, 0]) 
	cube([2, 20, 7.5]);
translate ([19, 0, 0]) 
	cube([2, 20, 7.5]);

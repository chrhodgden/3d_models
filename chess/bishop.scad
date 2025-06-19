
// FIDE Standards have some flexibility
// https://www.fide.com/FIDE/handbook/Standards_of_Chess_Equipment_and_tournament_venue.pdf
// FIDE Handbook C.02.2.2 Height,weight,proportions
// 	- King – 9.5 cm, 
// 	- Queen – 8.5 cm, 
// 	- Bishop – 7 cm, 
// 	- Knight – 6 cm, 
// 	- Rook – 5.5 cm and 
// 	- Pawn – 5 cm. 
// 	- The diameter of the piece's base should measure 40- 50% of its height.
// 	- These dimensions may differ up to 10% from the above recommendation,
// 		- but the order (e.g. King is higher than Queen etc.) must be kept.
// We are going to transgress C.02.2.3
// FIDE Handbook C.02.3.2 Size of the square and the board
// 	- The side of the square should measure 5 to 6 cm. 
// 	- Referring to 2.2 the side of a square should be at least twice the diameter of a pawn’s base (it means four paws on one square).

use <../lib/bezier.scad>;

$fn = 8;
total_height = 7;
base_diameter = total_height / 2;
base_radius = base_diameter / 2;
base_height = 1;
stem_radius = base_radius / 4;
stem_base_radius = base_radius / 2;
head_radius = 1;
head_height = 1;
stem_height = total_height - base_height - head_height - 1.2;

// collar_check enables collar
collar_check = 1;
collar_radius = 1 * collar_check;
collar_height = 0.5 * collar_check;

// Base
cylinder(base_height/2, base_radius, base_radius);
translate([0, 0, base_height/2]) 
	cylinder(base_height, base_radius, 0);

// Stem
translate([0, 0, base_height])
	cylinder(stem_height, stem_base_radius, stem_radius);

// Collar
translate([0, 0, total_height - (head_height*2.25) - (collar_height*0.75)])
	cylinder(collar_height/2, 0, collar_radius);
translate([0, 0, total_height - (head_height*2.25) - (collar_height*0.25)])
	cylinder(collar_height/2, collar_radius, 0);

// Head
control_points = [
	[0, 0],
	[0.75, 0],
	[0, head_height]
];
// adjust curve_facets for low & odd $fn values
curve_facets = $fn/2;
head_curve = bezier_curve(control_points, $fn=curve_facets);

difference() {
	translate([0, 0, total_height - 2.5 * head_radius])
		scale(2.25)
			rotate([0, 0, 180])
				rotate_extrude()
					polygon(head_curve);

	// Notch
	translate([0, base_radius, 5.5])
		rotate([45, 0, -90])
			cube([base_diameter, base_diameter, 0.1]);
}

// Point
translate([0, 0, 6.75])
	sphere(0.25);



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
total_height = 8.5;
base_diameter = total_height / 2;
base_radius = base_diameter / 2;
base_height = 1;
stem_radius = base_radius / 4;
stem_base_radius = base_radius / 2;
head_radius = 1;
head_height = 1.75;
crown_height = 0.75;
stem_height = total_height - base_height - head_height - crown_height;

// collar_check enables collar
collar_check = 1;
collar_radius = head_radius * collar_check;
collar_height = 1 * collar_check;

// Base
cylinder(base_height/2, base_radius, base_radius);
translate([0, 0, base_height/2]) 
	cylinder(base_height, base_radius, 0);

// Stem
translate([0, 0, base_height])
	cylinder(stem_height, stem_base_radius, stem_radius);

// Collar
translate([0, 0, stem_height + base_height - (collar_height/2)])
	cylinder(collar_height/2, 0, collar_radius);
translate([0, 0, stem_height + base_height])
	cylinder(collar_height/2, collar_radius, 0);

// Head
translate([0, 0, total_height - head_height - crown_height])
	cylinder(head_height, stem_radius, head_radius);

// Cap
translate([0, 0, total_height - head_radius])
	sphere(head_radius * 0.75);

// Point
translate([0, 0, 8.25])
	sphere(0.25);


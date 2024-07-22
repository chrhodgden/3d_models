
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

$fn = 8;
total_height = 5;
h = total_height;
base_diameter = h / 2;
bd = base_diameter;
base_radius = bd / 2;
br = base_radius;
stem_radius = br / 4;
sr = stem_radius;
head_radius = 1;

cylinder(1/2, br, br);
translate([0, 0, 1/2]) 
	cylinder(1/2, br, br / 2);
cylinder(4, sr, sr);
translate([0, 0, 4])
	sphere(head_radius);


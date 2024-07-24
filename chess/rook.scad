
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
total_height = 5.5;
base_diameter = total_height / 2;
base_radius = base_diameter / 2;

// How is the base height dependent on piece height?
base_height = 1;

// The rook has a wider stem
stem_radius = base_radius / 2;
stem_base_radius = base_radius * (3/4);

// I like several different low poly designs for the castle ridges
// I like the ridge going over the corner
// I also like the simplicity of every other face having a ridge
head_radius = 1;
head_height = 1;
stem_height = total_height - base_height - (head_height / 2);

// Can set ridge_count to a coefficient or ratio of $fn or a static number
ridge_count = $fn/2;
ridge_angle_1 = 360 / ridge_count;
ridge_angle_2 = (360 / ridge_count) / 2;
ridge_angle_4 = (360 / ridge_count) / 4;

// ridge_offset will set the ridges to go over the corners
ridge_offset_check = 0;
ridge_offset = ridge_offset_check * -ridge_angle_4;

// Base
cylinder(base_height/2, r = base_radius);
translate([0, 0, base_height/2]) 
	cylinder(base_height/2, base_radius, stem_base_radius);

// Column
translate([0, 0, base_height])
	cylinder(stem_height, stem_base_radius, stem_radius);

// Head
difference() {
	translate([0, 0, total_height - head_height])
		cylinder(head_height, r = head_radius);
	
	// Ridges
	translate([0, 0, total_height - (head_height/4)]) {
		cylinder(head_height, r = head_radius * 0.75);
		for (i = [1:ridge_count]) {
			rotate([0, 0, (i * ridge_angle_1) - ridge_offset])
				rotate_extrude(angle = ridge_angle_2)
					square([head_radius + 0.25, head_height]);
		}		
	}
}

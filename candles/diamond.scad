
face_diagonal = sqrt(2);
cube_diagonal = sqrt((face_diagonal^2)+1);
angle = asin(face_diagonal/cube_diagonal);
point_height_1 = cos(angle);
point_height_2 = (cube_diagonal-(2*point_height_1));

module diamond(vertical_position=0) {
	rotate([0, 0, vertical_position*60])
	scale([1, 1, 2])
	translate([0, 0, vertical_position * point_height_2])
	translate([0, 0, -point_height_1])
	rotate(angle, [1, -1, 0])
	cube();
}

difference() {
	diamond(0);
	translate([-2, -2, -2])
		cube([4, 4, 2]);
}
diamond(1);
diamond(2);
diamond(3);
diamond(4);
diamond(5);
diamond(6);
diamond(7);


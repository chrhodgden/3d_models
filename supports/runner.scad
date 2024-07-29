
/*
This file is used in models found in this repository.
Copyright (C) 2024 Christian Hodgden

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

/*
This file can be used in an openscad file with `use`.
```OpenSCAD
	use <runner.scad>;
	runner(200, 300);
```

This file can be called directly on the command line passing specified arguments.
```shell
openscad runner.scad -D 'length=200' -D 'width=300' -o runner.stl
```

This file can also be copied, edited, and compiled with the desired arguments.
*/

// OpenSCAD's default unit is millimeter
module runner (length, width, spacing=10, thickness=1, height=0.1) {
	for (i = [0:spacing:width]) {
		translate([0, i, 0])
			cube([length+thickness, thickness, height]);
	}
	for (i = [0:spacing:length]) {
		translate([i, 0, 0])
			cube([thickness, width+thickness, height]);
	}
	translate([0, width, 0])
		cube([length+thickness, thickness, height]);
	translate([length, 0, 0])
		cube([thickness, width+thickness, height]);
}

length = 150;
width = 100;
spacing = 10;
thickness = 1;
height = 0.1;

runner(
	length = length,
	width = width,
	spacing = spacing,
	thickness = thickness,
	height = height
);


use <../lib/runner.scad>;

// OpenSCAD's default unit is millimeter

length = 100;
width = 150;
frequency = 10;
thickness = 1;
height = 0.1;

runner(
	length = length,
	width = width,
	frequency = frequency,
	thickness = thickness,
	height = height
);

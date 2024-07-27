
/*
This file is used in models found in this repository.
Copyright (C) 2024 Christian Hodgden

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

function de_casteljau(points, t) = 
	len(points) == 1 ?
	points[0] : 
	de_casteljau(
		[for (i = [0:len(points)-2]) (1 - t) * points[i] + t * points[i + 1]], 
		t
	) ;

function bezier_curve(points, $fn=$fn) = 
	[for (i = [0:$fn]) de_casteljau(points, i / $fn)] ;

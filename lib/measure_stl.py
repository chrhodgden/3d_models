#!/usr/bin/python3

# This file is used in models found in this repository.
# Copyright (C) 2024 Christian Hodgden
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU Lesser General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

from stl import mesh

file_path = './candles/diamond.stl'
model_mesh = mesh.Mesh.from_file(file_path)

x_min = model_mesh.x.min()
x_max = model_mesh.x.max()
y_min = model_mesh.y.min()
y_max = model_mesh.y.max()
z_min = model_mesh.z.min()
z_max = model_mesh.z.max()
length = x_max - x_min
width = y_max - y_min
height = z_max - z_min

volume, cog, inertia = model_mesh.get_mass_properties()

print(f'measurements of {file_path.split("/")[-1]}')
print(f'x range:	{x_min}, {x_max}: {length}')
print(f'y range:	{y_min}, {y_max}: {width}')
print(f'z range:	{z_min}, {z_max}: {height}')
print(f'Volume:	{volume} cubic units')
print(f'Center of Gravity:	{cog}')
print(f'Inertia Matrix:	{inertia}')


# adapted from new_edge_coords... .js

static func edge_tile_northern_hem_left(map_size, section_size, x_in, y_in, map_width, out_of_map_bounds_redirect):
	var section_row = ceil(float(y_in) / float(section_size))
	section_row = int(section_row)
	var section_gap
	var y_in_diff = section_size - y_in % section_size
	
	match (section_row):
		1:
			section_gap = map_size - 2
		2:
			section_gap = map_size - 4
		3:
			section_gap = map_size - 6
		4:
			section_gap = map_size - 8
		5:
			section_gap = map_size - 10
		6:
			section_gap = map_size - 12
		7:
			section_gap = map_size - 14
		8:
			section_gap = map_size - 16
		9:
			section_gap = map_size - 18
		10:
			section_gap = map_size - 20
		11:
			section_gap = map_size - 22
		12:
			section_gap = map_size - 24
		13:
			section_gap = map_size - 26
		14:
			section_gap = map_size - 28
		15:
			section_gap = map_size - 30
		16:
			section_gap = map_size - 32

	var section_gap_tiles = section_gap * section_size
	var x_out = x_in - section_gap_tiles - y_in_diff - 1
	var y_out = y_in + y_in_diff + 1
	# correcting for bottom left tiles (ex. for map_size = 2: 401, 100)
	if x_in % section_size == 1 && y_in % section_size == 0:
		x_out += section_size
		y_out -= section_size
		
	x_out = out_of_map_bounds_redirect.out_of_map_bounds_redirect(x_out, map_width)

#	print("input: ", x_in, ", ", y_in)
#	print("output: ", x_out, ", ", y_out)

	return [x_out, y_out]

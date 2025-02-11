-- mods/australia/biome_murray_darling_basin.lua

local biome_name = "murray_darling_basin"
local node_top = "default:dirt_with_dry_grass"

minetest.register_biome({
	name = biome_name,
	--node_dust = "",
	node_top = node_top,
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	node_river_water = "australia:muddy_river_water_source",
	y_min = 36,
	y_max = aus.biome_ymax(),
	heat_point = 60,
	humidity_point = 40,
})



--
-- Register ores
--

-- All mapgens except singlenode
-- Blob ore first to avoid other ores inside blobs



--
-- Decorations
--

	-- Grasses
aus.biome_register_grass_decorations(
	{
		{0.015,  0.045, 2},
		{0.03,   0.03,  1},
	},
	biome_name, node_top, "default:grass_", 36, 200
)

	-- Dry grasses
aus.biome_register_grass_decorations(
	{
		{0.01, 0.05,  5},
		{0.03, 0.03,  4},
		{0.05, 0.01,  3},
		{0.07, -0.01, 2},
		{0.09, -0.03, 1},
	},
	biome_name, node_top, "default:dry_grass_", 36, 200
)


	-- Darling Lily
minetest.register_decoration({
	deco_type = "simple",
	place_on = {node_top},
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {biome_name},
	y_min = 36,
	y_max = 200,
	decoration = "australia:darling_lily",
})

	-- Saltbush
minetest.register_decoration({
	deco_type = "simple",
	place_on = {node_top},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {biome_name},
	y_min = 36,
	y_max = 200,
	decoration = "australia:saltbush",
})

	-- Silver Daisy
minetest.register_decoration({
	deco_type = "simple",
	place_on = {node_top},
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {biome_name},
	y_min = 36,
	y_max = 200,
	decoration = "australia:silver_daisy",
})



--
-- Logs
--

	-- River Red Gum Log
minetest.register_decoration({
	deco_type = "schematic",
    -- @@@ Josselin2
--	place_on = {"dirt_with_dry_grass"},
	place_on = {"default:dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.0018,
		scale = 0.0011,
		spread = {x = 250, y = 250, z = 250},
		seed = 33,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"murray_darling_basin"},
	y_min = 36,
	y_max = 170,
	schematic = {
		size = {x = 3, y = 3, z = 1},
		data = {
			{name = "air", prob = 0},
			{name = "air", prob = 0},
			{name = "air", prob = 0},
			{name = "australia:river_red_gum_tree", param2 = 12, prob = 191},
			{name = "australia:river_red_gum_tree", param2 = 12},
			{name = "australia:river_red_gum_tree", param2 = 12, prob = 127},
			{name = "air", prob = 0},
			{name = "flowers:mushroom_brown", prob = 63},
			{name = "air", prob = 0},
		},
	},
	flags = "place_center_x",
	rotation = "random",
})



--
-- Trees
--

	-- Black Box
aus.register_schem_to_biome("black_box_tree", biome_name, {
	place_on = {node_top},
	y_min = 36,
	y_max = 150,
	fill_ratio_divisor = 15000,
})
	-- Black Wattle
aus.register_schem_to_biome("black_wattle_tree", biome_name, {
	place_on = {node_top},
	y_min = 36,
	y_max = 150,
	fill_ratio_divisor = 15000,
})

	-- Coolabah Tree
aus.register_schem_to_biome("coolabah_tree", biome_name, {
	place_on = {node_top},
	y_min = 36,
	y_max = 140,
	fill_ratio_divisor = 20000,
})

	-- Golden Wattle
aus.register_schem_to_biome("golden_wattle_tree", biome_name, {
	place_on = {node_top},
	y_min = 36,
	y_max = 150,
	fill_ratio_divisor = 15000,
})

	-- Desert Quandong
aus.register_schem_to_biome("quandong_tree", biome_name, {
	place_on = {node_top},
	y_min = 36,
	y_max = 150,
	fill_ratio_divisor = 15000,
})

	-- River Red Gum
aus.register_schem_to_biome("river_red_gum_tree", biome_name, {
	place_on = {node_top},
	y_min = 36,
	y_max = 140,
	fill_ratio_divisor = 10000,
})

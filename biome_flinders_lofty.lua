-- mods/australia/biome_flinders_lofty.lua

local biome_name = "flinders_lofty"
local node_top = "default:dirt_with_dry_grass"

minetest.register_biome({
	name = biome_name,
	--node_dust = "",
	node_top = node_top,
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	node_river_water = "australia:muddy_river_water_source",
	y_min = 36,
	y_max = aus.biome_ymax() + 5,
	heat_point = 50,
	humidity_point = 50,
})



--
-- Register ores
--

-- All mapgens except singlenode
-- Blob ore first to avoid other ores inside blobs

	-- Copper
minetest.register_ore({
	ore_type        = "blob",
	ore             = "default:stone_with_copper",
	wherein         = {"default:stone"},
	clust_scarcity  = 48 * 48 * 48,
	clust_size      = 8,
	biomes          = {"flinders_lofty"},
	y_min           = -64,
	y_max           = 64,
	noise_threshold = 1,
	noise_params    = {
		offset = 0,
		scale = 3,
		spread = {x = 16, y = 16, z = 16},
		seed = 892,
		octaves = 3,
		persist = 0.6
	},
})


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
	biomes = {"flinders_lofty"},
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

	-- Black Wattle
aus.schematics.black_wattle_tree = {}
local max_r = 6
local ht = 8
local fruit = nil
local limbs = false
local tree = "australia:black_wattle_tree"
local leaves = "australia:black_wattle_leaves"
for r = 5,max_r do
	local schem = aus.generate_tree_schematic(4, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.black_wattle_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_dry_grass"},
		y_min = 36,
		y_max = 170,
		fill_ratio = (max_r-r+1)/15000,
		biomes = {"flinders_lofty"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- Australian Cherry
aus.schematics.cherry_tree = {}
local max_r = 3
local fruit = "australia:cherry"
local tree = "australia:cherry_tree"
local leaves = "australia:cherry_leaves"
for r = 2,max_r do
	local schem = aus.generate_conifer_schematic(3, r, tree, leaves, fruit)
	table.insert(aus.schematics.cherry_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_dry_grass"},
		y_min = 36,
		y_max = 120,
		fill_ratio = (max_r-r+1)/15000,
		biomes = {"flinders_lofty"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- Coolabah Tree
aus.register_schem_to_biome("coolabah_tree", biome_name, {
	place_on = {node_top},
	y_min = 36,
	y_max = 140,
	fill_ratio = 15000,
})


	-- Golden Wattle
aus.schematics.golden_wattle_tree = {}
local max_r = 3
local ht = 3
local fruit = nil
local limbs = false
local tree = "australia:golden_wattle_tree"
local leaves = "australia:golden_wattle_leaves"
for r = 2,max_r do
	local schem = aus.generate_tree_schematic(2, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.golden_wattle_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_dry_grass"},
		y_min = 36,
		y_max = 170,
		fill_ratio = (max_r-r+1)/12000,
		biomes = {"flinders_lofty"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- River Red Gum
aus.schematics.river_red_gum_tree = {}
local max_r = 13
local ht = 13
local fruit = nil
local limbs = nil
local tree = "australia:river_red_gum_tree"
local leaves = "australia:river_red_gum_leaves"
for r = 10,max_r do
	local schem = aus.generate_giant_tree_schematic(7, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.river_red_gum_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_dry_grass"},
		y_min = 36,
		y_max = 140,
		fill_ratio = (max_r-r+1)/20000,
		biomes = {"flinders_lofty"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- Sugar Gum
aus.schematics.sugar_gum_tree = {}
local max_r = 11
local ht = 10
local fruit = nil
local limbs = nil
local tree = "australia:sugar_gum_tree"
local leaves = "australia:sugar_gum_leaves"
for r = 9,max_r do
	local schem = aus.generate_tree_schematic(8, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.sugar_gum_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_dry_grass"},
		y_min = 36,
		y_max = 150,
		fill_ratio = (max_r-r+1)/10000,
		biomes = {"flinders_lofty"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end


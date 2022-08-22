-- mods/australia/biome_pilbara.lua

local biome_name = "pilbara"
local node_top = "australia:red_gravel"

minetest.register_biome({
	name = biome_name,
	--node_dust = "",
	node_top = node_top,
	depth_top = 2,
	node_filler = "australia:red_stone",
	depth_filler = 2,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	node_river_water = "australia:muddy_river_water_source",
	y_min = 4,
	y_max = 35,
	heat_point = 80,
	humidity_point = 20,
})



--
-- Register ores
--

-- All mapgens except singlenode
-- Blob ore first to avoid other ores inside blobs

	-- Iron
minetest.register_ore({
	ore_type        = "blob",
    -- @@@ Josselin2
--	ore             = "air",
	ore             = "default:stone_with_iron",
	wherein         = {"default:stone"},
	clust_scarcity  = 24 * 24 * 24,
	clust_size      = 8,
	biomes          = {"pilbara"},
	y_min           = -64,
	y_max           = 35,
	noise_threshold = 1,
	noise_params    = {
		offset = 0,
		scale = 3,
		spread = {x = 16, y = 16, z = 16},
		seed = 895,
		octaves = 3,
		persist = 0.6
	},
})



--
-- Decorations
--

	-- Dry grasses
aus.biome_register_grass_decorations(
	{
		{0.07, -0.01, 2},
		{0.09, -0.03, 1},
	},
	biome_name, node_top, "default:dry_grass_", 5, 31000
)


	-- Mitchell Grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {node_top},
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {biome_name},
	y_min = 6,
	y_max = 31000,
	decoration = "australia:mitchell_grass",
})

	-- Spinifex
minetest.register_decoration({
	deco_type = "simple",
	place_on = {node_top},
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {biome_name},
	y_min = 8,
	y_max = 31000,
	decoration = "australia:spinifex",
})



--
-- Trees
--

	-- Desert Oak
aus.schematics.desert_oak_tree = {}
local max_r = 8
local ht = 5
local fruit = nil
local limbs = nil
local tree = "australia:desert_oak_tree"
local leaves = "australia:desert_oak_leaves"
for r = 6,max_r do
	local schem = aus.generate_tree_schematic(6, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.desert_oak_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"australia:red_gravel"},
		y_min = 10,
		y_max = 35,
		fill_ratio = (max_r-r+1)/20000,
		biomes = {"pilbara"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end


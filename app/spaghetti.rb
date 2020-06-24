# Junk file used to just test and break stuff

# Render Tile takes the rows and columns and multiples them by yhe tile size to generate a tile.
# def render_tile args, row, col, *color
#     args.outputs.solids << [(row * args.state.tile_size),  (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, [0, 0, 0, 255]]

#     args.outputs.borders << [(row * args.state.tile_size),  (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, [0, 0, 0, 255]]

#     # tile_x = (1280 - (args.state.grid_size * args.state.tile_size)) / 2
#     # tile_y = (720 - ((args.state.grid_size-2) * args.state.tile_size)) / 2

#     # args.outputs.solids << [tile_x + (row * args.state.tile_size), (720 - tile_y) - (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, [0, 0, 0, 255]]

#     # args.outputs.borders << [tile_x + (row * args.state.tile_size), (720 - tile_y) - (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, [0, 0, 0, 255]]

#     # args.outputs.solids << [row, col, args.state.tile_size, args.state.tile_size, r, g, b, a]
# end

# def render_grid_border args
#     row = -1
#     col = -1
#     size = args.state.grid_size
#     color = [50, 50, 50]

#     for i in row..(row + size) - 1 do
#         render_tile args, i, col, *color
#         render_tile args, i, (col + size) - 1, *color
#     end

#     for i in row..(col + size) - 1 do
#         render_tile args, row, i, *color
#         render_tile args, (row + size) - 1, i, *color
#     end
# end

# Render the grid 
# def render_grid args 
#     args.state.rows.times do |row|
#         args.state.cols.times do |col|
#             render_sprite args, (row * 64), (col * 64), "images/grass.png"
#             args.outputs.borders << [(row * args.state.tile_size),  (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, 142, 209, 79, 255]
#         end
#     end
# end
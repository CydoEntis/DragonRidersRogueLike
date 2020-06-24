# def init args 
#     args.state.grid = []
#     args.state.tile_size ||= 64
#     args.state.grid_size ||= 9
#     args.state.rows ||= 20
#     args.state.cols ||= 10
#     # args.state.player_x ||= (1280 - 64) / 2
#     # args.state.player_y ||= (720 - 64) / 2
#     args.state.player_x ||= 0
#     args.state.player_y ||= 0
#     # args.state.player_pos ||= args.state.grid[4][4]
#     # setup_grid args
# end

# def player_controller args
#     if args.inputs.keyboard.key_down.up 
#         args.state.player_y += 64
#     end

#     if args.inputs.keyboard.key_down.down
#         args.state.player_y -= 64
#     end

#     if args.inputs.keyboard.key_down.left 
#         args.state.player_x -= 64
#      end

#     if args.inputs.keyboard.key_down.right
#         args.state.player_x += 64
#     end

#     render_sprite args, args.state.player_x, args.state.player_y, "images/barbarian.png"
# end

# def render_sprite args, x_pos, y_pos, sprite
#     args.outputs.sprites << [(x_pos * args.state.tile_size), (y_pos * args.state.tile_size), args.state.tile_size, args.state.tile_size, sprite]
# end

# # Setup the initialize grid
# def setup_grid args
#     # for row in 0..args.state.grid_size do
#     #     args.state.grid[row] = []
#     #     for col in 0..args.state.grid_size do
#     #         args.state.grid[row][col] = 0
#     #     end
#     # end
#     args.state.grid = args.state.grid_size.map do 
#         args.state.grid_size.map { 0 } 
#     end
# end

# # Render Tile
# def render_tile args, row, col, r, g, b, a=255
#     args.outputs.solids << [(row * args.state.tile_size),  (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, r, g, b, a]

#     args.outputs.borders << [(row * args.state.tile_size),  (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, 0, 0, 0, 255]

#     # tile_x = (1280 - (args.state.grid_size * args.state.tile_size)) / 2
#     # tile_y = (720 - ((args.state.grid_size-2) * args.state.tile_size)) / 2
#     # args.outputs.solids << [tile_x + (row * args.state.tile_size), (720 - tile_y) - (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, r, g, b, a]

#     # args.outputs.borders << [tile_x + (row * args.state.tile_size), (720 - tile_y) - (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, 0, 0, 0, 255]

#     # args.outputs.solids << [row, col, args.state.tile_size, args.state.tile_size, r, g, b, a]
# end

# # def render_grid_border args
# #     row = -1
# #     col = -1
# #     size = args.state.grid_size + 2
# #     color = [50, 50, 50]

# #     for i in row..(row + size) - 1 do
# #         render_tile args, i, col, *color
# #         render_tile args, i, (col + size) - 1, *color
# #     end

# #     for i in row..(col + size) - 1 do
# #         render_tile args, row, i, *color
# #         render_tile args, (row + size) - 1, i, *color
# #     end
# # end

# # Render the grid 
# def render_grid args 
#     args.state.rows.times do |row|
#         args.state.cols.times do |col|
#             # render_tile args, row, col, 120, 207, 50, 255
#             render_sprite args, row, col, "images/grass.png"
#             args.outputs.borders << [(row * args.state.tile_size),  (col * args.state.tile_size), args.state.tile_size, args.state.tile_size, 0, 0, 0, 255]
#         end
#     end

#     # for row in 0..args.state.grid_size-1 do
#     #     for col in 0..args.state.grid_size-1 do
#     #         # render_tile args, row, col, rand(255), rand(255), rand(255), 255
#     #         render_tile args, row, col, 120, 207, 50, 255
#     #     end
#     # end
# end

# # Generate a blank background -- "Off white color"
# def render_background args
#     args.outputs.solids << [0, 0, 1280, 720, 255, 250, 240, 255]
# end

# # Main part of the program
# def tick args
#     # args.outputs.background_color = [0, 0 ,0] 
#     init args
#     render_background args
#     render_grid args
#     player_controller args
# end
# Temp place for classes.
class Tile
    def initialize x, y, sprite, solid
        @x = x
        @y = y
        @sprite = sprite
        @solid = solid
    end

    def serialize 
        { }
    end

    def inspect 
        seriealize.to_s
    end

    def to_s
        serialize.to_s
    end

    def render_tile args
        args.outputs.sprites << [@x * 80, @y * 80, 80, 80, @sprite]
    end
end

class Floor < Tile
    def initialize x, y
        super(x, y, "images/grass.png", true)
    end

    def serialize 
        { }
    end

    def inspect 
        seriealize.to_s
    end

    def to_s
        serialize.to_s
    end
end

class Wall < Tile
    def initialize x, y
        super(x, y, "images/water-secondary.png", false)
    end

    def serialize 
        { }
    end

    def inspect 
        seriealize.to_s
    end

    def to_s
        serialize.to_s
    end
end

class Game 
    def initialize args
        args.state.grid = []
        args.state.tile_size ||= 80
        args.state.grid_size ||= 9
        setup_level(args)
    end

    def serialize 
        { }
    end

    def inspect 
        seriealize.to_s
    end

    def to_s
        serialize.to_s
    end

    def generate_tiles args
        for i in 0..args.state.grid_size do
            args.state.tiles[i] = []
            for j in 0..args.state.grid_size do
                if rand(0) < 0.3 || !in_bounds(args, i, j)
                    args.state.tiles[i][j] = Wall.new(i, j)
                else
                    args.state.tiles[i][j] = Floor.new(i, j)
                end
            end
        end
    end
    
    def in_bounds args, x, y
        return x > 0 && y > 0 && x < args.state.grid_size - 1 && y < args.state.grid_size - 1;
    end
    
    def get_tile args, x, y 
        if(in_bounds(args, x, y))
            return args.state.tiles[x][y]
        else
            return Wall.new(x, y)
        end
    end
    
    def render_level args
        for i in 0..args.state.grid_size do
            for j in 0..args.state.grid_size do
                get_tile(args, i, j).render_tile(args)
            end
        end
    end

    def setup_level args
        generate_tiles args
        
    end

    def tick args
        render_level args
    end
end

def init args 
    # args.state.grid = []
    args.state.tile_size ||= 80
    args.state.grid_size ||= 9
    args.state.player_x ||= 0
    args.state.player_y ||= 0

    # render_background args  
    # setup_grid args
end

def player_controller args
    if args.inputs.keyboard.key_down.up 
        args.state.player_y += 80
    end

    if args.inputs.keyboard.key_down.down
        args.state.player_y -= 80
    end

    if args.inputs.keyboard.key_down.left 
        args.state.player_x -= 80
     end

    if args.inputs.keyboard.key_down.right
        args.state.player_x += 80
    end

    # Render the player.
    render_sprite args, args.state.player_x, args.state.player_y, "images/barbarian.png"
end

def render_sprite args, x, y, sprite
    args.outputs.sprites << [x, y, args.state.tile_size, args.state.tile_size, sprite]
end

# Setup the initialize grid
# def setup_grid args
#     args.state.grid = args.state.grid_size.map do 
#         args.state.grid_size.map { 0 } 
#     end
# end

# def generate_tiles args
#     for i in 0..args.state.grid_size do
#         args.state.tiles[i] = []
#         for j in 0..args.state.grid_size do
#             if rand(0) < 0.3 || !in_bounds(args, i, j)
#                 args.state.tiles[i][j] = Wall.new(i, j)
#             else
#                 args.state.tiles[i][j] = Floor.new(i, j)
#             end
#         end
#     end
# end

# def setup_level args
#     generate_tiles args
#     render_level args
# end

# def in_bounds args, x, y
#     return x > 0 && y > 0 && x < args.state.grid_size - 1 && y < args.state.grid_size - 1;
# end

# def get_tile args, x, y 
#     if(in_bounds(args, x, y))
#         return args.state.tiles[x][y]
#     else
#         return Wall.new(x, y)
#     end
# end

# def render_level args
#     for i in 0..args.state.grid_size do
#         for j in 0..args.state.grid_size do
#             get_tile(args, i, j).render_tile(args)
#         end
#     end
# end


# Generate a blank background -- "Off white color"
def render_background args
    args.outputs.solids << [0, 0, 1280, 720, 255, 250, 240, 255]
end


# setup_level args

# Main part of the program
def tick args
    args.state.game ||= Game.new(args)
    args.state.game.tick(args)
    init args
    player_controller args
end



def init args 
    args.state.grid = []
    args.state.tile_size ||= 80
    args.state.rows ||= 9
    args.state.cols ||= 9
    args.state.player_x ||= 0
    args.state.player_y ||= 0
    args.state.tiles ||= [];
    setup_grid args
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

    render_sprite args, args.state.player_x, args.state.player_y, "images/barbarian.png"
end

def render_sprite args, x, y, sprite
    args.outputs.sprites << [x, y, args.state.tile_size, args.state.tile_size, sprite]
end

# Setup the initialize grid
def setup_grid args
    args.state.grid = args.state.grid_size.map do 
        args.state.grid_size.map { 0 } 
    end
end


def checkInBounds args, x, y
    return x > 0 && y > 0 && x < args.state.rows - 1 && y < args.state.columns - 1;
end

def generate_tiles args
    for i in 0..args.state.rows do
        args.state.tiles[i] = []
        for j in 0..args.state.columns do
            if rand(0) < 0.3 || !checkInBounds(args, i, j)
                args.state.tiles[i][j] = new Wall(i, j)
            else
                args.state.tiles[i][j] = new Floor(i, j)
            end
        end
    end
end

def create_level args
    generate_tiles(args)
    render_level(args)
end

def get_tile args, x, y 
    if(checkInBounds(x, y))
        return args.state.tiles[x][y]
    else
        return new Wall(x, y)
    end
end

def render_level args
    for i in 0..args.state.rows do
        for j in 0..args.state.columns do
            get_tile(args, i, j).render_sprite(args)
        end
    end
end


# Generate a blank background -- "Off white color"
def render_background args
    args.outputs.solids << [0, 0, 1280, 720, 255, 250, 240, 255]
end

# Main part of the program
def tick args
    init args
    render_background args
    create_level args
    player_controller args
end


# Temp place for classes.
class Tile
    def initialize x, y, sprite, solid
        @x = x
        @y = y
        @sprite = sprite
        @solid = solid
    end

    def render_sprite args
        args.outputs.sprites << [self.x, self.y, 64, 64, self.sprite]
    end
end

class Floor
    def initialize x, y
        super(x, y, "images/grass.png", true)
    end
end

class Wall 
    def initialize x, y
        super(x, y, "images/water.png", false)
    end
end
require 'lib/tile.rb'
require 'lib/floor.rb'
require 'lib/wall.rb'
require 'lib/player.rb'

class Map 
    attr_accessor :position, :player
    def initialize args
        setup_level(args)
        @position = passable_tile args
        @player = Player.new(position.x, position.y,  "images/barbarian.png")
    end

    def serialize 
        { }
    end

    def inspect 
        serialize.to_s
    end

    def to_s
        serialize.to_s
    end

    def check_for_connected_tiles
            return generate_tiles == passable_tile.get_connected_tiles.length 
    end

    def generate_tiles args
        solid_tiles = 0
        for i in 0..args.state.grid_size do
            args.state.tiles[i] = []
            for j in 0..args.state.grid_size do
                if rand() < 0.3 || !in_bounds(args, i, j)
                    args.state.tiles[i][j] = Wall.new(i, j)
                else
                    args.state.tiles[i][j] = Floor.new(i, j)
                    solid_tiles += 1
                end
            end
        end
        return solid_tiles
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
        # ! W.e this shit is doesn't work :)
        # check_for_connected_tiles
        generate_tiles args
    end
 
    # Finds a random tile and returns its.
    def random_tile args
        x = random_range(0, args.state.grid_size - 1)
        y = random_range(0, args.state.grid_size - 1)
        return get_tile(args, x, y)
    end
    
    # Keeps checking for a solid tile. Then returns it
    def passable_tile args
        tile = random_tile args
        until tile.solid do
            tile = random_tile args
        end
        return tile
    end
    
    # Gets a random range
    def random_range(min, max)
        (rand * (max - min + 1) + min).floor
    end



    def tick args
        render_level args
        @player.player_controller args
    end
end
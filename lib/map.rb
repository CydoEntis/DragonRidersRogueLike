require 'lib/tile.rb'
require 'lib/floor.rb'
require 'lib/wall.rb'

class Map 
    def initialize args
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
                if rand() < 0.3 || !in_bounds(args, i, j)
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

    def random_range(min, max)
        return rand(max - min + 1) + min
    end

    # def attempt(callback)
    #     for i in 0..1000 do
    #         if(callback())
    #             return
    #         end
    #     end
    # end


    def find_random_tile
        loop do
            args.state.x = random_range(0, args.state.grid_size - 1)
            args.state.y = random_range(0, args.state.grid_size - 1)
            args.state.tile = get_tile(args.state.x, args.state.y)
            break if args.state.tile.solid
        end
    end

    # def get_passable_tile args
    #     args.state.tile
    #     10.times do
    #         args.state.x = random_range(0, args.state.grid_size - 1)
    #         args.state.y = random_range(0, args.state.grid_size - 1)
    #         args.state.tile = get_tile(args, args.state.x, args.state.y)
    #         if(args.state.tile.solid)
    #             return args.state.tile
    #         end
    #     end
    # end

    def find_passable_tile args
        args.state.tile
        attempt() {
            args.state.x = random_range(0, args.state.grid_size - 1)
            args.state.y = random_range(0, args.state.grid_size - 1)
            args.state.tile = get_tile(args.state.x, args.state.y)
            return args.state.tile.solid # && !tile.monster
        }
        return args.state.tile
    end

    def tick args
        render_level args
    end
end
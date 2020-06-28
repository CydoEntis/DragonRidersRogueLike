class Tile
    attr_accessor :x, :y, :solid

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

    def get_neighboring_tiles(dx, dy)
        return get_tile(@x + dx, @y + dy)
    end

    def get_adjacent_tiles() 
        return shuffle_tiles([
            self.get_neighboring_tiles(0, -1),
            self.get_neighboring_tiles(0, 1),
            self.get_neighboring_tiles(-1, 0),
            self.get_neighboring_tiles(1, 0)
        ])
    end

    def get_adjacent_solid_neighbors
        return self.get_adjacent_tiles.select(&:solid)
    end

    def get_connected_tiles 
        connected_tiles = [self]
        frontier = [self]
        while (frontier.length)
            neighbors = frontier.pop().get_adjacent_solid_neighbors().select { |tile| !connected_tiles.include?(tile) }
            connected_tiles = connected_tiles.concat(neighbors)
            frontier = frontier.concat(neighbors)
        end
        return connected_tiles
    end

    def render_tile args
        args.outputs.sprites << [@x * 80, @y * 80, 80, 80, @sprite]
    end
end
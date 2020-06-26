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
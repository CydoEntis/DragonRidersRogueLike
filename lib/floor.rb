class Floor < Tile
    def initialize x, y
        super(x, y, "images/grass.png", true)
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
end
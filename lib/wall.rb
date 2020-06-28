class Wall < Tile
    def initialize x, y
        super(x, y, "images/water-secondary.png", false)
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
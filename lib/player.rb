# ? TODO Move all player specific code here.

class Player
    attr_accessor :x, :y, :sprite

    def initialize x, y, sprite
        @x = x
        @y = y
        @sprite = sprite
    end

        # Basic player controller.
        def player_controller args
            if args.inputs.keyboard.key_down.up 
                @y += 1
            end
    
            if args.inputs.keyboard.key_down.down
                @y -= 1
            end
    
            if args.inputs.keyboard.key_down.left 
                @x -= 1
            end
    
            if args.inputs.keyboard.key_down.right
                @x += 1
            end
    
            # ? Render the player. {x and y pos have to be multipled by 80 to get correct position -- Come up with possible Fix?}
            render_sprite args, (@x * 80), (@y * 80), @sprite
        end
end
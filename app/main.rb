require "lib/map.rb"

def init args 
    args.state.tile_size ||= 80
    args.state.grid_size ||= 9
    args.state.game ||= Map.new(args)
    args.state.game.tick(args)
    # args.state.player_pos = args.state.game.find_random_tile
    args.state.player_x ||= 320
    args.state.player_y ||= 320
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

# Generate a blank background -- "Off white color"
def render_background args
    args.outputs.solids << [0, 0, 1280, 720, 255, 250, 240, 255]
end

# Main part of the program
def tick args
    init args
    player_controller args
end
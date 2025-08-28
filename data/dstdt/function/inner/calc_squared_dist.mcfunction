# Calculate differences between current and previous positions
scoreboard players operation @s dstdt_delta_x = @s dstdt_pos_x
scoreboard players operation @s dstdt_delta_x -= @s dstdt_prev_x

scoreboard players operation @s dstdt_delta_y = @s dstdt_pos_y
scoreboard players operation @s dstdt_delta_y -= @s dstdt_prev_y

scoreboard players operation @s dstdt_delta_z = @s dstdt_pos_z
scoreboard players operation @s dstdt_delta_z -= @s dstdt_prev_z

# Square each difference (multiply by itself)
scoreboard players operation @s dstdt_delta_x *= @s dstdt_delta_x
scoreboard players operation @s dstdt_delta_y *= @s dstdt_delta_y
scoreboard players operation @s dstdt_delta_z *= @s dstdt_delta_z

# Sum the squared differences
scoreboard players operation @s dstdt_squared = @s dstdt_delta_x
scoreboard players operation @s dstdt_squared += @s dstdt_delta_y
scoreboard players operation @s dstdt_squared += @s dstdt_delta_z

# Store in sqrt input for next step
scoreboard players operation @s dstdt_sqrt_input = @s dstdt_squared

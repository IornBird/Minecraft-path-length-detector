# Store previous positions
scoreboard players operation @s dstdt_prev_x = @s dstdt_pos_x
scoreboard players operation @s dstdt_prev_y = @s dstdt_pos_y
scoreboard players operation @s dstdt_prev_z = @s dstdt_pos_z

# Get current positions (multiplied by 72)
execute store result score @s dstdt_pos_x run data get entity @s Pos[0] 72
execute store result score @s dstdt_pos_y run data get entity @s Pos[1] 72
execute store result score @s dstdt_pos_z run data get entity @s Pos[2] 72

# Calculate squared distances
function dstdt:inner/calc_squared_dist

# Calculate sqrt if there was any movement (squared > 0)
execute if score @s dstdt_squared matches 1.. run function dstdt:inner/sqrt

# Add sqrt result to total distance if there was movement
execute if score @s dstdt_squared matches 1.. run scoreboard players operation @s dstdt_distance += @s dstdt_sqrt_result

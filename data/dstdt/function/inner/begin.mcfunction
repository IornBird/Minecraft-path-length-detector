# Initialize position and distance
execute store result score @s dstdt_pos_x run data get entity @s Pos[0] 72
execute store result score @s dstdt_pos_y run data get entity @s Pos[1] 72
execute store result score @s dstdt_pos_z run data get entity @s Pos[2] 72

# Initialize previous position same as current (no initial movement)
scoreboard players operation @s dstdt_prev_x = @s dstdt_pos_x
scoreboard players operation @s dstdt_prev_y = @s dstdt_pos_y
scoreboard players operation @s dstdt_prev_z = @s dstdt_pos_z

# Reset total distance
scoreboard players set @s dstdt_distance 0

# Mark as being tracked
tag @s add dstdt_tracking

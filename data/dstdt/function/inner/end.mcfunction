# Display result (divide by 72 to get blocks)
scoreboard players operation @s dstdt_distance /= #72 dstdt_const
tellraw @s ["Your length of path is ",{"score":{"name":"@s","objective":"dstdt_distance","color":"blue"}}," block(s)"]

# Stop tracking
tag @s remove dstdt_tracking

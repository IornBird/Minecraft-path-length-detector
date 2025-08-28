# Initialize with best starting value (235)
scoreboard players set @s dstdt_sqrt_result 235

# First iteration
scoreboard players operation @s dstdt_sqrt_temp = @s dstdt_sqrt_input
scoreboard players operation @s dstdt_sqrt_temp /= @s dstdt_sqrt_result
scoreboard players operation @s dstdt_sqrt_temp += @s dstdt_sqrt_result
scoreboard players operation @s dstdt_sqrt_temp /= #2 dstdt_const
scoreboard players operation @s dstdt_sqrt_result = @s dstdt_sqrt_temp

# Second iteration
scoreboard players operation @s dstdt_sqrt_temp = @s dstdt_sqrt_input
scoreboard players operation @s dstdt_sqrt_temp /= @s dstdt_sqrt_result
scoreboard players operation @s dstdt_sqrt_temp += @s dstdt_sqrt_result
scoreboard players operation @s dstdt_sqrt_temp /= #2 dstdt_const
scoreboard players operation @s dstdt_sqrt_result = @s dstdt_sqrt_temp

# Third iteration
scoreboard players operation @s dstdt_sqrt_temp = @s dstdt_sqrt_input
scoreboard players operation @s dstdt_sqrt_temp /= @s dstdt_sqrt_result
scoreboard players operation @s dstdt_sqrt_temp += @s dstdt_sqrt_result
scoreboard players operation @s dstdt_sqrt_temp /= #2 dstdt_const
scoreboard players operation @s dstdt_sqrt_result = @s dstdt_sqrt_temp

# Fourth iteration
scoreboard players operation @s dstdt_sqrt_temp = @s dstdt_sqrt_input
scoreboard players operation @s dstdt_sqrt_temp /= @s dstdt_sqrt_result
scoreboard players operation @s dstdt_sqrt_temp += @s dstdt_sqrt_result
scoreboard players operation @s dstdt_sqrt_temp /= #2 dstdt_const
scoreboard players operation @s dstdt_sqrt_result = @s dstdt_sqrt_temp

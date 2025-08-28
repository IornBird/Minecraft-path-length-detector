# Position tracking objectives
scoreboard objectives add dstdt_pos_x dummy
scoreboard objectives add dstdt_pos_y dummy
scoreboard objectives add dstdt_pos_z dummy
scoreboard objectives add dstdt_prev_x dummy
scoreboard objectives add dstdt_prev_y dummy
scoreboard objectives add dstdt_prev_z dummy

# Distance calculation objectives
scoreboard objectives add dstdt_delta_x dummy
scoreboard objectives add dstdt_delta_y dummy
scoreboard objectives add dstdt_delta_z dummy
scoreboard objectives add dstdt_squared dummy

# SQRT calculation objectives
scoreboard objectives add dstdt_sqrt_input dummy
scoreboard objectives add dstdt_sqrt_result dummy
scoreboard objectives add dstdt_sqrt_temp dummy

# Final results objective
scoreboard objectives add dstdt_distance dummy

# Constants objective and values
scoreboard objectives add dstdt_const dummy
scoreboard players set #2 dstdt_const 2
scoreboard players set #72 dstdt_const 72

# Success message
tellraw @a ["",{"text":"Distance Detector","color":"green"},{"text":" datapack initialized!"}]

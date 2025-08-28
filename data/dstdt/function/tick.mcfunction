# Only run tracking if there are players being tracked
execute if entity @a[tag=dstdt_tracking] as @a[tag=dstdt_tracking] at @s run function dstdt:inner/track

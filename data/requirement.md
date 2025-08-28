# Final Goal

To build a Minecraft datapack which detected how long a entity moved.

## Operation

In the game, user can input following functions in the chatbox.

`/function dstdt:begin`

- begin counting user's length of path

- At the tick user run the function:
  
  - record its xyz position.
  
  - its length will set to 0.

- Error handling: If player is already being tracked, skip silently.

`/function dstdt:end`

- end counting user's length of path

- At the tick user run the function, his chatbox will show (`tellraw`) his length of path.
  
  - it should be user friendly, like `Your length of path is 30 block(s)`
  - The length should be rounded (or floor/ceil, whichever be more convient) to integer in blocks.

- Error handling: If player is not being tracked, skip silently.

Also, following functions can be used in command blocks.

`/function dstdt:block_begin`

- run `dstdt:begin` for nearest user within 5 blocks.
- If no player detected within range, skip silently.

`/function dstdt:block_end`

- run `dstdt:end` for nearest user within 5 blocks.
- If no player detected within range, skip silently.

## Inner Operation

All operations, except four functions viewed as interface, are inside `inner` folder.

For each entity counting its length of path, the steps can be represented as following psudocode:

```cpp
void on_tick() {
    Array<Entity> p = /*all entity counting length of path*/;
    for(c: p){
        c.prv_pos = c.pos; // record position.
        c.pos = c.getPosition();
        Coord diff = c.pos - c.prv_pos;
        double dist = sqrt(
            diff.x * diff.x + 
            diff.y * diff.y + 
            diff.z * diff.z
        )
        c.length += dist;
    };
}
```

## To Platform Specified Models

### Position Storage

- Coordinates are stored using three separate scoreboards for x, y, and z
- All coordinate values are multiplied by 72 for precision (acts as number of effective digits)
- Y-axis (vertical) movement is weighted the same as horizontal movement

### Performance Considerations

- Commands run every tick for all players being counted using `@a[tag=...]`
- Minimize command execution when no players are being counted
- No specific limit on number of simultaneous players being tracked

### Scoreboard

scoreboard only allows integer, to ensure distance is presise enough, all value related to position may be multiplied by a constanst, `72` will be recommended.

Calculate `sqrt` is one of bottleneck, since it only provide `add`, `sub`, `mul` and `div`. But it can be calculated by Newton's method and recurisive, like following psudo code:

```cpp
double dig(double u, double a) {
    double r = (u + a / u) / 2;
    if (u == r) return u;
    return dig(r, a);
}

double sqrt_r(double a) {
    if (a <= 0) return 0; // a < 0 is impossible here.
    return dig(235, a); // best arg after test.
}
```

After testing, `4` is a good number for max recurise depth. And `235` gives least average recurise depth.

Scoreboard objectives will be documented in `scores.txt` as they are implemented.

each name of scoreboard needs include namespace `disdt_`, prevent misused by other datapacks.

### Tags

Tags needed for the datapack will be documented in `tags.txt` as they are implemented.

## Future work

Due to position will go chaos when go to different dimension (e.g. overworld -> Nether)`dstdt:end` should be called automatically when this entity go to different dimension.

## Releated Resaerch

In calculate `sqrt`, when accuracy is `1/72`, there're following found in external testing:

- Mostly, it only need to recuise at `4` times or less when moving less than `20` blocks in one tick (`1440` kilo-block / h).

- `235` is the best first guess for average `3.376` recuises.

There're some kind of input:

- Long depth: Doesn't converage. But it's already close when recuise `4` times.
  
  - The biggest error is at `65536`, where it's about `sqrt(0.098)` block.

- Medium depth: it needs at most recuise `5 ~ 8` times to converage.
  
  - `1`, `10`, `47` and some other numbers recurise `8` times.

- Short depth: Converage at less than `4` times.
  
  - The biggest error is at `103039`, where it's about `sqrt(0.123)` block with `4` time recurise.

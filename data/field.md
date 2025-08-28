**To Copilot: Do NOT read this file, it's only for convience to write mutliple-line input to Copilot.**

---

1. To Platform Specified Models:  Done
   - We're in `<datapack>\data\`
   - To run in `1.21` the, function directory should named `function`.
2. Setup Basic Scoreboards: Temporaly done
   - When writing to datapack, replace `.` in their names to `_`
   - 'scores.txt' can be modified whenever you need to add or remove socreboards.
3. Setup Player Tags: Temporaly done
   - For now, it's like only one tag needed.
4. Implement Core Distance Calculation: Done
5. Implement Interface Functions: Done
   You can now do "6. Setup Tick Function"

In my test in `test.cpp`, 

1. **Setup Datapack Structure**
   
   - Create `pack.mcmeta`
   - Setup main function tags (`minecraft/tags/functions/load.json` and `tick.json`)
   - Create initial function directory structure in `dstdt/functions/`

2. **Setup Basic Scoreboards**
   
   - Create initialization function for scoreboards (in `dstdt/functions/inner/init.mcfunction`)
   - Document scoreboards in scores.txt:
     - Position tracking (x, y, z for current and previous)
     - Distance calculation (temporary scores for sqrt)
     - Total distance tracked

3. **Setup Player Tags**
   
   - Create tags for tracking players
   - Document tags in tags.txt
   - Create tag management functions

4. **Implement Core Distance Calculation**
   
   - Create position difference calculation
   - Implement Newton's method sqrt calculation with 4 recursions
   - Add distance accumulation logic

5. **Implement Interface Functions**
   
   - `dstdt:begin` - Start tracking player
   - `dstdt:end` - Stop tracking and display results
   - `dstdt:block_begin` - Command block version of begin
   - `dstdt:block_end` - Command block version of end

6. **Setup Tick Function**
   
   - Create main tick function to track player movement
   - Optimize for performance when no players are tracked
   - Add dimension change detection

7. **Testing and Validation**
   
   - Test all interface functions
   - Verify distance calculation accuracy
   - Test error handling cases
   - Performance testing with multiple players

---

Emerald Circular

- Path length: 10.8 km (10862 m (CCW) / 10833m (CW))

- Total travel time: 8: 42

- Max speed: 130 km/h

- Average scheduled speed: 74.8 km/h

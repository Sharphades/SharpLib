# SharpLib
  ## Functions

  ### Local Player Functions

  #### `SharpLib.myPosX()`

  - Returns the local player's X position.

    Example in Lua:

    ```lua
    local posX = SharpLib.myPosX()
    ```

  #### `SharpLib.myPosY()`

  - Returns the local player's Y position.

    Example in Lua:

    ```lua
    local posY = SharpLib.myPosY()
    ```

  ### SendPacketRaw Functions

  #### `SharpLib.punch(x, y)`

  - Sends a punch packet to a specific location relative to the player's position.

    Example in Lua:

    ```lua
    SharpLib.punch(1, 0)   Punch 1 tile to the right
    ```

  #### `SharpLib.longPunch(x, y)`

  - Sends a long punch packet to a specific location (for GTPS servers).

    Example in Lua:

    ```lua
    SharpLib.longPunch(10, 10)   Long punch to tile (10, 10)
    ```

  ### Inventory Functions

  #### `SharpLib.getCount(id)`

  - Returns the count of a specific item in the player's inventory by its ID.

    Example in Lua:

    ```lua
    local count = SharpLib.getCount(1234)   Get the count of item with ID 1234
    ```

  #### `SharpLib.isItemExist(id)`

  - Checks if a specific item exists in the player's inventory by its ID.

    Example in Lua:

    ```lua
    local exists = SharpLib.isItemExist(1234)   Check if item with ID 1234 exists
    ```

  ### Player Functions

  #### `SharpLib.getPlayers()`

  - Returns the total number of players currently in the world.

    Example in Lua:

    ```lua
    local playerCount = SharpLib.getPlayers()
    print("There are " .. playerCount .. " players in the world.")
    ```

  ### Tile Functions

  #### `SharpLib.harvest(id, delay)`

  - Harvests all tiles with the specified foreground ID and waits for the specified delay.

    Example in Lua:

    ```lua
    SharpLib.harvest(1234, 1000)   Harvest tiles with foreground ID 1234
    ```

  #### `SharpLib.longHarvest(id, delay)`

  - Long harvests all tiles with the specified foreground ID (for GTPS servers).

    Example in Lua:

    ```lua
    SharpLib.longHarvest(1234, 1000)   Long harvest tiles with foreground ID 1234
    ```

  #### `SharpLib.longPlant(id, delay)`

  - Long plants items on all empty tiles.

    Example in Lua:

    ```lua
    SharpLib.longPlant(5678, 1000)   Long plant items with ID 5678 on empty tiles
    ```

  #### `SharpLib.getTilePos(id)`

  - Returns the positions of all tiles with a specific foreground or background ID.

    Example in Lua:

    ```lua
    local tilePositions = SharpLib.getTilePos(1234)
    for _, pos in ipairs(tilePositions) do
        SharpLib.log("Tile at X: " .. pos.x .. " Y: " .. pos.y)
    end
    ```

  #### `SharpLib.tpTo(id)`

  - Teleports to the first tile with a specific foreground or background ID.

    Example in Lua:

    ```lua
    SharpLib.tpTo(1234)   Teleport to the first tile with foreground ID 1234
    ```

  ### SendPacket Functions

  #### `SharpLib.drop(id)`

  - Drops the specified item from the player's inventory.

    Example in Lua:

    ```lua
    SharpLib.drop(1234)   Drop item with ID 1234
    ```

  #### `SharpLib.trash(id)`

  - Trashes the specified item from the player's inventory.

    Example in Lua:

    ```lua
    SharpLib.trash(1234)   Trash item with ID 1234
    ```
-- [[ This is made Sharphades ]] --
-- [[ Discord: hadesstrr      ]]
local SharpLib = {}

--For All Functions --
function SharpLib.blockFull()
    local kj = 0
    for k,v in pairs(GetObjectList()) do
        if math.floor((v.posX+10)//32) == pos().x+1 and math.floor((v.posY+10)//32) == pos().y then
            kj = kj + 1
        end
    end
    if kj >= 20 then
          FindPath(pos().x+1, pos().y)
          Sleep(200)
    end
end
-- For All Functions -- 

--Local Player
function SharpLib.myPosX()
    return math.floor(GetLocal().posX / 32)
    
end

function SharpLib.myPosY()
    return math.floor(GetLocal().posY / 32)
end
-- Local Player

-- LogToConsole
function SharpLib.log(text)
    LogToConsole(text)
end
-- LogToConsole

-- for SendPacketRaw --

function SharpLib.place(x,y,id)
    local pkt = {
        type = 3,
        value = id,
        px = GetLocal().posX // 32 + x,
        py = GetLocal().posY // 32 + y,
        x = GetLocal().posX,
        y = GetLocal().posY
    }
    SendPacketRaw(false, pkt)
end

function SharpLib.longPlace(x,y,id)
    local pkt = {
        type = 3,
        value = id,
        px = x,
        py = y,
        x = x*32,
        y = y*32
    }
    SendPacketRaw(false, pkt)
end

function SharpLib.punch(x,y)
    local pkt = {
        type = 3,
        value = 18,
        px = GetLocal().posX // 32 + x,
        py = GetLocal().posY // 32 + y,
        x = GetLocal().posX,
        y = GetLocal().posY
    }
    SendPacketRaw(false, pkt)
end

function SharpLib.longPunch(x,y) -- for gtps only
    local pkt = {
        type = 3,
        value = 18,
        px = x,
        py = y,
        x = x*32,
        y = y*32
    }
    SendPacketRaw(false, pkt)
end
-- for SendPacketRaw --

-- GetInventory
function SharpLib.getCount(id)
    for _, item in pairs(GetInventory()) do
        if item.id == id then
            return item.amount
        end
    end
    return 0
end

function SharpLib.isItemExist(id)
    for _, item in pairs(GetInventory()) do
        if item.id == id then
            return true
        end
    end
    return false
end
-- GetInventory


-- GetPlayerList
function SharpLib.getPlayers()
    local count = 0
    for _, player in pairs(getPlayerList()) do
        count = count + 1
    end
    return count
end
-- GetPlayerList--

-- GetTile --
    function customHarvest(width, height, itemid, delay)
        for x = 0, width do
            for y = 0, height do
                local tile = GetTile(x,y)
                if tile.fg == itemid and tile.readyharvest then
                    SharpLib.punch(tile.posX, tile.posY)
                    Sleep(delay)
                end
            end
        end
    end

    function customLongHarvest(width, height, itemid, delay)
        for x = 0, width do
            for y = 0, height do
                local tile = GetTile(x,y)
                if tile.fg == itemid and tile.readyharvest then
                    SharpLib.longPunch(tile.posX, tile.posY)
                    Sleep(delay)
                end
            end
        end
    end
-- GetTile --

-- GetTiles --
function SharpLib.harvest(id, delay)
    for _, tile in pairs(GetTiles()) do
        if tile.fg == id and tile.readyharvest then
            SharpLib.punch(tile.posX, tile.posY)
            Sleep(delay)
        end
    end
end

function SharpLib.longHarvest(id, delay)
    for _, tile in pairs(GetTiles()) do
        if tile.fg == id then
            SharpLib.longPunch(tile.posX, tile.posY)
            Sleep(delay)
        end
    end
end

function SharpLib.longPlant(id, delay)
    for _, tile in pairs(GetTiles()) do
        if tile.fg == 0 then
            SharpLib.longPunch(tile.posX, tile.posY)
            Sleep(delay)
        end
    end
end

function SharpLib.getTilePos(id)
    local position = {}
    for _, tile in pairs(GetTiles()) do
        if (tile.fg == id or tile.bg == id) then
            table.insert(positions, {x = tile.posX, y = tile.posY})
        end
    end
    return position
end

function SharpLib.logAllPositions(id)
    local positions = SharpLib.getTilePos(id)
    for index, pos in ipairs(positions) do
        SharpLib.log("==== INDEX "..index.." ====")
        SharpLib.log("Tile X: "..pos.x)
        SharpLib.log("Tile Y: "..pos.y)
        SharpLib.log("==== INDEX "..index.." ====")
    end
end

function SharpLib.tpLeftTo(id, index)
    for i, tile in pairs(GetTiles()) do
        if i == index then
            if (tile.fg == id or tile.bg == id) then
                FindPath(tile.posX-1, tile.posY)
            end
        end
    end
end

function SharpLib.tpRightTo(id, index)
    for i, tile in pairs(GetTiles()) do
        if i == index then
            if (tile.fg == id or tile.bg == id) then
                FindPath(tile.posX+1, tile.posY)
            end
        end
    end
end

function SharpLib.tpTopTo(id, index)
    for i, tile in pairs(GetTiles()) do
        if i == index then
            if (tile.fg == id or tile.bg == id) then
                FindPath(tile.posX, tile.posY-1)
            end
        end
    end
end
-- GetTiles --

--SendPacket --
function SharpLib.addStockVend(x,y)
    SendPacket(2, "action|dialog_return\ndialog_name|vending\ntilex|"..x.."|\ntiley|"..y.."|\nbuttonClicked|addstocks\n\n")
end

function SharpLib.retrieve(x,y,amount)
    SendPacket(2, "action|dialog_return\ndialog_name|itemremovedfromsucker\ntilex|"..x.."|\ntiley|"..y.."|\nitemtoremove|"..amount.."\n")
end

function SharpLib.drop(id)
    SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|"..id.."|\ncount|"..SharpLib.getCount(id).."\n")
end

function SharpLib.trash(id)
    SendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..id.."|\ncount|"..SharpLib.getCount(id).."\n")
end
--SendPacket --

-- EditToggle --
function SharpLib.On()
    EditToggle(name, true)
end

function SharpLib.Off()
    EditToggle(name, false)
end
-- EditToggle --


return SharpLib
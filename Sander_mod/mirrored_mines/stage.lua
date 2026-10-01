MirroredMines = StageAPI.CustomStage("Mirrored Mines")

MirroredMines:SetDisplayName("Mirrored Mines")

MirroredMines:SetLevelgenStage(
    LevelStage.STAGE2_2
)

MirroredMines:SetStageNumber(LevelStage.STAGE2_2)

function MirroredMines:HasMirrorDimension()
    return true
end

local ashpitBackdrop = 46

local ashpitGridGfx = StageAPI.GridGfx()

ashpitGridGfx:SetRocks(
    "gfx/grid/rocks_ashpit.png"
)

ashpitGridGfx:SetPits(
    "gfx/grid/grid_pit_ashpit.png"
)

ashpitGridGfx:SetBridges(
    "gfx/grid/grid_bridge_ashpit.png"
)

ashpitGridGfx:SetDecorations(
    "gfx/backdrop/props_03x_mines.anm2"
)

ashpitGridGfx:AddDoors(
    "gfx/grid/door_19_sheoldoor.png",
    {
        NotCurrent = {
            RoomType.ROOM_TREASURE,
            RoomType.ROOM_SHOP,
            RoomType.ROOM_SECRET,
            RoomType.ROOM_SUPERSECRET,
            RoomType.ROOM_CURSE,
            RoomType.ROOM_BOSS,
            RoomType.ROOM_MINIBOSS,
            RoomType.ROOM_CHALLENGE,
            RoomType.ROOM_SACRIFICE,
            RoomType.ROOM_LIBRARY,
            RoomType.ROOM_CHEST,
            RoomType.ROOM_DICE,
            RoomType.ROOM_PLANETARIUM
        },

        NotTarget = {
            RoomType.ROOM_TREASURE,
            RoomType.ROOM_SHOP,
            RoomType.ROOM_SECRET,
            RoomType.ROOM_SUPERSECRET,
            RoomType.ROOM_CURSE,
            RoomType.ROOM_BOSS,
            RoomType.ROOM_MINIBOSS,
            RoomType.ROOM_CHALLENGE,
            RoomType.ROOM_SACRIFICE,
            RoomType.ROOM_LIBRARY,
            RoomType.ROOM_CHEST,
            RoomType.ROOM_DICE,
            RoomType.ROOM_PLANETARIUM
        }
    }
)


local ashpitRoomGfx = StageAPI.RoomGfx(
    ashpitBackdrop,
    ashpitGridGfx
)


MirroredMines:SetRoomGfx(ashpitRoomGfx, {
    RoomType.ROOM_DEFAULT,
    RoomType.ROOM_TREASURE,
    RoomType.ROOM_SHOP,
    RoomType.ROOM_BOSS,
    RoomType.ROOM_SECRET,
    RoomType.ROOM_SUPERSECRET,
    RoomType.ROOM_MINIBOSS,
    RoomType.ROOM_CHALLENGE,
    RoomType.ROOM_CURSE,
    RoomType.ROOM_SACRIFICE,
    RoomType.ROOM_LIBRARY,
    RoomType.ROOM_CHEST,
    RoomType.ROOM_DICE,
    RoomType.ROOM_PLANETARIUM
})

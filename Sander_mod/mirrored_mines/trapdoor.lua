local spawned = false
function mod:SpawnMirrorTrapdoor()
    local room = Game():GetRoom()
    if not room:IsMirrorWorld() then
        return
    end
    if room:GetType() ~= RoomType.ROOM_BOSS then
        return
    end
    if spawned then
        return
    end
    local gridIndex = 67
    if room:GetGridEntity(gridIndex) then
        return
    end
    local success = room:SpawnGridEntity(gridIndex, GridEntityType.GRID_TRAPDOOR, 0, Random(), 0)
    if success then
        spawned = true
        room:Update()
    end
end

function mod:ResetTrapdoor()
    spawned = false
end

function mod:UseMirrorTrapdoor()
    local room = Game():GetRoom()

    if not room:IsMirrorWorld() then
        return
    end
    if room:GetType() ~= RoomType.ROOM_BOSS then
        return
    end

    local player = Isaac.GetPlayer(0)

    if player.Position:Distance(room:GetGridPosition(67)) < 40 then
        print("Going to Mirrored Mines!")

        StageAPI.GotoCustomStage(MirroredMines, true)
    end
end

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.SpawnMirrorTrapdoor)
mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, mod.ResetTrapdoor)
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.UseMirrorTrapdoor)

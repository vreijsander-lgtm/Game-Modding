local Character1 = {
    SPEED = 0.95,
    FIREDELAY = 18,
    DAMAGE = 3.25,
    RANGE = 260,
    SHOTSPEED = 1.00,
    LUCK = -5.00,
    TEARHEIGHT = 0.00,
    TEARFALLINGSPEED = 0.00,
    TEARFLAG = 0,
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0),
    FLYING = false
}

-- function Character1:onCache(player, cacheFlag)
--     if player:GetName() == "Sander" then

--         if cacheFlag == CacheFlag.CACHE_SPEED then
--             player.MoveSpeed = player.MoveSpeed + (Character1.SPEED - 1)
--         end

--         if cacheFlag == CacheFlag.CACHE_FIREDELAY then
--             player.MaxFireDelay = player.MaxFireDelay + (Character1.FIREDELAY - 10)
--         end

--         if cacheFlag == CacheFlag.CACHE_DAMAGE then
--             player.Damage = player.Damage + (Character1.DAMAGE - 3.5)
--         end

--         if cacheFlag == CacheFlag.CACHE_RANGE then
--             player.TearRange = player.TearRange + (Character1.RANGE - 260)
--             player.TearHeight = player.TearHeight + Character1.TEARHEIGHT
--             player.TearFallingSpeed = player.TearFallingSpeed + Character1.TEARFALLINGSPEED
--         end

--         if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
--             player.ShotSpeed = player.ShotSpeed + (Character1.SHOTSPEED - 1)
--         end

--         if cacheFlag == CacheFlag.CACHE_LUCK then
--             player.Luck = player.Luck + Character1.LUCK
--         end
--     end
-- end
local spindown = CollectibleType.COLLECTIBLE_SPINDOWN_DICE

function Character1:onMinCharge(slot, player, currentMinCharge)
    if player:GetName() == "Sander" then
        return 2
    end

    return currentMinCharge
end

function Character1:onMaxCharge(collectible, player, varData, currentMaxCharge)
    if player:GetName() == "Sander" then
        return 2
    end

    return currentMaxCharge
end

mod:AddCallback(ModCallbacks.MC_PLAYER_GET_ACTIVE_MIN_USABLE_CHARGE, Character1.onMinCharge, spindown)

mod:AddCallback(ModCallbacks.MC_PLAYER_GET_ACTIVE_MAX_CHARGE, Character1.onMaxCharge, spindown)

-- mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, Character1.onCache)

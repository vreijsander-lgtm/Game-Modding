local megaStatUp = Isaac.GetItemIdByName("Mega Pill")
local amount_pill = 0
function mod:OnMegaStatUp(player, cacheFlag)

    local amount = player:GetCollectibleNum(megaStatUp)

    if amount <= 0 then
        return
    end

    if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player.Damage = player.Damage * (1.5 ^ amount)
    end

    if cacheFlag == CacheFlag.CACHE_FIREDELAY then
        player.MaxFireDelay = player.MaxFireDelay / (1.5 ^ amount)
    end

    if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
        player.ShotSpeed = player.ShotSpeed * (1.5 ^ amount)
    end

    if cacheFlag == CacheFlag.CACHE_RANGE then
        player.TearRange = player.TearRange * (1.5 ^ amount)
    end

    if cacheFlag == CacheFlag.CACHE_SPEED then
        player.MoveSpeed = player.MoveSpeed * (1.5 ^ amount)
    end

    if cacheFlag == CacheFlag.CACHE_LUCK then
        player.Luck = player.Luck * (1.5 ^ amount)
    end
end
function mod:OnMegaPillPickup(player, charge, firstTime)
    local player = Isaac.GetPlayer(0)
    local amount = player:GetCollectibleNum(megaStatUp)

    if amount > amount_pill then
        player:AddMaxHearts(2 * amount_pill)
        player:AddHearts(2 * amount_pill)
        amount_pill = amount
    end
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.OnMegaStatUp)
mod:AddCallback(ModCallbacks.MC_POST_ADD_COLLECTIBLE, mod.OnMegaPillPickup)

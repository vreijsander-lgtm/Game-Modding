local game = Game()
local fartTimer = 0
local poisonColor = Color(0.2, 0.8, 0.2, 1.0, 0, 0, 0)
local fart = Isaac.GetItemIdByName("Fart")

function mod:OnPlayerUpdate(player)
    if not player:HasCollectible(fart) then
        fartTimer = 0
        return
    end
    fartTimer = fartTimer - 1
    if fartTimer <= 0 then
        game:Fart(player.Position, 85, player, 1, 0, poisonColor)
        fartTimer = 30
    end
end

function mod:OnCache(player, cacheFlag)
    if player:HasCollectible(fart) then
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + 0.5
        end

    end
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.OnCache)
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, mod.OnPlayerUpdate)

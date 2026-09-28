mod = RegisterMod("modd", 1)

local game = Game()

include("items/fart")
include("items/mega_statup")
include("characters/character1")
include("items/active_Healer")
function mod:RedKeyInfinite(player)
    local redKey = CollectibleType.COLLECTIBLE_RED_KEY
    if player:HasCollectible(redKey) then
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_RED_KEY then
            player:SetActiveCharge(99)
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, mod.RedKeyInfinite)
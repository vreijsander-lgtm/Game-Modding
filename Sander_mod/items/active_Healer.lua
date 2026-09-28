local item = Isaac.GetItemIdByName("Greeds Bomb")
function mod.OnUseItem(item_s, rng, player, useFlag, slot, customVarData)
    local roomEntities = Isaac.GetRoomEntities()
    for _, entity in ipairs(roomEntities) do
        if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() then
            entity:Kill()
        end
    end
    local remove = true
    return {
        Discharge = true,
        Remove = remove,
        ShowAnim = true,
    }
end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.OnUseItem, item)

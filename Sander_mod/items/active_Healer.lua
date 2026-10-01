local item = Isaac.GetItemIdByName("Greeds Bomb")
function mod.OnUseItem(item_s, rng, player, useFlag, slot, customVarData)
    local roomEntities = Isaac.GetRoomEntities()
    for _, entity in ipairs(roomEntities) do
        if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() then
            entity:Kill()
        end
    end
    local coinamount = math.random(2, 8)
    local type = EntityType.ENTITY_PICKUP
    local variant = PickupVariant.PICKUP_COIN
    local position = Isaac.GetPlayer(0).Position
    for i = 1, coinamount do
        local coinTypes = { 1, 1, 1, 1, 1, 2, 3, 4, 5, 6, 7 }
        local subtype = coinTypes[math.random(1, #coinTypes)]
        local angle = math.random() * 2 * math.pi
        local speed = math.random(2, 6)
        local velocity = Vector(math.cos(angle) * speed, math.sin(angle) * speed)
        Game():Spawn(type, variant, position, velocity, nil, subtype, Game():GetRoom():GetSpawnSeed())
    end
    return {
        Discharge = true,
        Remove = false,
        ShowAnim = true,
    }
end

mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.OnUseItem, item)

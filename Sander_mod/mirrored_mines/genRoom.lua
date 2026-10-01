local mirroredMinesRoomData = include("mirrored_mines/rooms")

local roomsByType = {}

for _, room in ipairs(mirroredMinesRoomData) do
	if room.TYPE and room.TYPE ~= RoomType.ROOM_TREASURE then
		if not roomsByType[room.TYPE] then
			roomsByType[room.TYPE] = {}
		end

		table.insert(roomsByType[room.TYPE], room)
	end
end

for roomType, rooms in pairs(roomsByType) do
	local roomList = StageAPI.RoomsList(
		"MirroredMines_" .. tostring(roomType),
		rooms
	)

	MirroredMines:SetRooms(
		roomList,
		roomType
	)
end

if roomsByType[RoomType.ROOM_BOSS] then
	local bossRoomList = StageAPI.RoomsList(
		"MirroredMines_CustomBoss",
		roomsByType[RoomType.ROOM_BOSS]
	)

	MirroredMines:SetRooms(
		bossRoomList,
		RoomType.ROOM_BOSS
	)
end

MirroredMines:SetRequireRoomTypeMatching()

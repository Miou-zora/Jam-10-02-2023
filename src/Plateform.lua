Plateform = {}

local function createRectangle(x, y, w, h)
    return {x = x, y = y, w = w, h = h}
end

function Plateform.create(x, y, scale, path)
    local asset = love.graphics.newImage(path)
    local rectangle = {}
    rectangle.hitbox = createRectangle(x, y, asset:getWidth() * (scale / 100), asset:getHeight() * (scale / 100))
    rectangle.scale = scale
    rectangle.asset = asset
    return rectangle
end

function Plateform.splitLine(line)
	local values = {}
    local i = 1
	for value in line:gmatch("[^ ]+") do
        if i < 4 then
            value = tonumber(value)
        end
		table.insert(values, value)
        i = i + 1
	end
	return values
end

function Plateform.load(path)
    local plateforms = {}

    for line in love.filesystem.lines(path) do
        local values = Plateform.splitLine(line)
        local x = values[1]
        local y = values[2]
        local scale = values[3]
        local asset = values[4]
        plateforms[#plateforms + 1] = Plateform.create(x, y, scale, asset)
    end
    return plateforms
end

function Plateform.draw(plateforms)
    for i = 1, #plateforms do
        love.graphics.push()
        love.graphics.setColor(1, 1, 1)
        local scale = plateforms[i].scale / 100
        love.graphics.draw(plateforms[i].asset, plateforms[i].hitbox.x, plateforms[i].hitbox.y, 0, scale, scale)
        love.graphics.rectangle("line", plateforms[i].hitbox.x, plateforms[i].hitbox.y, plateforms[i].hitbox.w, plateforms[i].hitbox.h)
        love.graphics.pop()
    end
end

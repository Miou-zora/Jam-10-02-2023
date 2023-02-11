
function splitLine(line)
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


function loadPlateforms(path)
    local plateforms = {}
    local i = 1

    for line in love.filesystem.lines(path) do
        local values = splitLine(line)
        local x = values[1]
        local y = values[2]
        local scale = values[3]
        local asset = values[4]
        plateforms[i] = createPlateform(x, y, scale, asset)
        i = i + 1
    end
    return plateforms
end

function drawPlateforms(plateforms)
    for i = 1, #plateforms do
        love.graphics.push()
        love.graphics.setColor(1, 1, 1)
        local scale = plateforms[i].scale / 100
        love.graphics.draw(plateforms[i].asset, plateforms[i].hitbox.x, plateforms[i].hitbox.y, 0, scale, scale)
        love.graphics.rectangle("line", plateforms[i].hitbox.x, plateforms[i].hitbox.y, plateforms[i].hitbox.w, plateforms[i].hitbox.h)
        love.graphics.pop()
    end
end

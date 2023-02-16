Item = {}


Item.AllItems = {}
Item.Types = {}

function Item.AddType(type)
    Item.Types[#Item.Types + 1] = type
end

function Item.IsIn(pos, hitbox)
    if (pos.x > hitbox.pos.x and pos.x < hitbox.pos.x + hitbox.size.x and
        pos.y > hitbox.pos.y and pos.y < hitbox.pos.y + hitbox.size.y) then
        return (true)
    else
        return (false)
    end
end


function Item.CollideWith(hitbox1, hitbox2)
    if Item.IsIn(hitbox1.pos, hitbox2) or
    Item.IsIn({x = hitbox1.pos.x, y = hitbox1.pos.y + hitbox1.size.y}, hitbox2) or
    Item.IsIn({x = hitbox1.pos.x + hitbox1.size.y, y = hitbox1.pos.y + hitbox1.size.y}, hitbox2) or
    Item.IsIn({x = hitbox1.pos.x + hitbox1.size.y, y = hitbox1.pos.y}, hitbox2) then
        return true
    else
        return false
    end
end

function Item.Load()
    for i = 1, #Item.Types do
        Item.Types[i].Load()
    end
end

function Item.MoveAll(dx, dy)
    for i = 1, #Item.AllItems do
        Item.AllItems[i].pos.x = Item.AllItems[i].pos.x + dx
        Item.AllItems[i].pos.y = Item.AllItems[i].pos.y + dy
    end
end

-- function Item.DrawHitbox(item)
--     love.graphics.origin()
--     love.graphics.setColor(1, 0.5, 0.5, 0.5)
--     love.graphics.rectangle("fill", item.hitbox.pos.x - (item.hitbox.size.x / 2) * item.scale.x,
--     item.hitbox.pos.y - (item.hitbox.size.y / 2) * item.scale.y,
--                             item.hitbox.size.x * item.scale.x,
--                             item.hitbox.size.y * item.scale.y)
-- end

function Item.DrawHitbox(item)
    if (item.verticies ~= nil) then
        love.graphics.origin()
        if (item.active) then
            love.graphics.setColor(1, 0.5, 0.5, 0.5)
        else
            love.graphics.setColor(0.5, 1, 0.5, 0.5)
        end
        love.graphics.translate(item.pos.x, item.pos.y)
        love.graphics.polygon("fill", item.verticies)
        for a = 1, #item.verticies do
            print(a, item.verticies[a])
        end
        love.graphics.origin()
    end
end

function Item.Debug()
    for i = 1, #Item.AllItems do
        -- Item.DrawHitbox(Item.AllItems[i])
        Item.DrawHitbox(Item.AllItems[i])
        if (Item.AllItems[i].Debug ~= nil) then
            Item.AllItems[i].Debug()
        end
    end
end

function Item.Append(item)
    Item.AllItems[#Item.AllItems + 1] = item
end

local function DrawOneItem(item)
    love.graphics.draw(item.image, item.pos.x, item.pos.y, item.rotation, item.scale.x, item.scale.y, item.image:getWidth() / 2, item.image:getHeight() / 2)
end

function Item.Draw()
    Item.Debug()
    for i = 1, #Item.AllItems do
        if Item.AllItems[i].toDisplay then
            DrawOneItem(Item.AllItems[i])
        end
    end
end

function Item.Update(dt)
    for i = 1, #Item.AllItems do
        if Item.AllItems[i].update ~= nil then
            Item.AllItems[i].update(Item.AllItems[i], dt)
        end
    end
end

function Item.MouseMoved(x, y, dx, dy, istouch)
    for i = 1, #Item.AllItems do
        if Item.AllItems[i].mouseMoved ~= nil then
            Item.AllItems[i].mouseMoved(Item.AllItems[i], x, y, dx, dy, istouch)
        end
    end
end
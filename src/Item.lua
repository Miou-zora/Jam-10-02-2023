Item = {}


Item.AllItems = {}
Item.Types = {}

function Item.IsIn(pos, hitbox)
    if (pos.x > hitbox.pos.x and pos.x < hitbox.pos.x + hitbox.size.x and
        pos.y > hitbox.pos.y and pos.y < hitbox.pos.y + hitbox.size.y) then
        return (true)
    else
        return (false)
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

function Item.Append(item)
    Item.AllItems[#Item.AllItems + 1] = item
end

local function DrawOneItem(item)
    love.graphics.draw(item.image, item.pos.x, item.pos.y, item.rotation, item.scale.x, item.scale.y, item.image:getWidth() / 2, item.image:getHeight() / 2)
end

function Item.Draw()
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
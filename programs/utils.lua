function checkFuel()
    if turtle.getFuelLevel() < 100 then
        return turtle.refuel(1)
    end
    print(turtle.getFuelLevel())
    return true
end
--  location example
--  top     side
--   2   ^   5
--  1T3  |   T
--   4       6
local position = 2
 
function checkStone()
    print("checking up" .. tostring(turtle.inspectUp()))
    local success, data = turtle.inspectUp()
    print(data.name)
    print(data.metadata)
    local stone = "minecraft:stone"
    if select(2, turtle.inspectUp()) == stone then
        return 5
    end
    if select(2, turtle.inspectDown()) == stone then
        return 6
    end
    if inspectPosition(1) == stone then
        return 1
    end
    if inspectPosition(2) == stone then
        return 2
    end
    if inspectPosition(3) == stone then
        return 3
    end    
    return -1            
end
 
function inspectPosition(pos)
    rotateTo(pos)
    return select(2, turtle.inspect()).metadata
end
 
function rotateTo(pos)
    if position == pos then
        return
    end
    if position < pos then
        turtle.turnRight()
        position=position+1
        rotateTo(pos)
        return
    end
    if position > pos then
        turtle.turnLeft()
        position=position-1
        rotateTo(pos)
        return
    end
end

function isFull()
    for i = 2,1 do
        if turtle.getItemSpace(i) > 0 then
            return false
        end
    end
    return true
end

function mine(pos)
    rotateTo(pos)
    turtle.dig()
end

function moveForward()
    mine(2)
    return turtle.forward()
end

function returnPaces(nPaces)
    rotateTo(4)
    for i = 1, nPaces do
        turtle.forward()
    end
end
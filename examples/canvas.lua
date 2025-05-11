local input = require("../init")

local function clr()
    io.write("\27[2J\27[H")
    io.flush()
end

local canvas = {}
local width, height = 100, 40

for y = 1, height do
    canvas[y] = {}
    for x = 1, width do
        canvas[y][x] = " "
    end
end

local screen_width = 2560
local screen_height = 1664

input:on("mouse_move", function(x, y)
    local cx = math.floor((x / screen_width) * width)
    local cy = math.floor((y / screen_height) * height)

    if cx >= 1 and cx <= width and cy >= 1 and cy <= height then
        canvas[cy][cx] = "◘"
    end

    clr()
    for _, row in ipairs(canvas) do
        print(table.concat(row))
    end
end)

input:run()

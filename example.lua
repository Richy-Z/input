local input = require("./init.lua") -- require("input")

-- input:on("mouse_down", function(side, x, y)
--     p(side, x, y)
-- end)

-- input:on("mouse_move", function(x, y)
--     p(os.time(), x, y)
-- end)

input:on("mouse_scroll", function(horizontal, vertical, smooth)
    p(horizontal, vertical, smooth)
end)

input:run()

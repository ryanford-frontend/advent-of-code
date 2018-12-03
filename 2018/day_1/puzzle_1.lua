local input = io.open("input.txt"):read("*a")
local i = 0

for n in input:gmatch("-?%d+") do i = i + n end

return i

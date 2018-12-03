local input = io.open("input.txt")

local grid = {}
local counter = 0

for i = 1, 1000 do
   for j = 1, 1000 do
      grid[i] = {}
      grid[i][j] = false
   end
end

for claim in input:lines() do
   for id, x, y, width, height in claim:gmatch("(%#%d+) %@ (%d+)%,(%d+)%: (%d+)x(%d+)") do
      for i = 1, width do
         for j = 1, height do
            grid[x + i][y + j] = grid[x + i][y + j] and "overlap" or id
         end
      end
   end
end

for i = 1, 1000 do
   for j = 1, 1000 do
      if grid[i][j] == "overlap" then
         counter = counter + 1
      end
   end
end

return counter

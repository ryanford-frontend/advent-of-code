local input = io.open("input.txt"):read("*a")

local twoReps = 0
local threeReps = 0

for id in input:gmatch("%a+") do
   local count = {}
   for c in id:gmatch("%a") do
      if count[c] then
         count[c] = count[c] + 1
      else
         count[c] = 1
      end
   end
   do
      local two, three = false, false
      for _, v in pairs(count) do
         if (two and three) then break end
         two = v == 2 and true or two
         three = v == 3 and true or three
      end
      twoReps = twoReps + (two and 1 or 0)
      threeReps = threeReps + (three and 1 or 0)
   end
end

return twoReps*threeReps

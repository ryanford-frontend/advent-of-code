local input = io.open("input.txt"):read("*a")

local function addInputs(i, t)
   for number in input:gmatch("-?%d+") do
      i = i + tonumber(number)
      for _,v in ipairs(t) do
         if v == i then print(i) return end
      end
      t[#t + 1] = i
   end
   return addInputs(i, t)
end

addInputs(0, { 0 })

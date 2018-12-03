local input = io.open("input.txt"):read("*a")

local function addInputs(sum, collection)
   for number in input:gmatch("-?%d+") do
      sum = sum + tonumber(number)
      if collection[sum] then
         return print(sum)
      end
      collection[sum] = true 
   end
   return addInputs(sum, collection)
end

addInputs(0, { ["0"] = true })

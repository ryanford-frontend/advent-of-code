local input = io.open("input.txt"):read("*a")

local words = {}
for word in input:gmatch("%a+") do
   words[#words + 1] = word
end

local function compare_words(index, arr)
   for i, word in ipairs(arr) do
      if index ~= i then
         local same = "" 
         for j = 1, #word do
            if word:sub(j,j) == words[index]:sub(j,j) then
               same = same .. word:sub(j,j)
            end
         end
         if #same == #word - 1 then return same end
      end
   end

   return compare_words(index + 1, arr)
end

return compare_words(1, words)

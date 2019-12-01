local initial_cost = require('part_1.lua')
local input = io.open('input.txt')
local sum = 0
local function total_calc(weight, cost)
	if weight <= 0 then return cost end
	cost = cost or 0
	local new_weight = initial_cost(weight)
	cost = cost + new_weight
	return total_calc(new_weight, cost)
end

for num in input:lines() do
	sum = sum + total_calc(tonumber(num))
end

print(sum)

local input = io.open('input.txt')
local sum = 0
local function calc_cost(n)
	local num = math.floor(n / 3) - 2
	return num > 0 and num or 0
end

for num in input:lines() do
	sum = sum + calc_cost(tonumber(num))
end

-- print(sum)

return calc_cost

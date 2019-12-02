local input = io.open('input.txt'):read('*a')

local function calc_cost(n)
	local num = math.floor(n / 3) - 2
	return num > 0 and num or 0
end

local function total_calc(weight, cost)
	if weight <= 0 then return cost end
	cost = cost or 0
	local new_weight = calc_cost(weight)
	cost = cost + new_weight
	return total_calc(new_weight, cost)
end

do
	local sum = 0
	for num in input:gmatch('%d+') do
		sum = sum + calc_cost(tonumber(num))
	end

	print(sum)
end


do
	local sum = 0
	for num in input:gmatch('%d+') do
		sum = sum + total_calc(tonumber(num))
	end

	print(sum)
end

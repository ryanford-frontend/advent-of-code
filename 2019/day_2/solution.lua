local input = {}
function input:add(i) self[self[i+3]] = self[self[i+1]] + self[self[i+2]] end
function input:mult(i) self[self[i+3]] =  self[self[i+1]] * self[self[i+2]] end
function input:new(o)
	o = o or {}
	self.__index = self
	return setmetatable(o,self)
end

do
	local f = io.open('input.txt'):read('*a')
	for num in f:gmatch("%d+") do
		table.insert(input, tonumber(num))
	end
	input[0] = table.remove(input, 1) -- work around 1 based indexing
end

do
	local test = input:new({
		[1] = 12,
		[2] = 2,
	})

	for k = 0, #input, 4 do
		if test[k] == 1 then
			test:add(k)
		elseif test[k] == 2 then
			test:mult(k)
		else
			break
		end
	end

	print(test[0])
end

do
	local TARGET = 19690720

	for i=0, 99 do
		for j=0, 99 do
			local test = input:new({
				[1] = i,
				[2] = j,
			})

			for k = 0, #input, 4 do
				if test[0] == TARGET then print(100 * i + j) break end
				if test[k] == 1 then
					test:add(k)
				elseif test[k] == 2 then
					test:mult(k)
				else
					break
				end
			end
		end
	end
end

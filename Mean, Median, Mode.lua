local function mean(set, ret)
    local amount = #set
    local total = 0
    for _,v in pairs(set) do total = total + tonumber(v) end
    if ret then
        return total / amount
    else
        print(total / amount)
    end
    return
end

local function median(set)
    table.sort(set, function(a, b)
        return a < b   
    end) 
    local isEven
    if #set % 2 == 0 then
        isEven = true
    else
        isEven = false
    end
    if isEven then
        local m1 = set[#set / 2]
        local m2 = set[(#set / 2) + 1]
        local median = mean({m1, m2}, true)
        if ret then return median else print(median) end
        return
    elseif not isEven then
        local SepN = (#set - 1) / 2
        local median = set[#set - SepN]
        if ret then return median else print(median) end
        return
    end
end

local function getMode(set) 
	local counts = {}
	for _,v in pairs(set) do
		counts[v] = counts[v] and counts[v] + 1 or 1
	end
	local modes = {}
	local modeCount = 0
	for k,v in pairs(counts) do
		if v > modeCount then
			modeCount = v
			modes = {k}
		elseif v == modeCount then
			table.insert(modes, k)
		end
	end
	return modes
end
 
 
local function mode(set, ret)
    local setMode = getMode(set)
    table.sort(setMode, function(a, b)
        return a < b
    end)
    if ret then
        return print(table.concat(setMode, ","))
      else
        print(table.concat(setMode, ","))
    end
    return
end

local function range(set, ret)
    table.sort(set, function(a, b)
        return a < b   
    end) 
    local s,l = set[1], set[#set]
    local range = l - s
    if ret then
        return range
    else
        print(range)
    end
end

local data = {1,1,2,3,4,4,5,5,6,6,7,8,9,9,0,0,0,0,1,1,1,2,3,4,4,4,5,5,5,6,6,6,7,8,8}

mean(data)
median(data)
mode(data)
range(data)

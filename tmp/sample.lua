-- string
local single_quote = 'Hello'
local double_quote = "World"
local multi_lines = [[
This is multiline
strings.
]]

print(single_quote .. double_quote)
print(multi_lines)

-- blocks do .. end
-- Num = 0
-- while Num < 10 do
    -- Num = Num + 1
-- end

-- if then .. end
-- if Num > 10 then
    -- print 'over 10'
-- else
    -- print('equal 10')
-- end

-- local isChecked = false
-- local result = isChecked and 'Checked' or 'Not checked'
-- print(result)

-- loop
-- for i = 1, 100 do
    -- Num = Num + i
-- end

-- for i = 100, 1, -1 do
    -- Num = Num - i
-- end

local say_hello = function()
    print('hello world')
end

say_hello()

-- table = {
    -- key1 = 'value1',
    -- key2 = 12
-- }

local function print_table(table) print(table.key1) end

-- 引数がテーブル1つだけであれば括弧はいらない
print_table{key1 = 12}

local function print_list(list)
    local str = list[1]
    for i = 2,#list do str = str .. ' ' .. list[i] end
    print(str)
end

print_list{'hello','world','my name is','solenoid'}


local defaultFavs = {animal = 'dog', color = 'black'}
local myFavs = {color = 'blue'}
setmetatable(myFavs, {__index = defaultFavs})
print(myFavs.animal)

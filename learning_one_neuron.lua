
local problem = {
   "...?.....?............#",
   "......?.......?....####",
   ".?........?.....#####?#",
   ".......?.....#####?####",
   "..?..?....#############",
   ".......######?######?##",
   "....#####?#######?#####",
   ".###################?##"}

local wx = 0
local wy = 0
local wb = 0


function neuron(x, y, bias)
   bias = bias or 1
   local f = wx * x + wy * y + wb * bias  -- local f = wx * (x-1) + wy * (y-1) + wb * bias
   if (f < 0) then
      return -1;
   end
   return 1; 
end


function learn(x, y, desired)
   local learning_constant = 0.1
   local _error = desired - neuron(x, y)
   wx = wx + _error * x * learning_constant  -- wx = wx + _error * (x-1) * learning_constant
   wy = wy + _error * y * learning_constant  -- wy = wy + _error * (y-1) * learning_constant
   wb = wb + _error * 1 * learning_constant  -- bias = 1
end


function one_step_of_learning()
   for y = 1, #problem do  -- for y, line in ipairs(problem)
      for x = 1, #problem[y] do  -- string.len(problem[y])  -- for x, char in ipairs(line)
	     local char_ = problem[y]:sub(x, x)
		 if (char_ == '.') then
		    learn(x, y, -1)
		 end
		 if (char_ == '#') then
		    learn(x, y, 1)
		 end
	  end
   end
end


function print_solution()
   for y = 1, #problem do  -- for y, line in ipairs(problem)
      local new_line = ""
      for x = 1, #problem[y] do  -- string.len(problem[y])  -- for x, char in ipairs(line)
	     local char_ = problem[y]:sub(x, x)
         if (char_ == '?') then
		    local r = neuron(x, y)
			if (r < 0) then
			   char_ = '!'
            else
               char_ = '%'
            end
		 end
		 new_line = new_line ..char_
	  end
	  print(new_line)
   end
end


print_solution()
for i = 1, 100 do
   one_step_of_learning()
   print_solution()
end

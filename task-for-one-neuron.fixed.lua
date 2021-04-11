-- original code in Python here: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html
-- оригинальный код на Python'е здесь: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html


-- the problem for which we find a solution based on the selected coefficients for the general equation of the line
-- проблема, для которой находим решение на основе подобранных коэффициентов для общего уравнения прямой
local problem = {
   "...?.....?............#",
   "......?.......?....####",
   ".?........?.....#####?#",
   ".......?.....#####?####",
   "..?..?....#############",
   ".......######?######?##",
   "....#####?#######?#####",
   ".###################?##"}


-- coefficients of the general form of linear equation (Cartesian coordinates)
-- in original code in Python here an error, cause sum of x * wx + y * wy must be the same at the border line (or on a line parallel to it), so x need have less multiplier than y have
-- or, in other words, because the "image" is wide, then when moving along the "x" axis, the increase in value should not be faster than in "y," otherwise the edge point on "x" (top right) will weigh more than the edge point on "y"
-- For a simple mechanical understanding what is happening can help tracing (outputing of values at each step of the internal cycle)

-- коэффициенты для общего уравнения прямой (прямоугольная система координат)
-- в оригинальном коде на Python'е здесь ошибка, потому что сумма x * wx + y * wy должна быть одинаковой на границе (или линии, параллельной ей), поэтому "x" нужен меньший множитель, чем у "y"
-- или, иными словами, т.к. "картинка" широкая, то при движении по оси "x" рост значения не должен быть быстрее, чем по "y", иначе крайняя точка по "x" (справа сверху) будет весить больше, чем крайняя точка по "y"
-- Для просто механического понимания происходящего может помочь трассировка (вывод значений на каждом шаге внутреннего цикла)
local wx = 8
local wy = 24
-- variable, that need to be equal to the sum of multiplications of coords point from border line to their weights (wx * x + wy * y), but with opposite sign
-- переменная, что должна быть равна сумме перемножений координат точки с разграничивающей прямой на их веса (wx * x + wy * y), но с противоположным знаком
local wb = -203  -- или -171, когда отсчёт(индексация) идёт с нуля (-171 - 1*wx - 1*wy = -203) -- or -171, if uses zero-based numbering


function neuron(x, y, bias)
   bias = bias or 1
   local f = wx * x + wy * y + wb * bias  -- general form of linear equation  -- общее уравнение прямой
   if (f < 0) then
      return -1;
   end
   return 1; 
end


local bias = 1  --[[ «опорный сигнал» ]]
for y = 1, #problem do  -- for y, line in ipairs(problem)
   local new_line = ""
   for x = 1, #problem[y] do  -- string.len(problem[y])  -- for x, char in ipairs(line)
      local char_ = problem[y]:sub(x, x)
      if (char_ == '?') then
         -- ask neuron, what do it "think" about that point
         -- спрашиваем у нейрона, что он думает про эту точку
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

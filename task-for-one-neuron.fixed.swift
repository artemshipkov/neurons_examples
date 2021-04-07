/* original code in Python here: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */
/* оригинальный код на Python'е здесь: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */

/* the problem for which we find a solution based on the selected coefficients for the general equation of the line */
/* проблема, для которой находим решение на основе подобранных коэффициентов для общего уравнения прямой */
var problem: [String] = ["...?.....?............#",
                         "......?.......?....####",
                         ".?........?.....#####?#",
                         ".......?.....#####?####",
                         "..?..?....#############",
                         ".......######?######?##",
                         "....#####?#######?#####",
                         ".###################?##"]

/* coefficients of the general form of linear equation (Cartesian coordinates) */
/* in original code in Python here an error, cause sum of x * wx + y * wy must be the same at the border line (or on a line parallel to it), so x need have less multiplier than y have */
/* or, in other words, because the "image" is wide, then when moving along the "x" axis, the increase in value should not be faster than in "y," otherwise the edge point on "x" (top right) will weigh more than the edge point on "y" */
/* For a simple mechanical understanding what is happening can help tracing (outputing of values at each step of the internal cycle) */

/* коэффициенты для общего уравнения прямой (прямоугольная система координат) */
/* в оригинальном коде на Python'е здесь ошибка, потому что сумма x * wx + y * wy должна быть одинаковой на границе (или линии, параллельной ей), поэтому "x" нужен меньший множитель, чем у "y" */
/* или, иными словами, т.к. "картинка" широкая, то при движении по оси "x" рост значения не должен быть быстрее, чем по "y", иначе крайняя точка по "x" (справа сверху) будет весить больше, чем крайняя точка по "y" */
/* Для просто механического понимания происходящего может помочь трассировка (вывод значений на каждом шаге внутреннего цикла) */
let wx: Int = 8
let wy: Int = 24
/* variable, that need to be equal to the sum of multiplications of coords point from border line to their weights (wx * x + wy * y), but with opposite sign */
/* переменная, что должна быть равна сумме перемножений координат точки с разграничивающей прямой на их веса (wx * x + wy * y), но с противоположным знаком */
let wb: Int = -171

func neuron(_ x: Int, _ y: Int, _ bias: Int = 1) -> Int {
    let f: Int = wx * x + wy * y + wb * bias  // general form of linear equation  // общее уравнение прямой
    if f < 0 {
        return -1
    }
    return 1
}

var y: Int = 0
for line in problem {
    var x: Int = 0
    var new_line: String = String()
    for char in line {
        var _char: Character = char
        if char == "?" {
            /* ask neuron, what do it "think" about that point */
            /* спрашиваем у нейрона, что он думает про эту точку */
            let r: Int = neuron(x, y)
            if r < 0 {
                _char = "!"
            }
            else {
                _char = "%"
            }
        }
        new_line.append(_char)  //  new_line += String(_char)   //  new_line += "\(_char)"  // line[x]
        x += 1
    }
    print(new_line)
    y += 1
}

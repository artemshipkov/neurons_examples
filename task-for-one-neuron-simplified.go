package main
import "fmt"

/* original code in Python here: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */
/* оригинальный код на Python'е здесь: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */


func main() {
	/* the problem for which we find a solution based on the selected coefficients for the general equation of the line */
	/* проблема, для которой находим решение на основе подобранных коэффициентов для общего уравнения прямой */
	var problem = [] string {
		"...?.....?............#",
		"......?.......?....####",
		".?........?.....#####?#",
		".......?.....#####?####",
		"..?..?....#############",
		".......######?######?##",
		"....#####?#######?#####",
		".###################?##" }
	
	/* coefficients of the general form of linear equation (Cartesian coordinates) */
	/* in original code in Python here an error, cause sum of x * wx + y * wy must be the same at the border line (or on a line parallel to it), so x need have less multiplier than y have */
	/* or, in other words, because the "image" is wide, then when moving along the "x" axis, the increase in value should not be faster than in "y," otherwise the edge point on "x" (top right) will weigh more than the edge point on "y" */
	/* For a simple mechanical understanding what is happening can help tracing (outputing of values at each step of the internal cycle) */
	
	/* коэффициенты для общего уравнения прямой (прямоугольная система координат) */
	/* в оригинальном коде на Python'е здесь ошибка, потому что сумма x * wx + y * wy должна быть одинаковой на границе (или линии, параллельной ей), поэтому "x" нужен меньший множитель, чем у "y" */
	/* или, иными словами, т.к. "картинка" широкая, то при движении по оси "x" рост значения не должен быть быстрее, чем по "y", иначе крайняя точка по "x" (справа сверху) будет весить больше, чем крайняя точка по "y" */
	/* Для просто механического понимания происходящего может помочь трассировка (вывод значений на каждом шаге внутреннего цикла) */
	var wx = 8
	var wy = 24
	/* variable, that need to be equal to the sum of multiplications of coords point from border line to their weights (wx * x + wy * y), but with opposite sign */
	/* переменная, что должна быть равна сумме перемножений координат точки с разграничивающей прямой на их веса (wx * x + wy * y), но с противоположным знаком */
	var wb = -171
	
	var bias=1  // «опорный сигнал»
	for y, line := range problem {
		var new_line string
		for x, ch := range line {
			var char_ = ch  // char_ := ch
			if ch == '?' {
				/* ask neuron, what do it "think" about that point */
				/* спрашиваем у нейрона, что он думает про эту точку */
				var f = wx * x + wy * y + wb * bias  // general form of linear equation  // общее уравнение прямой
				if f < 0 {
					char_ = '!'
				} else {
					char_ = '%'
				}
			}
			// maybe it will be better with use  var bb bytes.Buffer , or  var sb strings.Builder
			new_line += string(char_)
		}
		fmt.Println(new_line)
	}
}

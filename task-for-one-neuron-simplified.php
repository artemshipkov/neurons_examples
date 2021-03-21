<?php
/* original code in Python here: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */
/* оригинальный код на Python'е здесь: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */


/* the problem for which we find a solution based on the selected coefficients for the general equation of the line */
/* проблема, для которой находим решение на основе подобранных коэффициентов для общего уравнения прямой */
$problem[] = "...?.....?............#";
$problem[] = "......?.......?....####";
$problem[] = ".?........?.....#####?#";
$problem[] = ".......?.....#####?####";
$problem[] = "..?..?....#############";
$problem[] = ".......######?######?##";
$problem[] = "....#####?#######?#####";
$problem[] = ".###################?##";

$height = 8;
$width = 23;


/* coefficients of the general form of linear equation (Cartesian coordinates) */
/* in original code in Python here an error, cause sum of x * wx + y * wy must be the same at the border line (or on a line parallel to it), so x need have less multiplier than y have */
/* or, in other words, because the "image" is wide, then when moving along the "x" axis, the increase in value should not be faster than in "y," otherwise the edge point on "x" (top right) will weigh more than the edge point on "y" */
/* коэффициенты для общего уравнения прямой (прямоугольная система координат) */
/* в оригинальном коде на Python'е здесь ошибка, потому что сумма x * wx + y * wy должна быть одинаковой на границе (или линии, параллельной ей), поэтому "x" нужен меньший множитель, чем у "y" */
/* или, иными словами, т.к. "картинка" широкая, то при движении по оси "x" рост значения не должен быть быстрее, чем по "y", иначе крайняя точка по "x" (справа сверху) будет весить больше, чем крайняя точка по "y" */
$wx = 8;
$wy = 24;
/* variable, that need to be equal to the sum of multiplications of coords point from border line to their weights (wx * x + wy * y), but with opposite sign */
/* переменная, что должна быть равна сумме перемножений координат точки с разграничивающей прямой на их веса (wx * x + wy * y), но с противоположным знаком */
$wb = -171;


$bias = 1;  // «опорный сигнал»
for ($y = 0; $y < $height; ++$y) {
	$new_line = "";
	for ($x = 0; $x < $width; ++$x) {
		$ch = $problem[$y][$x];
		if ($ch === '?') {
			/* ask neuron, what do it "think" about that point */
            /* спрашиваем у нейрона, что он думает про эту точку */
			$f = $wx * $x + $wy * $y + $wb * $bias;  // general form of linear equation  // общее уравнение прямой
			if ($f < 0)
				$ch = '!';
			else
				$ch = '%';
		}
		// $new_line[] = $ch;
		$new_line[$x] = $ch;
	}
	print_r($new_line . '\n');
}

?>
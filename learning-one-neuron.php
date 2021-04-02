<?php

$problem[] = "...?.....?............#";
$problem[] = "......?.......?....####";
$problem[] = ".?........?.....#####?#";
$problem[] = ".......?.....#####?####";
$problem[] = "..?..?....#############";
$problem[] = ".......######?######?##";
$problem[] = "....#####?#######?#####";
$problem[] = ".###################?##";

$height = count($problem);
$width = strlen($problem[0]);

$wx = 0;
$wy = 0;
$wb = 0;

function neuron($x, $y, $bias=1) {
	global $wx, $wy, $wb;
	$f = $wx * $x + $wy * $y + $wb * $bias;
	if ($f < 0)
		return -1;
	return 1;
}

function learn($x, $y, $desired) {
	global $wx, $wy, $wb;
    $learning_constant = 0.1;
    $error = $desired - neuron($x, $y);
    $wx += $error * $x * $learning_constant;
    $wy += $error * $y * $learning_constant;
    $wb += $error * 1 * $learning_constant;  // $bias = 1
}

function one_step_of_learning() {
	global $problem, $height, $width;  // $height = count($problem);
	for ($y = 0; $y < $height; ++$y)  // $width = strlen($problem[$y]);
        for ($x = 0; $x < $width; ++$x) {
			$ch = $problem[$y][$x];
            if ($ch == '.')
                learn($x, $y, -1);
            if ($ch == '#')
                learn($x, $y, 1);
		}
}

function print_solution() {
	global $problem, $height, $width;  // $height = count($problem);
    for ($y = 0; $y < $height; ++$y) {
        $new_line = "";  // $width = strlen($problem[$y]);
        for ($x = 0; $x < $width; ++$x) {
			$ch = $problem[$y][$x];
			if ($ch === '?') {
                $r = neuron($x, $y);
				if ($r < 0)
                    $ch = '!';
                else
                    $ch = '%';
			}
            // $new_line[] = $ch;
			$new_line[$x] = $ch;
		}
        print_r($new_line . '\n');
	}
}

for ($y = 0; $y < $height; ++$y) {
	print_solution();
	for ($i = 0; $i < 100; ++$i) {
		one_step_of_learning();
		print_solution();
	}
}

?>
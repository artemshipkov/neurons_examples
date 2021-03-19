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

$wx = 8;
$wy = 24;
$wb = -171;

function neuron($x, $y, $bias=1) {
	global $wx, $wy, $wb;
	$f = $wx * $x + $wy * $y + $wb * $bias;
	if ($f < 0)
		return -1;
	return 1;
}

for ($y = 0; $y < $height; ++$y) {
	$new_line = "";
	for ($x = 0; $x < $width; ++$x) {
		$ch = $problem[$y][$x];
		if ($ch === '?') {
			/* ask neuron, what do it "think" about that point */
            /* спрашиваем у нейрона, что он думает про эту точку */
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

?>
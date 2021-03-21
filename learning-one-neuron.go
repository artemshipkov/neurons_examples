package main
import "fmt"


var problem = [] string {
    "...?.....?............#",
    "......?.......?....####",
    ".?........?.....#####?#",
    ".......?.....#####?####",
    "..?..?....#############",
    ".......######?######?##",
    "....#####?#######?#####",
    ".###################?##" }


var wx = 0.0
var wy = 0.0
var wb = 0.0

func neuron(x, y int) int {
    var bias=1.0
    var f = wx * float64(x) + wy * float64(y) + wb * bias
    if f < 0 {
        return -1
    }
    return 1
}

func learn(x, y, desired int) {
	var learning_constant = 0.1
	var error = desired - neuron(x, y)
	wx += float64(error * x) * learning_constant
	wy += float64(error * y) * learning_constant
	wb += float64(error * 1) * learning_constant  // bias = 1
}

func one_step_of_learning() {
	for y, line := range problem {
		for x, ch := range line {
			if (ch == '.') {
				learn(x, y, -1)
			}
			if (ch == '#') {
				learn(x, y, 1)
			}
		}
	}
}

func print_solution() {
	for y, line := range problem {
		var new_line string
		for x, ch := range line {
			var char_ = ch  // char_ := ch
			if ch == '?' {
				var r = neuron(x, y)
				if r < 0 {
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

func main() {
	print_solution()
	for i := 1; i < 100; i++ {
        one_step_of_learning()
		print_solution()
    }
}

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

var wx = 8
var wy = 24
var wb = -171

func neuron(x, y int) int {
    var bias=1
    var f = wx * x + wy * y + wb * bias
    if f < 0 {
        return -1
    }
    return 1
}

func main() {
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

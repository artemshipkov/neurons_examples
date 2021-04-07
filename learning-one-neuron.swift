
var problem: [String] = [
    "...?.....?............#",
    "......?.......?....####",
    ".?........?.....#####?#",
    ".......?.....#####?####",
    "..?..?....#############",
    ".......######?######?##",
    "....#####?#######?#####",
    ".###################?##"
]

var wx: Double = 0
var wy: Double = 0
var wb: Double = 0

func neuron(_ x: Int, _ y: Int, _ bias: Int = 1) -> Int {
    let f: Double = wx * Double(x) + wy * Double(y) + wb * Double(bias)
    if f < 0 {
        return -1
    }
    return 1
}

func learn(_ x: Int, _ y: Int, _ desired: Int) {
    let learning_constant: Double = 0.1
    let error: Int = desired - neuron(x, y)
    wx += Double(error * x) * learning_constant
    wy += Double(error * y) * learning_constant
    wb += Double(error * 1) * learning_constant  // bias = 1
}

func one_step_of_learning() {
    var y: Int = 0
    for line in problem {
        var x: Int = 0
        for char in line {
            if (char == ".") {
                learn(x, y, -1)
            }
            if (char == "#") {
                learn(x, y, 1)
            }
            x += 1
        }
        y += 1
    }
}

func print_solution() {
    var y: Int = 0
    for line in problem {
        var x: Int = 0
        var new_line: String = String()
        for char in line {
            var _char: Character = char
            if char == "?" {
                let r: Int = neuron(x, y)
                if r < 0 {
                    _char = "!"
                }
                else {
                    _char = "%"
                }
            }
            new_line.append(_char)  //  new_line += String(_char)   //  new_line += "\(_char)"  // new_line[x]
            x += 1
        }
        print(new_line)
        y += 1
    }
}

print_solution()
for _ in 0..<100 {
    one_step_of_learning()
    print_solution()
}

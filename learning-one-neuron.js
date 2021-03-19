var problem = [
    '...?.....?............#',
    '......?.......?....####',
    '.?........?.....#####?#',
    '.......?.....#####?####',
    '..?..?....#############',
    '.......######?######?##',
    '....#####?#######?#####',
   '.###################?##'
];

var wx = 0;
var wy = 0;
var wb = 0;

function neuron(x, y, bias=1) {
    let f = wx * x + wy * y + wb * bias;
    if (f < 0) {
        return -1;
	}
    return 1;
}

function learn(x, y, desired) {
    let learning_constant = 0.1;
    let error = desired - neuron(x, y);
    wx += error * x * learning_constant;
    wy += error * y * learning_constant;
    wb += error * 1 * learning_constant;  // bias = 1
}

function one_step_of_learning() {
    let y = 0;
    for (let line of problem) {
        let x = 0;
        for (let char_ of line) {
            if (char_ === '.')
                learn(x, y, -1);
            if (char_ === '#')
                learn(x, y, 1);
            ++x;
		}
        ++y;
	}
}

function print_solution() {
    let y = 0;
    for (let line of problem) {
        let x = 0;
        let new_line = "";
        for (let char_ of line) {
            if (char_ == '?') {
                let r = neuron(x, y);
                if (r < 0)
                    char_ = '!';
                else
                    char_ = '%';
			}
            new_line += char_;
            ++x;
		}
        console.log(new_line);
        ++y;
	}
}

var y = 0;
for (let line of problem) {
    let x = 0;
    let new_line = "";
    for (let char_ of line) {
        if (char_ == '?') {
            let r = neuron(x, y);
            if (r < 0)
                char_ = '!';
            else
                char_ = '%';
		}
        new_line += char_;
        x += 1;
	}
    console.log(new_line);
    y += 1;
}

print_solution();
for (let i = 0; i < 100; ++i) {
    one_step_of_learning();
    print_solution();
}

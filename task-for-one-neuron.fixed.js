/* original code in Python here: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */
/* оригинальный код на Python'е здесь: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */


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

var wx = 8;
var wy = 24;
var wb = -171;

function neuron(x, y, bias=1) {
    let f = wx * x + wy * y + wb * bias;
    if (f < 0) {
        return -1;
	}
    return 1;
}


var y = 0;
for (let line of problem) {
    let x = 0;
    let new_line = '';
    for (let char_ of line) {
        if (char_ == '?') {
            /* ask neuron, what do it "think" about that point */
            /* спрашиваем у нейрона, что он думает про эту точку */
            let r = neuron(x, y);
            if (r < 0) {
                char_ = '!';
			}
            else {
                char_ = '%';
			}
		}
        new_line += char_;
        x += 1;
	}
    console.log(new_line);
    y += 1;
}
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

/* in original code in Python here an error, cause sum of x * wx + y * wy must to be always same, so x need have less multiplier than y have */
/* в оригинальном коде на Python'е здесь ошибка, потому что сумма x * wx + y * wy должна быть одинаковой, поэтому "x" нужен меньший множитель, чем у "y" */
var wx = 8;
var wy = 24;
/* variable, that need to be equal to the sum of multiplications of coords center to their weights (wx * x + wy * y), but with opposite sign (?) */
/* переменная, что должна быть равна сумме перемножений координат центра на их веса (wx * x + wy * y), но с противоположным знаком */
var wb = -171;

var y = 0;
for (let line of problem){
    let x = 0;
    let new_line = '';
    for (let char_ of line){
        if (char_ == '?'){
            /* ask neuron, what do it "think" about that point */
            /* спрашиваем у нейрона, что он думает про эту точку */
			let f = wx * x + wy * y + wb * bias;
            if (f < 0){
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
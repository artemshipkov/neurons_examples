# original code in Python here: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html
# оригинальный код на Python'е здесь: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html


problem = [
    '...?.....?............#',
    '......?.......?....####',
    '.?........?.....#####?#',
    '.......?.....#####?####',
    '..?..?....#############',
    '.......######?######?##',
    '....#####?#######?#####',
    '.###################?##']


# in original code in Python here an error, cause sum of x * wx + y * wy must to be always same, so x need have less multiplier than y have
# в оригинальном коде на Python'е здесь ошибка, потому что сумма x * wx + y * wy должна быть одинаковой, поэтому "x" нужен меньший множитель, чем у "y"
wx = 8
wy = 24
# variable, that need to be equal to the sum of multiplications of coords center to their weights (wx * x + wy * y), but with opposite sign (?)
# переменная, что должна быть равна сумме перемножений координат центра на их веса (wx * x + wy * y), но с противоположным знаком
wb = -171


def neuron(x, y, bias=1):
    f = wx * x + wy * y + wb * bias
    if f < 0:
        return -1
    return 1


y = 0
for line in problem:
    x = 0
    new_line = ''
    for char in line:
        if char == '?':
            # ask neuron, what do it "think" about that point
            # спрашиваем у нейрона, что он думает про эту точку
            r = neuron(x, y)
            if r < 0:
                char = '!'
            else:
                char = '%'
        new_line += char
        x += 1
    print new_line
    y += 1

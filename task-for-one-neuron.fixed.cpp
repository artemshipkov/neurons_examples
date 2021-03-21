#include <iostream>

/* original code in Python here: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */
/* оригинальный код на Python'е здесь: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html */


/* the problem for which we find a solution based on the selected coefficients for the general equation of the line */
/* проблема, для которой находим решение на основе подобранных коэффициентов для общего уравнения прямой */
const int width = 24;
const int height = 8;
char problem[height][width] = {
    "...?.....?............#",
    "......?.......?....####",
    ".?........?.....#####?#",
    ".......?.....#####?####",
    "..?..?....#############",
    ".......######?######?##",
    "....#####?#######?#####",
    ".###################?##"
};

/* coefficients of the general form of linear equation (Cartesian coordinates) */
/* in original code in Python here an error, cause sum of x * wx + y * wy must be the same at the border line (or on a line parallel to it), so x need have less multiplier than y have */
/* or, in other words, because the "image" is wide, then when moving along the "x" axis, the increase in value should not be faster than in "y," otherwise the edge point on "x" (top right) will weigh more than the edge point on "y" */
/* коэффициенты для общего уравнения прямой (прямоугольная система координат) */
/* в оригинальном коде на Python'е здесь ошибка, потому что сумма x * wx + y * wy должна быть одинаковой на границе (или линии, параллельной ей), поэтому "x" нужен меньший множитель, чем у "y" */
/* или, иными словами, т.к. "картинка" широкая, то при движении по оси "x" рост значения не должен быть быстрее, чем по "y", иначе крайняя точка по "x" (справа сверху) будет весить больше, чем крайняя точка по "y" */
int wx = 8;
int wy = 24;
/* variable, that need to be equal to the sum of multiplications of coords point from border line to their weights (wx * x + wy * y), but with opposite sign */
/* переменная, что должна быть равна сумме перемножений координат точки с разграничивающей прямой на их веса (wx * x + wy * y), но с противоположным знаком */
int wb = -171;

inline int neuron(int x, int y, int bias=1) {
    int f = wx * x + wy * y + wb * bias;  // general form of linear equation  // общее уравнение прямой
    if (f < 0)
        return -1;
    return 1;
}

void main() {
	for (int y = 0; y < height; ++y) {
		char * new_line = new char[width]; new_line[width-1]=0;
		for (int x = 0; problem[y][x] /*x < width*/; ++x) {
			char ch = problem[y][x];
			if (ch == '?') {
				/* ask neuron, what do it "think" about that point */
				/* спрашиваем у нейрона, что он думает про эту точку */
				int r = neuron(x, y);
				if (r < 0)
					ch = '!';
				else
					ch = '%';
			}
			new_line[x] = ch;
		}
		std::cout << new_line << '\n';
		delete [] new_line;
	}
}

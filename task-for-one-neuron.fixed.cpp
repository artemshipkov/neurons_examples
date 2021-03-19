#include <iostream>


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
    ".###################?##" };

int wx = 8;
int wy = 24;
int wb = -171;

inline int neuron(int x, int y, int bias=1) {
    int f = wx * x + wy * y + wb * bias;
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
				// спрашиваем у нейрона, что он думает про эту точку
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

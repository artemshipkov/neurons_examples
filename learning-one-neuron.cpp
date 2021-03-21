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

double wx = 0;
double wy = 0;
double wb = 0;

inline int neuron(int x, int y, int bias=1) {
    double f = wx * x + wy * y + wb * bias;
    if (f < 0)
        return -1;
    return 1;
}

inline void learn(int x, int y, int desired) {
    double learning_constant = 0.1;
    int error = desired - neuron(x, y);
    wx += error * x * learning_constant;
    wy += error * y * learning_constant;
    wb += error * 1 * learning_constant;  // bias = 1
}

inline void one_step_of_learning() {
	for (int y = 0; y < height; ++y)
        for (int x = 0; x < width; ++x) {
			char ch = problem[y][x];
            if (ch == '.')
                learn(x, y, -1);
            if (ch == '#')
                learn(x, y, 1);
		}
}

inline void print_solution() {
    for (int y = 0; y < height; ++y) {
        char * new_line = new char[width]; new_line[width-1]=0;
        for (int x = 0; x < width; ++x) {
			char ch = problem[y][x];
            if (ch == '?') {
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

void main() {
	// std::uniform_real_distribution<double> distr(0, 100); std::default_random_engine rnd_eng;
	// wx = distr(rnd_eng);
	print_solution();
	for (int i = 0; i < 100; ++i) {
		one_step_of_learning();
		print_solution();
	}
}


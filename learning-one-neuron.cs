using System;

namespace learning_one_neuron {
    static class Program {
        static string[] problem = {
            "...?.....?............#",
            "......?.......?....####",
            ".?........?.....#####?#",
            ".......?.....#####?####",
            "..?..?....#############",
            ".......######?######?##",
            "....#####?#######?#####",
            ".###################?##" };

        static double wx = 0;
		static double wy = 0;
		static double wb = 0;

		static int neuron(int x, int y, int bias=1) {
			double f = wx * x + wy * y + wb * bias;
			if (f < 0)
				return -1;
			return 1;
		}

		static void learn(int x, int y, int desired) {
			double learning_constant = 0.1;
			int error = desired - neuron(x, y);
			wx += error * x * learning_constant;
			wy += error * y * learning_constant;
			wb += error * 1 * learning_constant;  // bias = 1
		}

		static void one_step_of_learning() {
			int y = 0;
			foreach (string line in problem) {
				int x = 0;
				foreach (char ch in line) {
					if (ch == '.')
						learn(x, y, -1);
					if (ch == '#')
						learn(x, y, 1);
					++x;
				}
				++y;
			}
		}

		static void print_solution() {
			int y = 0;
			foreach (string line in problem) {
				int x = 0;
				string new_line = "";
				foreach (char _ch in line) {
                    char ch = _ch;
                    if (ch == '?') {
						int r = neuron(x, y);
						if (r < 0)
							ch = '!';
						else
							ch = '%';
					}
					new_line += ch;
					++x;
				}
				Console.WriteLine(new_line);
				++y;
			}
		}

		static void Main() {
			print_solution();
			for (int i = 0; i < 100; ++i) {
				one_step_of_learning();
				print_solution();
			}
		}
	}
}

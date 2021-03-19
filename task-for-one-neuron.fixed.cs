namespace task_for_one_neuron
{
	static class Program
	{
		static string [] problem = {
			"...?.....?............#",
			"......?.......?....####",
			".?........?.....#####?#",
			".......?.....#####?####",
			"..?..?....#############",
			".......######?######?##",
			"....#####?#######?#####",
			".###################?##" };

		static int wx = 8;
		static int wy = 24;
		static int wb = -171;

		static int neuron(int x, int y, int bias=1) {
			int f = wx * x + wy * y + wb * bias;
			if (f < 0)
				return -1;
			return 1;
		}

		static void Main() {
			int y = 0;
			foreach (string line in problem) {
				int x = 0;
				string new_line = "";
				foreach (char _ch in line) {
				    char ch = _ch;
					if (ch == '?') {
						// спрашиваем у нейрона, что он думает про эту точку
						int r = neuron(x, y);
						if (r < 0)
							ch = '!';  // new_line += '!';
						else
							ch = '%';  // new_line += '%';
					} // else
					new_line += ch;
					++x;
				}
				Console.WriteLine(new_line);
				++y;
			}
		}
	}
}
public class Main {
	static String[] problem = {
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
	
	static int neuron(int x, int y) {
	    int bias=1;
		int f = wx * x + wy * y + wb * bias;
		if (f < 0)
			return -1;
		return 1;
	}
	
	public static void main(String[] args) {
		int y = 0;
		for (String line : problem) {
			int x = 0;
			String new_line = "";
			for (char ch : line.toCharArray()) {  // for (int x=0; i<line.length(); ++x) { char ch = line.charAt(x);
				if (ch == '?') {
					// спрашиваем у нейрона, что он думает про эту точку
					int r = neuron(x, y);
					if (r < 0)
						ch = '!';
					else
						ch = '%';
				}
				new_line += ch;
				++x;
			}
			System.out.println(new_line);
			++y;
		}
	}
}
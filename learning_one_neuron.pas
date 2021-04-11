program learning_one_neuron;
const
   width_lim : integer = 23;
   height_lim : integer = 7;

   problem : array [0..7, 0..23] of char = (
      '...?.....?............#',
      '......?.......?....####',
      '.?........?.....#####?#',
      '.......?.....#####?####',
      '..?..?....#############',
      '.......######?######?##',
      '....#####?#######?#####',
      '.###################?##');

var
   wx : real = 0;
   wy : real = 0;
   wb : real = 0;
   (* bias : integer = 1; *)
   i : integer;

   function neuron(x, y : integer): integer; overload;  (* (x, y : integer; bias: integer = 1) *)
   var
      f : real;
      bias : integer;
   begin
      bias := 1;
      f := wx * x + wy * y + wb * bias;
      if (f < 0) then
         neuron := -1
      else
         neuron := 1;
   end;

   function neuron(x, y, bias : integer): integer; overload;
   var
      f : real;
   begin
      f := wx * x + wy * y + wb * bias;
      if (f < 0) then
         neuron := -1
      else
         neuron := 1;
   end;

   procedure learn(x, y, desired : integer);
   const
      learning_constant : real = 0.1;
   var
      error : integer;
   begin
      error := desired - neuron(x, y);
      wx := wx + error * x * learning_constant;
      wy := wy + error * y * learning_constant;
      wb := wb + error * 1 * learning_constant;  (* bias = 1 *)
   end;

   procedure one_step_of_learning;
   var
      y : integer;
      x : integer;
      char_ : char;
   begin
      for y := 0 to height_lim do
      begin
         for x := 0 to width_lim do
         begin
            char_ := problem[y][x];
            if (char_ = '.') then
               learn(x, y, -1);
            if (char_ = '#') then
               learn(x, y, 1);
         end;
      end;
   end;

   procedure print_solution;
   var
      y : integer;
      x : integer;
      char_ : char;
      new_line : array [0..23] of char;
      r : integer;
   begin
      for y := 0 to height_lim do
      begin
         for x := 0 to width_lim do
         begin
            char_ := problem[y][x];
            if (char_ = '?') then
            begin
               r := neuron(x, y);
               if (r < 0) then
                  char_ := '!'
               else
                  char_ := '%';
            end;
            new_line[x] := char_;
         end;
         writeln(new_line);
      end;
   end;

begin
   print_solution;
   for i := 0 to 99 do
   begin
      one_step_of_learning;
      print_solution;
   end;
end.


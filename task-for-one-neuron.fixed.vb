Module Task_for_one_neuron
    ' original code in Python here: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html
    ' оригинальный код на Python'е здесь: http://www.michurin.net/computer-science/artificial-intelligence/task-for-one-neuron.html

    ' the problem for which we find a solution based on the selected coefficients for the general equation of the line
    ' проблема, для которой находим решение на основе подобранных коэффициентов для общего уравнения прямой
    Dim problem As String() = {
        "...?.....?............#",
        "......?.......?....####",
        ".?........?.....#####?#",
        ".......?.....#####?####",
        "..?..?....#############",
        ".......######?######?##",
        "....#####?#######?#####",
        ".###################?##"
    }

    ' coefficients of the general form of linear equation (Cartesian coordinates)
    ' in original code in Python here an error, cause sum of x * wx + y * wy must be the same at the border line (or on a line parallel to it), so x need have less multiplier than y have
    ' or, in other words, because the "image" is wide, then when moving along the "x" axis, the increase in value should not be faster than in "y," otherwise the edge point on "x" (top right) will weigh more than the edge point on "y"
    ' коэффициенты для общего уравнения прямой (прямоугольная система координат)
    ' в оригинальном коде на Python'е здесь ошибка, потому что сумма x * wx + y * wy должна быть одинаковой на границе (или линии, параллельной ей), поэтому "x" нужен меньший множитель, чем у "y"
    ' или, иными словами, т.к. "картинка" широкая, то при движении по оси "x" рост значения не должен быть быстрее, чем по "y", иначе крайняя точка по "x" (справа сверху) будет весить больше, чем крайняя точка по "y"
    Dim wx As Integer = 8
    Dim wy As Integer = 24

    ' variable, that need to be equal to the sum of multiplications of coords point from border line to their weights (wx * x + wy * y), but with opposite sign
    ' переменная, что должна быть равна сумме перемножений координат точки с разграничивающей прямой на их веса (wx * x + wy * y), но с противоположным знаком
    Dim wb As Integer = -171

    Function neuron(x As Integer, y As Integer, Optional bias As Integer = 1) As Integer
        Dim f As Integer = wx * x + wy * y + wb * bias  ' general form of linear equation  ' общее уравнение прямой
        If (f < 0) Then
            Return -1
        End If
        Return 1
    End Function

    Sub Main()

        For y As Integer = 0 To problem.Length() - 1 Step 1
            Dim line As String = problem(y)
            Dim new_line As String = ""
            For x As Integer = 0 To Len(line) - 1 Step 1
                Dim char_ As Char = line(x)
                If (char_ = "?"c) Then
                    ' ask neuron, what do it "think" about that point
                    ' спрашиваем у нейрона, что он думает про эту точку
                    Dim r As Integer = neuron(x, y)
                    If (r < 0) Then
                        char_ = "!"c  ' new_line &= "!"c
                    Else
                        char_ = "%"c  ' new_line &= "%"c
                    End If
                End If
                new_line &= char_
            Next
            Console.WriteLine(new_line)
        Next

    End Sub

End Module

Module Learning_one_neuron

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

    Dim wx As Double = 0
    Dim wy As Double = 0
    Dim wb As Double = 0

    Function neuron(x As Integer, y As Integer, Optional bias As Integer = 1) As Integer
        Dim f As Double = wx * x + wy * y + wb * bias
        If (f < 0) Then
            Return -1
        End If
        Return 1
    End Function

    Sub learn(x As Integer, y As Integer, desired As Integer)
        Dim learning_constant As Double = 0.1
        Dim _error As Integer = desired - neuron(x, y)
        wx += _error * x * learning_constant
        wy += _error * y * learning_constant
        wb += _error * 1 * learning_constant  ' bias = 1
    End Sub

    Sub one_step_of_learning()
        Dim y As Integer = 0
        For Each line As String In problem
            Dim x As Integer = 0
            For Each char_ As Char In line
                If (char_ = "."c) Then
                    learn(x, y, -1)
                End If
                If (char_ = "#"c) Then
                    learn(x, y, 1)
                End If
                x += 1
            Next
            y += 1
        Next
    End Sub

    Sub print_solution()
        Dim y As Integer = 0
        For Each line As String In problem
            Dim new_line As String = ""
            For x As Integer = 0 To Len(line) - 1 Step 1
                Dim char_ As Char = line(x)
                If (char_ = "?"c) Then
                    Dim r As Integer = neuron(x, y)
                    If (r < 0) Then
                        char_ = "!"c
                    Else
                        char_ = "%"c
                    End If
                End If
                new_line &= char_
            Next
            Console.WriteLine(new_line)
            y += 1
        Next
    End Sub

    Sub Main()
        print_solution()
        For i As Integer = 0 To 100 Step 1
            one_step_of_learning()
            print_solution()
        Next
    End Sub

End Module

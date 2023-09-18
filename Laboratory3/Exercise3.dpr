Program Exercise3;

Uses
    System.SysUtils;

// initialization
Var
    Counter: Integer = 0;
    Eps: Real = 0;
    X: Real = 0;
    XLast: Real = 0;
    IsFinding: Boolean = False; // for task
    GoodFlag: Boolean = False; // for exit loop

Begin
    // output the task
    Writeln('Program solves this example: Ln(7.622x) - 8.59x + 5.');
    Writeln('It is recommended to input epsilon in standard form.');
    Writeln('Example: 1e-9');
    Writeln('Or using normal input.');
    Writeln('Example: 0.1');
    // loop for checking inputted eps
    Repeat
        Try
            Writeln('Enter eps:');
            Readln(Eps);
            If Eps > 0.1 Then
                Raise Exception.Create('Epsilon is too big!!!');
            If Eps < 1.0E-17 Then
                Raise Exception.Create('Epsilon is too low!!!');
            GoodFlag := True;
        Except
            On E: Exception Do
            Begin
                Write(E.Message);
                Writeln(' Try again.');
            End;
        End;
    Until GoodFlag;
    // output some more info
    Writeln('To start program also needs to input X0:');
    // loop for checking inputted X0
    GoodFlag := False;
    Repeat
        Try
            Writeln('Enter X0:');
            Readln(XLast); // x0
            If (XLast < 0) Or (XLast = 0) Then
                Raise Exception.Create('X0 cannot be less or equal than 0, because in the task there is logarithm(7.622x > 0)!!!');
            GoodFlag := True;
        Except
            On E: Exception Do
            Begin
                Write(E.Message);
                Writeln(' Try again.');
            End;
        End;
    Until GoodFlag;
    If (100 / (859 * XLast)) > 1 Then
        Writeln('The problem is not solvable using the inputted X0!!!')
    Else
    Begin
        Writeln('    N    |   X - 1   |    X');
        Writeln('---------------------------');
        While IsFinding = False Do
        Begin
            X := (Ln(7.662 * XLast) + 5) / 8.59;
            writeln(Counter, '|':9, XLast:1:5, '|':5, X:1:5);
            If Abs(X - XLast) < Eps Then
                IsFinding := True
            else
                XLast := X;
            counter := counter + 1;
        End;
        // output
        Writeln;
        Writeln('The answer of this task is ', X:1:5);
    End;
    //freeze console
    writeln('Press enter to exit...');
    readln;
End.

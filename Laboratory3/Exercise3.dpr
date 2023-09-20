Program Exercise3;

Uses
    System.SysUtils;

Var
    Counter: Integer;
    Eps: Real;
    X: Real;
    XLast: Real;
    IsFinding: Boolean; // for task
    GoodFlag: Boolean; // for exit loop

Begin
    // initialization
    Counter := 0;
    Eps := 0.0;
    XLast := 0.0;
    IsFinding := False;
    GoodFlag := False;
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
                Raise EInOutError.Create('Epsilon is too big!!!');
            If Eps < 1.0E-17 Then
                Raise EInOutError.Create('Epsilon is too low!!!');
            GoodFlag := True;
        Except
            On E: EInOutError Do
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
                Raise EInOutError.Create
                    ('X0 cannot be less or equal than 0, because in the task there is logarithm(7.622x > 0)!!!');
            If 100 / (859 * XLast) > 1 Then
                Raise EInOutError.Create
                    ('The problem is not solvable using the inputted X0!!!');
            GoodFlag := True;
        Except
            On E: EInOutError Do
            Begin
                Write(E.Message);
                Writeln(' Try again.');
            End;
        End;
    Until GoodFlag;
    Writeln(#9, 'N', #9, '|     X - 1', #9, '|', #9, 'X');
    Writeln('-------------------------------------------------');
    While IsFinding = False Do
    Begin
        X := (Ln(7.662 * XLast) + 5) / 8.59;
        Writeln(Counter:9, '|':8, XLast:11:5, #9, '|', X:11:5);
        If Abs(X - XLast) < Eps Then
            IsFinding := True
        Else
            XLast := X;
        Counter := Counter + 1;
    End;
    // output
    Writeln;
    Writeln('The answer of this task is ', X:6:5);
    // freeze console
    Writeln('Press enter to exit...');
    Readln;

End.

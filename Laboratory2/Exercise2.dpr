Program Exercise2;

Uses
    System.SysUtils;

// initialization
Var
    N: Integer = 0;
    Sum: Integer = 0;
    NumberInLoop: Integer = 1;
    // Low numbers for loops
    I: Integer;
    J: Integer;
    // Flag for end loop for inputted symbols
    GoodFlag: Boolean = False;

Begin
    // output the task
    Writeln('Calculate the sum using the formula (-1)^i * 2^i:');
    Writeln;
    // loop for check inputted symbols
    Repeat
        Try
            // input
            Writeln('Enter n:');
            Readln(N);
            If N < 1 Then
                Raise Exception.Create('N cannot be less than 1');
            // to exit the loop if user entered correct symbols
            GoodFlag := True;
        Except
            On E: Exception Do
            Begin
                Write(E.Message);
                Writeln('!!! Try again.');
            End;
        End;
    Until (GoodFlag);
    // main block
    For I := 1 To N Do
    Begin
        NumberInLoop := NumberInLoop * 2;
        If I Mod 2 <> 0 Then
            Sum := Sum - NumberInLoop
        Else
            Sum := Sum + NumberInLoop;
    End;
    // output
    Writeln('Sum equal ', Sum);
    Writeln;
    // End of program
    Writeln('Press Enter to exit...');
    Readln;

End.

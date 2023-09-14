import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // initialization
        int n = 0, sum = 0;
        boolean goodFlag = false;
        // output the task
        System.out.println("Calculate the sum using the formula (-1)^i * 2^i.\n");
        // loop for check inputted symbols
        do {
            try {
                //input
                System.out.println("Enter n:");
                Scanner in = new Scanner(System.in);
                n = in.nextInt();
                //check if input is wrong or less than 0
                if (n < 1)
                    throw new Exception("n cannot be less than 1!!!");
                goodFlag = true; // to exit the loop if user entered correct symbols
                in.close();
            }
            catch (Exception ex)
            {
                if (ex.getMessage() == null)
                    System.out.print("Invalid type!!!");
                else
                    System.out.print(ex.getMessage());
                System.out.println(" Try again.");
            }
        } while(!goodFlag);
        //main block
        for (int i = 1; i <= n; i++)
        {
            int number = 2;
            for (int j = 1; j < i; j++)
            {
                number *= 2;
            }
            if (i % 2 != 0)
                number *= -1;
            sum += number;
        }
        //output
        System.out.println("Sum equal " + sum);
        System.out.println();
    }
}
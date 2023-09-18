import java.util.Scanner;
import java.math.*;

public class Main {
    public static void main(String[] args) {
        //initialization
        boolean goodFlag = false, //for exit loop
                isFinding = false; // for task
        int counter = 0;
        double eps = 0,
                xLast = 0, // X0
                x = 0;
        Scanner in = new Scanner(System.in);
        //output the task
        System.out.print("""
                           Program solves this example: Ln(7.622x) - 8.59x + 5 = 0.
                           It's recommended to input epsilon, using standard form.
                           Example: 1e-9
                           Or using normal input.
                           Example: 0.1
                           """);
        // loop for check inputted eps
        do {
            try {
                //input
                System.out.println("Enter eps:");
                eps = Double.parseDouble(in.nextLine());
                if (eps > 0.1) {
                    System.out.print("Eps is too big!!!");
                    throw new Exception();
                }
                if (eps < 1.0e-17) {
                    System.out.print("Eps is too little!!!");
                    throw new Exception();
                }
                goodFlag = true; // to exit the loop if user entered correct epsilon
            }
            catch (Exception ex)
            {
                if (ex.getMessage() != null)
                    System.out.print("Invalid type!!!");
                System.out.println(" Try again.");
            }
        } while(!goodFlag);
        // output some more info
        System.out.println("Enter x to start the calculation with:");
        // loop for check inputted X0
        goodFlag = false;
        do {
            try {
                System.out.println("Enter X0");
                xLast = Double.parseDouble(in.nextLine());
                if (xLast < 0 || xLast == 0) {
                    System.out.print("X0 cannot be less or equal than 0, because in the task there's logarithm(7.622x > 0)!!!");
                    throw new Exception();
                }
                goodFlag = true; // to exit the loop if user entered correct limits
            }
            catch (Exception ex)
            {
                if (ex.getMessage() != null)
                    System.out.print("Invalid type!!!");
                System.out.println(" Try again.");
            }

        }while(!goodFlag);
        in.close();
        // main block
        if ((double)(100)/((double)(859) * xLast) >= 1)
        {
            isFinding = true;
            System.out.println("The problem is not solvable using the inputted X0!!!");
        }
        else
        {
            //creating table
            System.out.printf("     %-5s|", "N");
            System.out.printf("    %-6s|", "X-1");
            System.out.println("    X");
            System.out.println("--------------------------------");
            while(!isFinding)
            {
                x = (Math.log(7.622 * xLast) + 5) / 8.59;
                System.out.printf("%-10s|", counter);
                System.out.printf("%f  |", xLast);
                //System.out.printf("%-10s|", xLast);
                System.out.printf("%f\n", x);
                if (Math.abs(x - xLast) < eps)
                    isFinding = true;
                else
                    xLast = x;
            }
            // output
            System.out.printf("The answer of this task is %f.\n", x);
        }
    }
}
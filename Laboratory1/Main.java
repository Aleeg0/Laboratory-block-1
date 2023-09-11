import java.util.Scanner;
import java.lang.Math;

//main class
public class Main
{
    public static void main(String[] args)
    {
        //initialization
        double num1 = 0, num2 = 0, arithmeticAvg = 0, geometricAvg = 0;
        boolean goodFlag = false;
        //output task
        System.out.println("  The program is proving that arithmetic average of two unsigned \n"
                + "double numbers bigger or equal than geometric average of this numbers.\n");
        do {
            try
            {
                //input
                System.out.println("Enter first unsigned double number:");
                Scanner in = new Scanner(System.in);
                num1 = in.nextDouble();
                if (num1 < 0)
                    throw new Exception("It's impossible to solve this exercise with num1 < 0!!!");
                System.out.println("Enter second unsigned double number:");
                num2 = in.nextDouble();
                if (num2 < 0)
                    throw new Exception("It's impossible to solve this exercise with num2 < 0!!!");
                //main block
                arithmeticAvg = (num1 + num2) / 2;
                geometricAvg = Math.sqrt(num1 * num2);
                //output
                System.out.printf("""
                        Arithmetic average: %f
                        Geometric average: %f
                        """, arithmeticAvg,geometricAvg);
                if (arithmeticAvg == geometricAvg)
                    System.out.println("Arithmetic average = Geometric average");
                else
                    System.out.println("Arithmetic average > Geometric average");
                goodFlag = true;
                in.close();
            }
            catch (Exception ex)
            {
                if (ex.getMessage() == null)
                    System.out.println("Invalid type!!!" + " Try again.");
                else
                    System.out.println(ex.getMessage() + " Try again.");
            }
        } while (!goodFlag);
    }
}

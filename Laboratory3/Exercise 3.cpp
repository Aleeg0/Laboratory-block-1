#include<iostream>
#include<math.h>
#include<iomanip>


int main()
{
    //initialization
    int counter = 0; //for input
    double eps = 0, a = 0, b = 0, xLast = 0, x = 0;
    bool isFinding = false, // for task
        goodFlag = false; // for exit loop
    //output the task
    std::cout << "Program solves this example: Ln(7.622x) - 8.59x + 5 = 0.\n";
    std::cout << "It's recommended to input epsilon in standard form.\n"
        << "Example: 1e-9\n";
    // loop for check inputted eps
    do
    {
        try
        {
            //input
            std::cout << "Input eps:\n";
            std::cin >> eps;
            if (std::cin.get() != '\n')
            {
                std::cin.clear();
                std::cin.ignore(20000,'\n');
                throw std::exception("Invalid type!!!");
            }
            if (eps > 1.0e-8)
                throw std::exception("Eps is too big!!!");
            if (eps < 1.0e-17)
                throw std::exception("Eps is too little!!!");
            goodFlag = true;// to exit the loop if user entered correct epsilon
        }
        catch (const std::exception& ex)
        {
            std::cout << ex.what() << " Try again!!!\n";
        }
    } while (!goodFlag);
    // output some info
    std::cout << "a and b are limits of isolation interval:\n";
    // loop for check inputted limits of isolation interval
    goodFlag = false;
    do
    {
        try
        {
            std::cout << "Enter a:\n";
            std::cin >> a;
            if (std::cin.get() != '\n')
            {
                std::cin.clear();
                std::cin.ignore(20000, '\n');
                throw std::exception("Invalid type!!!");
            }
            if (a < 0 || a == 0)
                throw std::exception("a cannot be less or equal than 0, because in the task there's logarithm!!!");
            std::cout << "Enter b:\n";
            std::cin >> b;
            if (std::cin.get() != '\n')
            {
                std::cin.clear();
                std::cin.ignore(20000, '\n');
                throw std::exception("Invalid type!!!");
            }
            if (b < 0 || b == 0)
                throw std::exception("b cannot be less or equal than 0, because in the task there's logarithm!!!");
            goodFlag = true;// to exit the loop if user entered correct limits
        }
        catch (const std::exception& ex)
        {
            std::cout << ex.what() << " Try again!!!\n";
        }
    } while (!goodFlag);
    // main block
    if ((double)100 / ((double)859 * a) < 1)
        xLast = a;
    else if ((double)100 / ((double)859 * b) < 1)
        xLast = b;
    else
    {
        isFinding = true;
        std::cout << "The problem is not solvable using the inputted limits!!!\n";
        return 0;
    }
    //output
    if (!isFinding) // creating table
        std::cout << std::endl << std::setw(11) << std::left << "   n"
                  << std::setw(13) << std::left << "x-1"
                  << "x" << std::endl;
    while (!isFinding)
    {
        x = (log(7.622 * xLast) + 5) / 8.59;
        std::cout << std::setw(5) << std::left << counter++ << " | "
                  << std::setw(10) << std::left << xLast << " | "
                  << x << std::endl;
        if (abs(x - xLast) < eps)
            isFinding = true;
        else
            xLast = x;
    }
    //output
    std::cout << "\nThe answer of this task is "
        << x << std::endl;
    return 0;
}
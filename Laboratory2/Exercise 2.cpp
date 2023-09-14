#include<iostream>


int main()
{
    // intialization
    int n = 0, sum = 0;
    bool goodFlag = false;
    // output the task
    std::cout << "Calculate the sum using the formula (-1)^i * 2^i:\n\n";
    // loop for check inputted symbols
    do
    {
        try
        {
            //input
            std::cout << "Enter n:\n";
            std::cin >> n;
            if (std::cin.get() != '\n')
            {
                std::cin.clear();
                std::cin.ignore(451251, '\n');
                throw std::exception("Invalid type!!!");
            }
            if (n < 1)
                throw std::exception("N cannot be less than 1!!!");
            goodFlag = true; // to exit the loop if user entered correct symbols  
        }
        catch (const std::exception& ex)
        {
            std::cout << ex.what() << " Try again\n";
        }
    } while (!goodFlag);
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
    std::cout << "Sum equal " << sum << std::endl;
    return 0;
}
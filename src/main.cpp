#include <iostream>
#include "addition.h"

int main()
{
    std::cout << "Hello World!" << std::endl;
    
    bool isOk = 0;
    if (!mclInitializeApplication(NULL, 0))
    {
        std::cout << "Could not initialize the application.\n";
        return -1;
    }
    std::cout << "isOk = " << isOk << std::endl;
    isOk = additionInitialize();
    std::cout << "isOk = " << isOk << std::endl;

    int a[6] = {
        1, 2, 3, 
        4, 5, 6
        };

    mwArray A(3, 2, mxINT32_CLASS); //修改此处：行列数互换
    A.SetData(a, 6);                //第二个参数为要设置的数的个数，大小可设为rows*cols

    mwArray B(3, 2, mxINT32_CLASS);
    addition(1, B, A, A);

    std::cout << A << "\n+\n" << A << "\n=\n" << B << std::endl;

    mclWaitForFiguresToDie(NULL);

    additionTerminate();
    mclTerminateApplication();
    
    std::cout << "Done!" << std::endl;

    std::cin.get();
    return 0;
}

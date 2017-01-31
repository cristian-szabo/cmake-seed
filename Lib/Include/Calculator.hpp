#pragma once

class PROJECTLIB_PUBLIC Calculator
{
public:

    Calculator();

    Calculator(int a, int b);

    ~Calculator();

    bool create(int a, int b);

    bool valid();

    void destroy();

    int sum();

    int mul();

    int diff();

    int div();

private:

    bool ready;

    int a;

    int b;

};

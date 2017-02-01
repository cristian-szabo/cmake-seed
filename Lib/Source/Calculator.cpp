#include "Config.hpp"

#include "Calculator.hpp"

Calculator::Calculator()
{
    ready = false;
}

Calculator::Calculator(int a, int b)
{
    ready = false;

    create(a, b);
}

Calculator::~Calculator()
{
    if (valid())
    {
        destroy();
    }
}

bool Calculator::create(int a, int b)
{
    if (valid())
    {
        throw std::runtime_error("Calculator object is initialised!");
    }

    this->a = a;

    this->b = b;

    ready = !ready;

    return true;
}

bool Calculator::valid()
{
    return ready;
}

void Calculator::destroy()
{
    if (!valid())
    {
        throw std::runtime_error("Calculator object is not initialised!");
    }

    a = b = 0;

    ready = !ready;
}

int Calculator::sum()
{
    return a + b;
}

int Calculator::mul()
{
    return a * b;
}

int Calculator::diff()
{
    return a - b;
}

int Calculator::div()
{
    if (!a)
    {
        return 0;
    }

    return a / b;
}

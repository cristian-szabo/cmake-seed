#include "Lib.hpp"

#include "Calculator.hpp"

#include <bandit/bandit.h>

using namespace bandit;
using namespace snowhouse;

go_bandit([]() {
    describe("Calculator Test", []() {
        Calculator calc;

        after_each([&]() {
            if (calc.valid())
            {
                calc.destroy();
            }
        });

        it("should multiply two numbers", [&]() {
            bool result = calc.create(2, 3);

            AssertThat(result, IsTrue());

            AssertThat(calc.mul(), Equals(6));
        });

        it("should addition two numbers", [&]() {
            bool result = calc.create(2, 3);

            AssertThat(result, IsTrue());

            AssertThat(calc.sum(), Equals(5));
        });

        it("should substract two numbers", [&]() {
            bool result = calc.create(3, 2);

            AssertThat(result, IsTrue());

            AssertThat(calc.diff(), Equals(1));
        });

        it("should divide two numbers", [&]() {
            bool result = calc.create(4, 2);

            AssertThat(result, IsTrue());

            AssertThat(calc.div(), Equals(2));
        });
    });
});

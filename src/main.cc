#include <cxxopts.hpp> // the main parser library
#include <iostream>
#include <stdio.h>
#include <string>

// mainly a test for try out anything to do with cxxopts, as I am not entirely sure if I want to use it.

int main(int argc, char **argv) {

  // Create an instance of the cxxopts::Options
    cxxopts::Options params(
        "oll",
        "A open-source program that aims to get Oculus Link working on Linux");

    params.add_options()
        ("h,help", "Prints this help menu")
        ("d,debug", "Enables or disables debugging", cxxopts::value<bool>()->default_value("false"));

    auto result = params.parse(argc, argv);

        std::cout << params.help() << "\n";
    
        bool IsDebug = result["debug"].as<bool>();

    if (IsDebug == true) {
        printf("True\n");
    }
    else {
        printf("False\n");
    }
}

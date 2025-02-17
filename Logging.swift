//
// Try Catch.swift
//
// Created by Noah Smith
// Created on 2025-02-16
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The Logging program asks the user to enter the lengths of the logs.
// It then tells the user the number of logs that can go on a truck.
// If the user enters erroneous input, it prompts them again to enter the lengths of the logs.

// Import foundation library
import Foundation

// Declare constants
let logLength1 = 0.25;
let logLength2 = 0.5;
let logLength3 = 1.0;
let maxTruckWeight = 1100.0;
let fullLogWeight = 20.0;

// Define the different possible error types
enum InputError: Error {
    case invalidInput
}

// Greet the user
print("Welcome to the logging program!")

// Loop until user input is valid
repeat {
    // Try to catch invalid input
    do {
        // Ask the user to enter the log length
        print("Enter the length of the logs (m): ")

        // typecast the log length from a string into a double, if possible
        if let logLengthString = readLine(), let logLength = Double(logLengthString) {
            // Check user's log length to make sure it is positive
            if logLength < 0 {
                // If user does not enter a positive number
                print("The log length must be positive.")
            // If the user's log length is not valid'
            } else if (logLength != 1 && logLength != 0.5 && logLength != 0.25) {
                // Tell the user the valid log lengths
                print("The log length must be ", logLength1, "m, ", logLength2, "m, or ", logLength3, "m.")
            } else {
                // Calculate the number of logs that can fit in the truck
                let intLogNum = Int(maxTruckWeight / (fullLogWeight * logLength))

                // Tell the user the number of logs that can fit into the truck
                print(intLogNum, "logs can fit in the truck.")

                // Break from the loop
                break
            }
        } else {
            // Catches the invalid input
            throw InputError.invalidInput
        }
    } catch InputError.invalidInput {
        // If user does not enter a number
        print("Please enter a number.")
    }
// Keep looping while the input is still invalid
} while (true)

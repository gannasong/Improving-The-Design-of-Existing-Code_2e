//
//  Customer.swift
//  Improving-The-Design-of-Existing-Code_2e
//
//  Created by SUNG HAO LIN on 2023/1/31.
//

import Foundation

public class Customer {
    private let name: String
    private var rentals: [Rental] = []

    public init(name: String) {
        self.name = name
    }

    public func addRental(arg: Rental) {
        rentals.append(arg)
    }

    public func getName() -> String {
        return name
    }

    public func statement() -> String {
        var frequentRenterPoints: Int = 0
        var result = "Rental Record for " + getName() + "\n"

        for each in rentals {
            frequentRenterPoints += each.getFrequentRenterPoints()
            result += " - " + each.getMovie().getTitle() + " $\(each.getCharge())\n"
        }
        // add footer lines
        result += "Amount owed is" + " $\(getTotalCharge(rentals))\n"
        result += "You earned" + " [\(frequentRenterPoints)]" + " frequent renter points"
        return result
    }

    private func amountFor(_ aRental: Rental) -> Double {
        return aRental.getCharge()
    }

    private func getTotalCharge(_ rentals: [Rental]) -> Double {
        var result: Double = 0.0

        for each in rentals {
            result += each.getCharge()
        }

        return result
    }
}

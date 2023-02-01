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
        var totalAmount: Double = 0
        var frequentRenterPoints: Int = 0
        var result = "Rental Record for " + getName() + "\n"

        for each in rentals {
            var thisAmount = 0.0
            // determine amounts for each line
            switch each.getMovie().getPriceCode() {
                case Movie.REGULAR:
                    thisAmount += 2
                    if each.getDaysRented() > 2 {
                        thisAmount += Double((each.getDaysRented() - 2)) * 1.5
                    }

                case Movie.NEW_RELEASE:
                    thisAmount += Double(each.getDaysRented() * 3)
                case Movie.CHILDRENS:
                    thisAmount += 1.5
                    if each.getDaysRented() > 3 {
                        thisAmount += Double((each.getDaysRented() - 3)) * 1.5
                    }
                default:
                    fatalError("❌ unexpected switch case")
            }

            // add frequent renter points
            frequentRenterPoints += 1
            // add bonus for a two day new release rental
            if each.getMovie().getPriceCode() == Movie.NEW_RELEASE
                && each.getDaysRented() > 1 {
                frequentRenterPoints += 1
            }
            // show figures for this rental
            result += " - " + each.getMovie().getTitle() + " $\(thisAmount)\n"
            totalAmount += thisAmount
        }
        // add footer lines
        result += "Amount owed is" + " $\(totalAmount)\n"
        result += "You earned" + " [\(frequentRenterPoints)]" + " frequent renter points"
        return result
    }
}

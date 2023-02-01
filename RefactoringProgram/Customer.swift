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
        var result = "Rental Record for " + getName() + "\n"

        for each in rentals {
            result += " - " + each.getMovie().getTitle() + " $\(each.getCharge())\n"
        }
        // add footer lines
        result += "Amount owed is" + " $\(getTotalCharge(rentals))\n"
        result += "You earned" + " [\(getTotaIFrequentRenterPoints(rentals))]" + " frequent renter points"
        return result
    }

    public func htmlStatement() -> String {
        var result = "<H1>Rentals for <EM>" + getName() + "</EM></H1><P>\n"

        for each in rentals {
            // show figures for each rental
            result += each.getMovie().getTitle() + ":" + "$\(each.getCharge())" + "<BR>\n"
        }
        // add footer lines
        result += "<P>You owe <EM>" + "$\(getTotalCharge(rentals))" + "</EM><P>\n"
        result += "On this rental you earned <EM>" + "$\(getTotaIFrequentRenterPoints(rentals))" + "</EM> frequent renter points<P>"
        return result
    }

    private func getTotalCharge(_ rentals: [Rental]) -> Double {
        var result: Double = 0.0

        for each in rentals {
            result += each.getCharge()
        }

        return result
    }

    private func getTotaIFrequentRenterPoints(_ rentals: [Rental]) -> Int {
        var result: Int = 0

        for each in rentals {
            result += each.getFrequentRenterPoints()
        }

        return result
    }
}

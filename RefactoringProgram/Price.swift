//
//  Price.swift
//  RefactoringProgram
//
//  Created by SUNG HAO LIN on 2023/2/2.
//

import Foundation

protocol PriceProtocol {
    func getPriceCode() -> Int
}

public class Price: PriceProtocol {
    func getPriceCode() -> Int {
        return Movie.REGULAR
    }

    public func getCharge(_ daysRented: Int) -> Double {
        var result: Double = 0

        switch getPriceCode() {
            case Movie.REGULAR:
                result += 2
                if daysRented > 2 {
                    result += Double((daysRented - 2)) * 1.5
                }

            case Movie.NEW_RELEASE:
                result += Double(daysRented * 3)
            case Movie.CHILDRENS:
                result += 1.5
                if daysRented > 3 {
                    result += Double((daysRented - 3)) * 1.5
                }
            default:
                fatalError("❌ unexpected switch case")
        }

        return result
    }
}

public class ChildrensPrice: Price {
    override func getPriceCode() -> Int {
        return Movie.CHILDRENS
    }
}

public class NewReleasePrice: Price {
    override func getPriceCode() -> Int {
        return Movie.NEW_RELEASE
    }
}

public class RegularPrice: Price {
    override func getPriceCode() -> Int {
        return Movie.REGULAR
    }
}

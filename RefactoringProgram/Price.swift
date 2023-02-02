//
//  Price.swift
//  RefactoringProgram
//
//  Created by SUNG HAO LIN on 2023/2/2.
//

import Foundation

protocol PriceProtocol {
    func getPriceCode() -> Int
    func getCharge(_ daysRented: Int) -> Double
}

public class Price: PriceProtocol {
    func getPriceCode() -> Int {
        return Movie.None
    }

    public func getCharge(_ daysRented: Int) -> Double {
        return 1
    }

    public func getFrequentRenterPoints(_ daysRented: Int) -> Int {
        return 1
    }
}

public class ChildrensPrice: Price {
    override func getPriceCode() -> Int {
        return Movie.CHILDRENS
    }

    public override func getCharge(_ daysRented: Int) -> Double {
        var result: Double = 1.5

        if daysRented > 3 {
            result += Double((daysRented - 3)) * 1.5
        }

        return result
    }
}

public class NewReleasePrice: Price {
    override func getPriceCode() -> Int {
        return Movie.NEW_RELEASE
    }

    public override func getCharge(_ daysRented: Int) -> Double {
        return Double(daysRented * 3)
    }

    public override func getFrequentRenterPoints(_ daysRented: Int) -> Int {
        return daysRented > 1 ? 2 : 1
    }
}

public class RegularPrice: Price {
    override func getPriceCode() -> Int {
        return Movie.REGULAR
    }

    public override func getCharge(_ daysRented: Int) -> Double {
        var result: Double = 2
        if daysRented > 2 {
            result += Double((daysRented - 2)) * 1.5
        }

        return result
    }
}

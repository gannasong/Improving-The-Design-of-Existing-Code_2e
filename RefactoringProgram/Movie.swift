//
//  Movie.swift
//  Improving-The-Design-of-Existing-Code_2e
//
//  Created by SUNG HAO LIN on 2023/1/31.
//

import Foundation

public class Movie {
    public static let REGULAR: Int = 0
    public static let NEW_RELEASE: Int = 1
    public static let CHILDRENS: Int = 2
    
    private let title: String
    private var priceCode: Int

    public init(title: String, priceCode: Int) {
        self.title = title
        self.priceCode = priceCode
    }

    public func getPriceCode() -> Int {
        return priceCode
    }

    public func setPriceCode(arg: Int) {
        priceCode = arg
    }

    public func getTitle() -> String {
        return title
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

    public func getFrequentRenterPoints(_ daysRented: Int) -> Int {
        if (getPriceCode() == Movie.NEW_RELEASE) && (daysRented > 1) {
            return 2
        } else {
            return 1
        }
    }
}

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
    private var priceCode: Int = 0
    private var price: Price!

    public init(title: String, priceCode: Int) {
        self.title = title
        self.setPriceCode(priceCode)
    }

    public func getPriceCode() -> Int {
        return price.getPriceCode()
    }

    public func setPriceCode(_ arg: Int) {
        switch arg {
            case Movie.REGULAR:
                price = RegularPrice()
            case Movie.CHILDRENS:
                price = ChildrensPrice()
            case Movie.NEW_RELEASE:
                price = NewReleasePrice()
            default:
                fatalError("❌ Incorrect Price Code")
        }
    }

    public func getTitle() -> String {
        return title
    }

    public func getCharge(_ daysRented: Int) -> Double {
        return price.getCharge(daysRented)
    }

    public func getFrequentRenterPoints(_ daysRented: Int) -> Int {
        if (getPriceCode() == Movie.NEW_RELEASE) && (daysRented > 1) {
            return 2
        } else {
            return 1
        }
    }
}

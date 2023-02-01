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
}

//
//  Rental.swift
//  Improving-The-Design-of-Existing-Code_2e
//
//  Created by SUNG HAO LIN on 2023/1/31.
//

import Foundation

public class Rental {
    private let movie: Movie
    private let daysRented: Int

    public init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }

    public func getDaysRented() -> Int {
        return daysRented
    }

    public func getMovie() -> Movie {
        return movie
    }
}

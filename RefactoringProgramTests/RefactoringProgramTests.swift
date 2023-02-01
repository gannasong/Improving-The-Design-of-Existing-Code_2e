//
//  RefactoringProgramTests.swift
//  RefactoringProgramTests
//
//  Created by SUNG HAO LIN on 2023/2/1.
//

import XCTest
@testable import RefactoringProgram

final class RefactoringProgramTests: XCTestCase {

    func test_print_statementResultEqualExpectResult() {
        let sut = Customer(name: "Edward")
        let expectedResult = anyResult()
        let anyMovie = anyMovie("Love Actually", 0)
        let anyRental = anyRental(anyMovie, 1)

        sut.addRental(arg: anyRental)
        let receivedResult = sut.statement()

        XCTAssertEqual(expectedResult, receivedResult)
    }

    // MARK: - Helpers
    private func anyMovie(_ title: String, _ priceCode: Int) -> Movie {
        return Movie(title: title, priceCode: priceCode)
    }

    private func anyRental(_ movie: Movie, _ daysRented: Int) -> Rental {
        return Rental(movie: movie, daysRented: daysRented)
    }

    private func anyResult() -> String {
        return """
            Rental Record for Edward
             - Love Actually $2.0
            Amount owed is $2.0
            You earned [1] frequent renter points
            """
    }
}

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
        let sut = makeSUT()
        let expectedResult = anyResult()
        let anyMovie = anyMovie("Love Actually", 0)
        let anyRental = anyRental(anyMovie, 1)

        sut.addRental(arg: anyRental)
        let receivedResult = sut.statement()

        XCTAssertEqual(expectedResult, receivedResult)
    }

    func test_print_htmlStatementResultEqualExpectResult() {
        let sut = makeSUT()
        let expectedResult = anyHtmlResult()
        let anyMovie = anyMovie("Love Actually", 0)
        let anyRental = anyRental(anyMovie, 1)

        sut.addRental(arg: anyRental)
        let receivedResult = sut.htmlStatement()
        print(receivedResult)
        XCTAssertEqual(expectedResult, receivedResult)
    }

    // MARK: - Helpers
    private func makeSUT() -> Customer {
        return Customer(name: "Edward")
    }

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

    private func anyHtmlResult() -> String {
        return """
            <H1>Rentals for <EM>Edward</EM></H1><P>
            Love Actually:$2.0<BR>
            <P>You owe <EM>$2.0</EM><P>
            On this rental you earned <EM>$1</EM> frequent renter points<P>
            """
    }
}

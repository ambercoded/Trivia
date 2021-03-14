//
//  QuestionViewControllerTest.swift
//  TriviaAppTests
//
//  Created by Adrian on 14.03.21.
//

import Foundation
import XCTest
@testable import TriviaApp

class QuestionViewControllerTest: XCTestCase {
    func test_viewDidLoad_rendersHeaderText() {
        let sut = makeSUT(question: "Q1", options: [])
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }

    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
        let sut = makeSUT(question: "Q1", options: [])
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }

    func test_viewDidLoad_oneOption_rendersOneOption() {
        let sut = makeSUT(question: "Q1", options: ["A1"])
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }

    func test_viewDidLoad_oneOption_rendersOneOptionText() {
        let sut = makeSUT(question: "Q1", options: ["A1"])
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }

    // MARK: Helper
    func makeSUT(question: String, options: [String]) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options)
        _ = sut.view // load the view
        return sut
    }
}

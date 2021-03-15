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
        XCTAssertEqual(makeSUT(question: "Q1").headerLabel.text, "Q1")
    }

    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
    }

    func test_viewDidLoad_rendersOptions() {
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.numberOfRows(inSection: 0), 2)
    }

    func test_viewDidLoad_oneOption_rendersOptionTexts() {
        XCTAssertEqual(makeSUT(options: ["A1"]).tableView.title(at: 0), "A1")
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.title(at: 1), "A2")
        XCTAssertEqual(makeSUT(options: ["A1", "A2", "A3"]).tableView.title(at: 2), "A3")
    }

    // MARK: Helpers

    func makeSUT(question: String = "", options: [String] = []) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options)
        _ = sut.view // load the view
        return sut
    }
}

private extension UITableView {
    func cell(at row: Int) -> UITableViewCell? {
        let indexPath = IndexPath(row: row, section: 0)
        return self.dataSource?.tableView(self, cellForRowAt: indexPath)
    }

    func title(at row: Int) -> String? {
        let cell = self.cell(at: row)
        return cell?.textLabel?.text
    }
}

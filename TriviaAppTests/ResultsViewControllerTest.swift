//
//  ResultsViewControllerTest.swift
//  TriviaAppTests
//
//  Created by Adrian on 15.03.21.
//

import XCTest
@testable import TriviaApp

class ResultsViewControllerTest: XCTestCase {
    func test_viewDidLoad_renderSummary() {
        XCTAssertEqual(makeSUT(summary: "A summary").headerLabel.text, "A summary")
    }

    func test_viewDidLoad_withAnswers_rendersAnswers() {
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(answers: [makeCorrectDummyAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }

    func test_viewDidLoad_withCorrectAnswer_renderCorrectAnswerCell() {
        let sut = makeSUT(answers: [makeCorrectDummyAnswer()])
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.cell(at: indexPath.row) as? CorrectAnswerCell

        XCTAssertNotNil(cell)
    }

    func test_viewDidLoad_withWrongAnswer_renderWrongAnswerCell() {
        let sut = makeSUT(answers: [makeWrongDummyAnswer()])
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.cell(at: indexPath.row) as? WrongAnswerCell

        XCTAssertNotNil(cell)
    }

    // MARK: Helpers
    func makeSUT(summary: String = "", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }

    func makeCorrectDummyAnswer() -> PresentableAnswer {
        return PresentableAnswer(isCorrect: true)
    }

    func makeWrongDummyAnswer() -> PresentableAnswer {
        return PresentableAnswer(isCorrect: false)
    }
}

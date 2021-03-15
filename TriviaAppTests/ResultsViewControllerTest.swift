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
        XCTAssertEqual(makeSUT(answers: [makeAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }

    func test_viewDidLoad_withCorrectAnswer_configuresCell() {
        let answer = makeAnswer(question: "Q1", answer: "A1")
        let sut = makeSUT(answers: [answer])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell

        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.answerLabel.text, "A1")
    }

    func test_viewDidLoad_withWrongAnswer_configuresCell() {
        let answer = makeAnswer(
            question: "Q1",
            answer: "A1",
            wrongAnswer: "A2")
        let sut = makeSUT(answers: [answer])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell

        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.correctAnswerLabel.text, "A1")
        XCTAssertEqual(cell?.wrongAnswerLabel.text, "A2")
    }

    func test_viewDidLoad_withWrongAnswer_renderWrongAnswerCell() {
        let sut = makeSUT(answers: [makeAnswer(wrongAnswer: "A3")])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell

        XCTAssertNotNil(cell)
    }

    // MARK: Helpers
    func makeSUT(summary: String = "", answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }

    func makeAnswer(question: String = "",
                    answer: String = "",
                    wrongAnswer: String? = nil
    ) -> PresentableAnswer {
        PresentableAnswer(
            question: question,
            answer: answer,
            wrongAnswer: wrongAnswer)
    }
}

//
//  ResultsViewController.swift
//  TriviaApp
//
//  Created by Adrian on 15.03.21.
//

import UIKit

struct PresentableAnswer {
    let isCorrect: Bool
}

class CorrectAnswerCell: UITableViewCell {

}

class WrongAnswerCell: UITableViewCell {

}

class ResultsViewController: UIViewController {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    private var summary = ""
    private var answers = [PresentableAnswer]()

    convenience init(summary: String, answers: [PresentableAnswer]) {
        self.init()
        self.summary = summary
        self.answers = answers
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = summary
    }
}

// MARK: - Table View DataSource
extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answerIsCorrect = answers[indexPath.row].isCorrect
        return answerIsCorrect ? CorrectAnswerCell() : WrongAnswerCell()
    }
}

// MARK: - Table View Delegate
extension ResultsViewController: UITableViewDelegate {

}

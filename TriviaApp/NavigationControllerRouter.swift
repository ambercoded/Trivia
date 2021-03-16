//  Created by Adrian on 16.03.21.
/* the concrete router implementation for the iOS Version that
  uses a navigationController */

import UIKit
import TriviaEngine

class NavigationControllerRouter: Router {
    private let navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
        navigationController.pushViewController(UIViewController(), animated: false)
    }

    func routeTo(result: Result<String, String>) {

    }

}

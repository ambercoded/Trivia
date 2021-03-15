//
//  AppDelegate.swift
//  TriviaApp
//
//  Created by Adrian on 14.03.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

//        let questionVC = QuestionViewController(
//            question: "What's the capital of Germany?",
//            options: ["Berlin", "Munich"]) { selectedAnswer in
//            print("selected: \(selectedAnswer)")
//        }

        let resultVC = ResultsViewController(summary: "You got 1/2 correct.", answers: [PresentableAnswer(question: "What's the capital of Germany?", answer: "Berlin", wrongAnswer: "Munich")])

        self.window = window
        window.rootViewController = resultVC
        window.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}


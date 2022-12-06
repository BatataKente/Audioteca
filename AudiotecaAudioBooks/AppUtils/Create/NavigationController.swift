//
//  NavigationController.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

extension Create {
    static func navigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = UIColor.clear
        navigationController.navigationBar.standardAppearance = standardAppearance
        navigationController.navigationBar.scrollEdgeAppearance = standardAppearance
        return navigationController
    }
}

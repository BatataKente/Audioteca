//
//  Setup.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

protocol Setup {
    func configure()
    func constrain()
    func setup()
}

extension Setup {
    func constrain() {}
    func setup() {
        configure()
        constrain()
    }
}


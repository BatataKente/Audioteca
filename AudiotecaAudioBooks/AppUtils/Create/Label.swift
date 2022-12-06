//
//  Label.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

extension Create {
    static func label(_ text: String? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }
}

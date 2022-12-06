//
//  ImageView.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

extension Create {
    static func imageView(_ image: UIImage? = nil) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}

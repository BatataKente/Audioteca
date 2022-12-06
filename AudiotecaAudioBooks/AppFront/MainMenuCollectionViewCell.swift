//
//  MainMenuCollectionViewCell.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

class MainMenuCollectionViewCell: UICollectionViewCell {
    private let imageView = Create.imageView()
    private let label: UILabel = {
        let label = Create.label()
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(_ text: String) {
        label.text = text
    }
}

extension MainMenuCollectionViewCell: Setup {
    func configure() {
        addSubviews([imageView, label])
    }
    func constrain() {
        imageView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing])
        label.enableAutoLayout
            .constraint(attributesAttributes: [.top: .bottom], to: imageView)
            .constraint(attributes: [.leading, .trailing, .bottom])
    }
}

//
//  MainMenuCollectionViewCell.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

class MainMenuCollectionViewCell: UICollectionViewCell {
    private lazy var imageView = UIImageView()
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
    func clear() {
        imageView.image = nil
        label.text = nil
    }
    func setup(_ book: Way) {
        label.text = book.name
        guard let image = book.links?.image else {return}
        Task {
            guard let data = await Network.call(from: URL(string: image)) else {return}
            imageView.image = UIImage(data: data)
        }
    }
}

extension MainMenuCollectionViewCell: Setup {
    func configure() {
        contentView.addSubviews([imageView, label])
    }
    func constrain() {
        imageView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom])
        label.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .bottom])
    }
}

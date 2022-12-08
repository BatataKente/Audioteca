//
//  CollectionView.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

protocol CollectionViewDelegate: AnyObject {
    func collectionView(didSelectItemAt indexPath: IndexPath)
    func collectionView(_ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath) -> CGSize
    func collectionView(_ identifier: String, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell?
}

extension CollectionViewDelegate {
    func collectionView(didSelectItemAt indexPath: IndexPath) {}
    func collectionView(_ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }
}

class CollectionView: UICollectionView {
    weak var collectionViewDelegate: CollectionViewDelegate?
    private let identifier = "Cell"
    var numberOfCells: Int = 0 {
        didSet {
            reloadData()
        }
    }
    init<T: UICollectionViewCell>(typeOfCell: T.Type) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        setup()
        register(T.self, forCellWithReuseIdentifier: identifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionView: Setup {
    func configure() {
        delegate = self
        dataSource = self
    }
}

extension CollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionViewDelegate?.collectionView(didSelectItemAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (collectionViewDelegate?.collectionView(identifier, cellForItemAt: indexPath)) ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionViewDelegate?.collectionView(
            collectionView, sizeForItemAt: indexPath
        ) ?? CGSize(width: collectionView.frame.width,
                    height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

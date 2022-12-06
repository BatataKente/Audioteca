//
//  ViewController.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

class MainMenuViewController: UIViewController {
    private var content: [Way] = [] {
        didSet {
            collectionView.numberOfCells = content.count
        }
    }
    private let collectionView: CollectionView = {
        let collectionView = CollectionView(typeOfCell: MainMenuCollectionViewCell.self)
        collectionView.backgroundColor = .systemPink
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if let content = Network.read([Way].self, from: "Ways") {
            self.content = content
            print(content)
        }
    }
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        collectionView.reloadData()
    }
}

extension MainMenuViewController: Setup {
    func configure() {
        title = "\(type(of: self))".removeLast(14)
        view.backgroundColor = .systemPurple
        view.addSubview(collectionView)
        collectionView.collectionViewDelegate = self
    }
    func constrain() {
        collectionView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom],
                        to: view.safeAreaLayoutGuide)
    }
}

extension MainMenuViewController: CollectionViewDelegate {
    func collectionView(didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func setupCell(_ identifier: String, indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                      for: indexPath) as? MainMenuCollectionViewCell
        cell?.setup(content[indexPath.row])
        return cell
    }
}


//
//  Hierarchy.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
    func removeSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
    func removeSubviews<T>(ofType: T.Type) {
        for view in subviews where (view as? T) != nil {
            view.removeFromSuperview()
        }
    }
}

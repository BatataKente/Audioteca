//
//  RemoveLast.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import Foundation

extension String {
    func removeLast(_ times: Int) -> String {
        var result = self
        for _ in 0...times-1 {
            result.removeLast()
        }
        return result
    }
}

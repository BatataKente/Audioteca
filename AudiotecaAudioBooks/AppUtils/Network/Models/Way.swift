//
//  Way.swift
//  AudiotecaAudioBooks
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import Foundation

struct Way: Codable {
    struct URLs: Codable {
        let video, image: String?
    }
    let name: String?
    let links: URLs?
}

//
//  Artist.swift
//  Spotify
//
//  Created by POLVRITY on 14.11.2022.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}

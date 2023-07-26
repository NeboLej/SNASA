//
//  SpaceModel.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

struct SpaceModel: Codable {
    let copyright, date, explanation: String
    let hdurl: String
    let mediaType, serviceVersion, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}

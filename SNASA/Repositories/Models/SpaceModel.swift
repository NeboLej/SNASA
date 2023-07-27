//
//  SpaceModel.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

struct SpaceModel: Codable {
    let date: String
    let explanation: String
    let hdurl: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String
    let copyright: String

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url, copyright
    }
    
    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        self.explanation = try container.decodeIfPresent(String.self, forKey: .explanation) ?? ""
        self.hdurl = try container.decodeIfPresent(String.self, forKey: .hdurl) ?? ""
        self.mediaType = try container.decodeIfPresent(String.self, forKey: .mediaType) ?? ""
        self.serviceVersion = try container.decodeIfPresent(String.self, forKey: .serviceVersion) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright) ?? ""
    }
}

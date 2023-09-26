//
//  SpaceModel.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

struct SpaceModel: Codable, Equatable {
    let date: String
    let explanation: String
    let hdurl: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String
    let copyright: String
    
    init(date: String, explanation: String, hdurl: String, mediaType: String, serviceVersion: String, title: String, url: String, copyright: String) {
        self.date = date
        self.explanation = explanation
        self.hdurl = hdurl
        self.mediaType = mediaType
        self.serviceVersion = serviceVersion
        self.title = title
        self.url = url
        self.copyright = copyright
    }
    
    static func == (lhs: SpaceModel, rhs: SpaceModel) -> Bool {
        lhs.date == rhs.date &&
        lhs.hdurl == rhs.hdurl &&
        lhs.mediaType == rhs.mediaType &&
        lhs.serviceVersion == rhs.serviceVersion &&
        lhs.title == rhs.title &&
        lhs.url == rhs.url &&
        lhs.copyright == rhs.copyright
    }

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url, copyright
    }

    init(from decoder: Decoder) throws {
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

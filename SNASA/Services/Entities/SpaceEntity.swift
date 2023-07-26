//
//  SpaceEntity.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

protocol SpaceProtocol {
    
}

class SpaceEntity {
    let date: String
    let explanation: String
    let hdurl: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String
    
    init(date: String, explanation: String, hdurl: String, mediaType: String, serviceVersion: String, title: String, url: String) {
        self.date = date
        self.explanation = explanation
        self.hdurl = hdurl
        self.mediaType = mediaType
        self.serviceVersion = serviceVersion
        self.title = title
        self.url = url
    }
}

extension SpaceEntity {
    convenience init(model: SpaceModel) {
        self.init(date: model.date, explanation: model.explanation, hdurl: model.hdurl, mediaType: model.mediaType, serviceVersion: model.serviceVersion, title: model.title, url: model.url)
    }
}

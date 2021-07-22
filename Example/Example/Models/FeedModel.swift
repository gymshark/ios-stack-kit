//
//  FeedModel.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import Foundation

struct FeedModel {
    
    let id: String
    let title: String
    let subtitle: String?
    let tag: String?
    let image: String?
    
    init(id: String = UUID().uuidString, title: String, subtitle: String? = nil, tag: String? = nil, image: String?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.tag = tag
        self.image = image
    }
}

//
//  FeedItemViewModel.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import Foundation

final class FeedItemViewModel {
    
    // MARK: - Dependencies
    
    private let feedItem: FeedModel
    
    // MARK: - Init
    
    init(feedItem: FeedModel){
        self.feedItem = feedItem
    }
    
    // MARK: - Interface
    
    var titleText: String {
        return feedItem.title.uppercased()
    }
    
    var subtitleText: String? {
        return feedItem.subtitle
    }
    
    var imageName: String {
        return feedItem.image ?? ""
    }
    
    var tagText: String? {
        return feedItem.tag?.uppercased()
    }

    var isTagHidden: Bool {
        return tagText == nil
    }
}

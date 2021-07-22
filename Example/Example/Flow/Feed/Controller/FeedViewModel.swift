//
//  FeedViewModel.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import Foundation
import SharkUtils

enum Feeditem {
    case header(HeaderCellViewModel)
    case feedItem(FeedItemViewModel)
    case order(OrderCellViewModel)
}

final class FeedViewModel {
        
    // MARK: - Interface
    
    func cellItem(for indexPath: IndexPath) -> Feeditem? {
        return items[safe: indexPath.row]
    }
    
    var numberOfRows: Int {
        return items.count
    }
    
    var numberOfSections: Int {
        return 1
    }
}

extension FeedViewModel {
    
    // MARK: - Items
    
    private var items: [Feeditem] {
        var items: [Feeditem] = [.header(HeaderCellViewModel())]
        
        var feedItems: [Feeditem] = feedVMs.compactMap({ .feedItem($0) })
        
        if let orderVM = orderViewModel {
            feedItems.insert(.order(orderVM), at: (feedItems.isEmpty) ? 0 : 1)
        }
        
        items.append(contentsOf: feedItems)
        
        return items
    }
    
    // MARK: - View Models
    
    private var orderViewModel: OrderCellViewModel? {
        guard let order = myOrder else { return nil }
        return OrderCellViewModel(order: order)
    }
    
    private var feedVMs: [FeedItemViewModel] {
        return feedModels.compactMap({ FeedItemViewModel(feedItem: $0) })
    }
}

extension FeedViewModel {
    
    // MARK: - Stub data
    
    private var feedModels: [FeedModel] {
        return [
            FeedModel(title: "The future is functional", subtitle: "Get after your goals in new Apex",
                      tag: "new releases", image: "functional-male"),
            FeedModel(title: "Press reset", subtitle: "The newest collection is here", image: "reset"),
            FeedModel(title: "The future is functional", subtitle: "Get after your goals in new Apex",
                      tag: "new releases", image: "functional-female"),
            FeedModel(title: "Raise the bar", subtitle: "Level up in Vital Rise", image: "raise"),
            FeedModel(title: "Must haves", subtitle: "Your key piece inspo", image: "must-have"),
            FeedModel(title: "Take on the heat", subtitle: "In summer activewear", image: "flex")
        ]
    }
    
    private var myOrder: OrderModel? {
        return OrderModel(status: "FUFILLED",
                          items: [ProductModel(productTitle: "Arrival Shorts", image: "shorts"),
                                  ProductModel(productTitle: "Arrival T-Shirt", image: "tshirt")])
    }
}

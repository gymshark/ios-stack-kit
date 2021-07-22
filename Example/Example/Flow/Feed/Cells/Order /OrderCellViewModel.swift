//
//  OrderCellViewModel.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import Foundation

struct OrderCellViewModel {
    
    // MARK: - Dependenies
    
    private let order: OrderModel
    
    // MARK: - Init
    
    init(order: OrderModel){
        self.order = order
    }
    
    // MARK: - Interface
    
    var titleText: String {
        return ("IT'S " + order.status).uppercased()
    }
    
    var subtitleText: String {
        let df = DateFormatter()
        df.dateFormat = "dd MMM yy"
        return "Ordered on " + df.string(from: order.orderDate)
    }
    
    var images: [String]? {
        return ["tshirt", "top", "hoodie", "shorts", "shorts", "shorts"]
    }
}

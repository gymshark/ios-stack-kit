//
//  OrderModel.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import Foundation

struct OrderModel {
    
    let id: String
    let status: String
    let orderDate: Date
    let items: [ProductModel]
    
    init(id: String = UUID().uuidString,
         status: String,
         orderDate: Date =  Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(),
         items: [ProductModel]) {
        
        self.id = id
        self.status = status
        self.orderDate = orderDate
        self.items = items
    }
}

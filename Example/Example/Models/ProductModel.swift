//
//  ProductModel.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import Foundation

struct ProductModel {
    
    let id: String
    let productTitle: String
    let image: String
    
    init(id: String = UUID().uuidString, productTitle: String, image: String) {
        self.id = id
        self.productTitle = productTitle
        self.image = image
    }
}

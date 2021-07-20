//
//  CGSize.swift
//  
//
//  Created by Russell Warwick on 07/07/2021.
//

import CoreGraphics

public extension CGSize {
    
    init(w: CGFloat = .zero, h: CGFloat = .zero){
        self.init(width: w, height: h)
    }
    
    static func square(_ value: CGFloat) -> CGSize {
        return .init(width: value, height: value)
    }
    
    static func width(_ value: CGFloat) -> CGSize {
        return .init(width: value, height: .zero)
    }
    
    static func height(_ value: CGFloat) -> CGSize {
        return .init(width: .zero, height: value)
    }
}

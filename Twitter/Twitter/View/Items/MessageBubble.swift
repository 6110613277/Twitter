//
//  MessageBubble.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct MessageBubble: Shape {
    var ownAccout: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, ownAccout ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
}
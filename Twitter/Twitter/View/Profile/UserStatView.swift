//
//  UserStatView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        HStack {
            Text("\(value)")
                .font(.system(size: 15,weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
                .padding(.trailing,5)
        }
        .frame(width: 100, alignment: .leading)
    }
}


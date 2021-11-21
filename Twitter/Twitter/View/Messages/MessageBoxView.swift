//
//  MessageBoxView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct MessageBoxView: View {
    @ObservedObject var viewModel : MessageViewModel
    
    let items = [GridItem(),GridItem(),GridItem()]
    
    init(user: User) {
        viewModel = MessageViewModel(user: user)
    }
    var body: some View {
        GeometryReader { proxy in
            LazyVGrid(columns: items, spacing: 2) {
                ForEach(viewModel.messages){ post in
                    NavigationLink(destination: MessageChatView(user: viewModel.user)){
                        Text("Message")
                            .font(.system(size: 14 , weight: .semibold))
                            .frame(width: 172, height: 32)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    
                    if let user = viewModel.user {
                        NavigationLink(destination: MessageChatView(user: user)){
                            Text("Message")
                                .font(.system(size: 14 , weight: .semibold))
                                .frame(width: 172, height: 32)
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                    }
                    
                }
            }
        }
    }
}


//
//  ProfileButtonView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct ProfileButtonView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @State var editProfileShow = false
    var didFollow: Bool {
        viewModel.user.didFollow ?? false
    }
    var body: some View {
        if viewModel.user.isCurrentUse {
            Button {
                editProfileShow.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 14 , weight: .semibold))
                    .frame(width: 100, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }.sheet(isPresented: $editProfileShow, onDismiss: nil) {
                EditProfileView(user: $viewModel.user)
            }
        } else {
            HStack(spacing: 16){
                
                Image(systemName: "bell")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 1)
                    )


                
                if let user = viewModel.user {
                    NavigationLink(destination: MessageChatView(user: user)){
                        Image(systemName: "envelope")
                            .frame(width: 32, height: 32)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
                
                Button {
                    didFollow ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(didFollow ? "Following" : "Follow")
                        .font(.system(size: 14 , weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.gray, lineWidth: 1)
                                //.stroke(Color.gray, lineWidth: didFollow ? 1: 0)
                        )
                }
                .cornerRadius(3)
            }
        }
    }
}


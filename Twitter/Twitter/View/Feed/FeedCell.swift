//
//  FeedCell.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI
import Kingfisher


struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
 

    var didLike : Bool {
        viewModel.post.didLike ?? false
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.post.user {
                NavigationLink(destination: ProfileView(user: user)){
                    HStack{
                        if let imageURL = viewModel.post.ownerImageURL {
                            KFImage(URL(string: imageURL))
                                .resizeTo(width: 65, height: 65)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizeTo(width: 65, height: 65)
                        }
                        VStack(alignment: .leading){
                            HStack{
                                Text(viewModel.post.ownerUsername)
                                    .font(.system(size: 14, weight: .semibold))
                                    .frame(alignment:.leading)
                                Text(viewModel.timestamp)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                    .padding(.leading, 8)
                                    .padding(.top, -2)
                            }
                            Text(" \(viewModel.post.caption)")
                                .font(.system(size: 14))
                        }
                    }
                    .padding([.leading, .bottom, .top],8)
                }
            }
            if viewModel.post.imageURL != ""{
                KFImage(URL(string: viewModel.post.imageURL))
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(20)
                    .frame(maxHeight: 440)
                    .clipped()
                    .padding(.leading, 75)
                    .padding(.trailing, 10)
            }
            
            
            HStack{
                NavigationLink(destination: CommentsView(post: viewModel.post)){
                    Image(systemName: "message")
                        .resizeTo(width: 20, height: 20)
                        .font(.system(size: 20))
                        //.padding(4)
                }
                .padding(.trailing, 50)
                
                Image(systemName: "repeat")
                    .resizeTo(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(.trailing, 50)
                
                Button{
                    didLike ? viewModel.unLike() : viewModel.like()
                }label: {
                    HStack {
                        Image(systemName: didLike ? "heart.fill" : "heart")
                            .resizeTo(width: 20, height: 20)
                            .foregroundColor(didLike ? .red:.black)
                            .font(.system(size: 20))
                            .padding(4)
                        Text(viewModel.likeText)
                            .font(.system(size: 14, weight: .semibold))
                            //.padding(.leading, 8)
                            .padding(.bottom, 0.5)

                    }
                }.padding(.trailing, 50)
                
                
                Image(systemName: "square.and.arrow.up")
                    .resizeTo(width: 20, height: 20)
                    .font(.system(size: 20))
                    //.padding(4)
            }
            .padding(.leading, 75)
            
            /*Text(viewModel.likeText)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 0.5)*/
            /*HStack{
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14,weight: .semibold)) +
                    Text(" \(viewModel.post.caption)")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 8)
            
            Text(viewModel.timestamp)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)*/
        }
    }
}




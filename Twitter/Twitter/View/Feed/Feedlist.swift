//
//  Feedlist.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 22/11/2564 BE.
//

import SwiftUI
import Kingfisher


struct Feedlist: View {
    @ObservedObject var viewModel: FeedCellViewModel
    var didLike : Bool {
        viewModel.post.didLike ?? false
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.post.user {
                HStack {
                    if let imageURL = viewModel.post.ownerImageURL {
                    KFImage(URL(string: imageURL))
                        .resizeTo(width:48,height: 48)
                        .clipShape(Circle())
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizeTo(width:48,height: 48)
                            .clipShape(Circle())
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
                    
                    Spacer()
                }
                /*NavigationLink(destination: ProfileView(user: user)){
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
                    //.padding([.leading, .bottom, .top],8)
                }*/
            }
        }
        
    }
}

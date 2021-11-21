//
//  PostListView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 22/11/2564 BE.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var posts: [Post] {
        searchText.isEmpty ? viewModel.posts : viewModel.filterPosts(withText: searchText)
    }
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(posts){ post in
                    Feedlist(viewModel: FeedCellViewModel(post: post))
                        .padding(.leading, 8)
                }
            }
        }
    }
}

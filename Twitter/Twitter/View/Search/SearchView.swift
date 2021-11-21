//
//  SearchView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//


import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    @State var searchText = ""
    @State var inSearchMode = false
    
    //upload button
    @State var scrollViewOffset: CGFloat=0
    @State var startOffset: CGFloat = 0
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            ZStack{
                if inSearchMode {
                    ScrollView {
                        UserListView(viewModel: viewModel, searchText: $searchText)
                        PostListView(viewModel: viewModel, searchText: $searchText)
                    }
                } else {
                    //PostGridView(config: .explore)
                    UserListView(viewModel: viewModel, searchText: $searchText)
                    //PostListView(viewModel: viewModel, searchText: $searchText)
                }
            }
            .overlay(
                GeometryReader{proxy -> Color in
                    DispatchQueue.main.async {
                        if startOffset == 0 {
                            self.startOffset = proxy.frame(in: .global).minY
                        }
                        
                        let offset = proxy.frame(in: .global).minY
                        self.scrollViewOffset = offset - startOffset
                        
                        print(self.scrollViewOffset)
                    }
                    return Color.clear
                }
                .frame(width: 0, height: 0)
            )
        }
        .overlay(
            NavigationLink(destination: UploadPostView()){
                Image("tweet-logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .scaledToFit()
                    .padding()
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
            }
            //.padding(.trailing)
            
            ,alignment: .bottomTrailing
        )

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


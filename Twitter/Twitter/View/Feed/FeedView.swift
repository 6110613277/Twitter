//
//  FeedView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    @State var scrollViewOffset: CGFloat=0
    @State var startOffset: CGFloat = 0
    
    var body: some View {
        
        ScrollView {
            VStack{
                ForEach(viewModel.posts){ post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

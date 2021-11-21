//
//  ProfileView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel = FeedViewModel()
    @State var user: User
    
    @State private var selection = 0
    
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate
        case vanilla
        case strawberry

        var id: String { self.rawValue }
    }
    @State private var selectedFlavor = Flavor.chocolate
    
    
    let tabs: [Tab] = [
        .init(title: "Tweets"),
        .init(title: "Tweets&replies"),
        .init(title: "Media"),
        .init(title: "Likes")
    ]
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ScrollView{
            VStack(spacing:32){
                ProfileHeaderView(ViewModel: ProfileViewModel(user: user))
                    //.padding()
                
                /*if let currentProfileID = user.id {
                    PostGridView(config: .profile(currentProfileID)).padding()
                }*/
                /*Picker("", selection: $selection) {
                    Text("Tweets").tag(0)
                    Text("Tweets&replies").tag(1)
                    Text("Media").tag(2)
                    Text("Likes").tag(3)
                }.pickerStyle(SegmentedPickerStyle())*/
                
                Picker("", selection: $selection) {
                    Text("Tweets").tag(0)
                    Text("Tweets&replies").tag(1)
                    Text("Media").tag(2)
                    Text("Likes").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                
                if selection == 0 {
                    if let currentProfileID = user.id {
                        PostGridView(config: .profile(currentProfileID))
                    }
                }
                if selection == 1 {
                    FeedView()
                        .padding(.leading,10)
                        .padding(.trailing,15)
                }

                
            }
        }
    }
}


//
//  MainView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI
import Firebase
import Kingfisher



struct MainView: View {
    
    @State var user : User
    @Binding var selectedIndex: Int
    var body: some View {
        
        NavigationView {
            TabView(selection: $selectedIndex){
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(1)
                
                /*UploadPostView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                    .tag(2)
                */
                NotificationView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    
                    .tabItem {
                        Image(systemName: "bell")
                    }
                    .tag(2)
                
                //ProfileView(user: user)
                MessageBoxView(user: user)
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "envelope")
                        //Image(systemName: "person.crop.circle.fill")
                    }
                    .tag(3)
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            //.navigationBarItems(trailing: logOutButton)
            .navigationBarItems(leading: ProfileButton)
            .accentColor(.black)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthViewModel.shared.signOut()
                    } label: {
                        Text("Log Out")
                            .foregroundColor(.black)
                    }
                }
            }

        }
    }
    var logOutButton : some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            Text("Log Out")
                .foregroundColor(.black)
        }
    }
    
    var ProfileButton : some View {
        NavigationLink(destination: ProfileView(user: user)){
            if let imageURL = user.profileImageURL {
                KFImage(URL(string: imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    //.padding(.leading,16)
            } else {
            Image(systemName: "person.crop.circle.fill")
                .resizeTo(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading, 16)
            }

        }
    }
    
    /*var ProfileButt : some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            if let imageURL = viewModel.post.ownerImageURL {
                KFImage(URL(string: imageURL))
                    .resizeTo(width: 65, height: 65)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizeTo(width: 65, height: 65)
            }
        }
    }*/
            
    /*var ProfileButton : some View {
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
            }
        }
    }*/
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Search"
        case 2: return "Notifications"
        case 3: return "Messages"
        default: return ""
        }
    }
    
   
}

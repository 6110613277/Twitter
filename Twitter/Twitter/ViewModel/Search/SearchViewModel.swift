//
//  SearchViewModel.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI
import Firebase

class SearchViewModel : ObservableObject {
    @Published var users = [User]()
    @Published var posts = [Post]()
    
    init() {
        fetchUsers()
        fetchPost()
    }
    
    func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            self.users = documents.compactMap { try? $0.data(as: User.self) }
        }
    }
    
    func fetchPost() {
        Firestore.firestore().collection("posts").getDocuments { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            self.posts = documents.compactMap { try? $0.data(as: Post.self) }
        }
    }
    
    func filterUsers(withText input: String) -> [User] {
        let lowercasedInput = input.lowercased()
        return users.filter { $0.fullname.lowercased().contains(lowercasedInput) ||
            $0.username.lowercased().contains(lowercasedInput)
        }
    }
    
    func filterPosts(withText input: String) -> [Post] {
        let lowercasedInput = input.lowercased()
        return posts.filter {
            $0.caption.lowercased().contains(lowercasedInput)
        }
    }
}

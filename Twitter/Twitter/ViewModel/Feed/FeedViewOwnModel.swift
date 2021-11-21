//
//  FeedViewOwnModel.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 22/11/2564 BE.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FeedViewOwnModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfig
    
    init(config: PostGridConfig) {
        self.config = config
        fetchPosts()
    }
    
    func fetchPosts() {
        switch config {
        case .explore:
            fetchPostsAll()
        case .profile(let uid):
            fetchPostsProfile(withUID: uid)
        }
    }
    
    func fetchPostsAll() {
        Firestore.firestore().collection("posts").getDocuments {(snap,error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            
            self.posts = documents.compactMap {
                try? $0.data(as: Post.self)
            }
        }
    }
    
    func fetchPostsProfile(withUID uid:String) {
        Firestore.firestore().collection("posts").whereField("ownerUID" , isEqualTo: uid).getDocuments {(snap,error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            
            self.posts = documents.compactMap {
                try? $0.data(as: Post.self)
            }
        }
    }
    
}

//
//  User.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {
    let username: String
    let email: String
    var fullname: String
    var profileImageURL : String?
    @DocumentID var id: String?
    var stats : UserStatsData?
    
    mutating func updateProfileImageURL(url : String) {
        profileImageURL = url
    }
    
    var isCurrentUse:Bool {
        AuthViewModel.shared.userSession?.uid == id
    }
    
    var didFollow: Bool? = false
    var bio: String?
}

struct UserStatsData : Decodable {
    var following: Int
    var followers: Int
    var posts: Int
}

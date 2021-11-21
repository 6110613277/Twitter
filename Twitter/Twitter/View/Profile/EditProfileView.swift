//
//  EditProfileView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct EditProfileView: View {
    @State var bio: String
    @State var fullname: String
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel: EditProfileViewModel
    
    init(user: Binding<User>){
        _user = user
        viewModel = EditProfileViewModel(user: _user.wrappedValue)
        _bio = State(initialValue: _user.bio.wrappedValue ?? "")
        _fullname = State(initialValue: _user.fullname.wrappedValue ?? "")
    }
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.saveBio(bio: bio)
                    viewModel.saveName(fullname: fullname)
                }) {
                    Text("Done")
                }
            }
            .padding()
            Text("Your Full Name")
                .font(.system(size: 15, weight: .semibold))
            TextArea("Your Full Name", text: $fullname)
                .frame(width: 370, height: 200)
                .padding()
            
            Text("Your Bio")
                .font(.system(size: 15, weight: .semibold))
            TextArea("Add your bio...", text: $bio)
                .frame(width: 370, height: 200)
                .padding()
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { complete in
            if complete {
                mode.wrappedValue.dismiss()
                user.bio = viewModel.user.bio
            }
        }
    }
}


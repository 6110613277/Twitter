//
//  SigninView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("twitter-logo")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width:220, height: 220)
                    .foregroundColor(.blue)
                Text("Log in to Twitter")
                    .font(.system(size: 30, weight: .semibold))
                    .padding(.bottom)
                VStack(spacing: -16) {
                    CustomTextField(placeholder: Text("Email"), text: $email, imageName: "person")
                        .padding()
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(placeholder: Text("Password"), text: $password)
                        .padding()
                        .padding(.horizontal, 32)
                }
                
                HStack {
                    Spacer()
                    
                    NavigationLink(
                        destination: ForgotPasswordView(email: $email).navigationBarHidden(true),
                        label: {
                            Text("Forgot Password")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundColor(.gray)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                    )
                }
                .padding(.horizontal, 24)
                
                Button {
                    viewModel.signIn(withEmail: email, password: password)
                } label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:360,height:50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                Spacer()
                
                NavigationLink(
                    destination: RegisterView().navigationBarHidden(true),
                    label: {
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size:14 ,weight:.semibold))
                            Text("Register")
                                .font(.system(size: 14))
                        }
                    }
                )
            }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
            .environmentObject(AuthViewModel.shared)
    }
}

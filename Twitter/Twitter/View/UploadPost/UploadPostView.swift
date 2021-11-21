//
//  UploadPostView.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct UploadPostView: View {
    @State var selectedImage : UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    
    
    var body: some View {
        let image: UIImage? = selectedImage
            VStack {
                HStack(alignment: .top){
                    //let image = postImage
                    if let image = postImage{
                        VStack{
                            TextArea("What's happening?",text: $captionText)
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxHeight: 440)
                                .clipped()
                        }
                    }
                    else if postImage == nil {
                        TextArea("Enter your caption...",text: $captionText)
                    }
                    
                }
                .padding()
                Button(action: {
                    imagePickerPresented.toggle()
                }){
                    Text("Select Image")
                        .font(.system(size: 16,weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $imagePickerPresented){
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }
                .padding()
                
                Button {
                    if let image = selectedImage {
                        viewModel.uploadPost(image: image, caption: captionText)
                        captionText = ""
                        postImage = nil
                    }
                    else {
                        viewModel.uploadPostText(caption: captionText)
                        captionText = ""
                        postImage = nil
                    }
                    
                } label: {
                    Text("Tweet")
                        .font(.system(size: 16,weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
            }
        
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}

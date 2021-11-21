//
//  TabbarProfile.swift
//  Twitter
//
//  Created by Siriluk Rachaniyom on 21/11/2564 BE.
//

import SwiftUI

struct Tab {
    var icon: Image?
    var title: String
}

struct TabbarProfile: View {
    var fixed = true
    var tabs: [Tab]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                }
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack {
                                        // Image
                                        /*AnyView(tabs[row].icon)
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))*/

                                        // Text
                                        Text(tabs[row].title)
                                            .font(Font.system(size: 14, weight: .semibold))
                                            .foregroundColor(Color.black)
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 1))
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 52)
                                    // Bar Indicator
                                    Rectangle().fill(selectedTab == row ? Color.blue : Color.clear)
                                        .frame(height: 3)
                                }.fixedSize()
                            })
                                .accentColor(Color.blue)
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                }
            }
        }
        .frame(height: 55)
        .onAppear(perform: {
            UIScrollView.appearance().backgroundColor = UIColor(.white)
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}

struct TabbarProfile_Previews: PreviewProvider {
    static var previews: some View {
        TabbarProfile(fixed: true,
             tabs: [.init(title: "Tweets"),
                    .init(title: "Tweets&replies"),
                    .init(title: "Media")
                    //.init(title: "Likes")
             ],
             geoWidth: 450,
             selectedTab: .constant(0))
    }
}

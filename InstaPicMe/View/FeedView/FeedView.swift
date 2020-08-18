//
//  FeedView.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 20/06/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import SwiftUI

struct FeedView: View {

    @State private var feedItems: [FeedUserItem] = [
        FeedUserItem(name: "drawingNature330",
                     profileImage: "bg1",
                     likes: Int.random(in: 1...10_000),
                     post: "bg3",
                     description: "This is an image that I have found on the Internet.",
                     comments: [
                        Comment(commentId: "123",
                                userName: "naturist32",
                                content: "Nice 👏🏼",
                                isLiked: true),
                        Comment(commentId: "234",
                                userName: "lara44",
                                content: " I really like this, nice job!",
                                isLiked: true),
                        Comment(commentId: "345",
                                userName: "mark.t",
                                content: " 🙂",
                                isLiked: false)
                     ]),
        FeedUserItem(
            name: "artzy42",
            profileImage: "bg2",
            likes: Int.random(in: 1...10_000),
            post: "bg2",
            description: "This is an image that I have found on the Internet. It's probably good not to post this online just in case.",
            comments: [
                Comment(commentId: "456",
                        userName: "artlover231",
                        content: " This is awesome",
                        isLiked: true)
            ])]

    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    ForEach(self.feedItems, id: \.self) { item in
                        FeedItem(item: item)
                            .frame(width: geo.size.width,
                                   height: geo.size.height + 40)
                            .padding(.bottom, 10)
                    }
                }
                .padding(.top, 8)
                .navigationTitle("InstaPicMe")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

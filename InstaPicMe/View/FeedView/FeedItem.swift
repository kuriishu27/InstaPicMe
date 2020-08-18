//
//  FeedItem.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 20/06/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import SwiftUI
import Combine

struct FeedItem: View {

    @State var isMorePresented: Bool = false
    @State var isCommentsViewPresented: Bool = false
    @State var textComment: String = ""
	@State var isBookmarkSelected: Bool = false

    @State private var keyboardHeight: CGFloat = 0

    @State var item: FeedUserItem

    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Image(item.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    VStack {
                        Text(item.name)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Button(action: {
                        isMorePresented = true
                    }) {
                        Image(systemName: "ellipsis")
                    }
                    .actionSheet(isPresented: $isMorePresented) {
                        ActionSheet(title: Text(""),
                                    message: nil,
                                    buttons: [
                                        .default(Text("Report")),
                                        .default(Text("Copy link")),
                                        .default(Text("Share to...")),
                                        .default(Text("Turn on Post Notifications")),
                                        .default(Text("Mute")),
                                        .default(Text("Unfollow")),
                                        .cancel()
                        ])
                    }
                    .padding(.trailing, 10)
                }
                .foregroundColor(Color.black)
                .padding([.leading, .trailing], 10)

                Image(item.post)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.width)
                HStack(spacing: 12) {
                    Button(action: {

                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    }
                    .foregroundColor(Color.black)

                    Button(action: {

                    }) {
                        Image(systemName: "message")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    }
                    .foregroundColor(Color.black)

                    Button(action: {

                    }) {
                        Image(systemName: "paperplane")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    }
                    .foregroundColor(Color.black)

                    Spacer()

                    Button(action: {
						isBookmarkSelected.toggle()
                    }) {
						Image(systemName: isBookmarkSelected ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)

                    }
                    .foregroundColor(Color.black)

                }
                .padding([.leading, .trailing], 10)

                VStack(alignment: .leading) {
                    Text(item.likes.description + " likes")
                        .fontWeight(.medium)
                        .padding([.leading, .bottom], 10)

                    HStack {
                        Text(item.name + " ").bold() + Text(item.description)
                            .font(.body)

                    }
                    .padding([.leading, .bottom], 10)

                    Button(action: {
						isCommentsViewPresented.toggle()
                    }, label: {
                        Text("View all \(item.comments.count) comments")
                    })
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .padding([.leading, .bottom], 10)


                    ForEach(item.comments, id: \.self) { comment in

                        HStack {

                            Text(comment.userName)
                                .fontWeight(.medium) +
                                Text(comment.content)

                            Spacer()

                            if !comment.isLiked {
                                Image(systemName: "heart")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                            }
                        }
                        .padding([.leading, .trailing], 10)
                        .padding(.top, 1)
                    }
                }
                HStack {
                    Image("\(item.profileImage)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    TextField("Add a comment...", text: $textComment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .padding(10)
                }
            }
            .onReceive(Publishers.keyboardHeight) { keyboardHeight = $0 }
        }.sheet(isPresented: $isCommentsViewPresented) {
            HStack {
                Text("This is the comments section")
            }
        }
    }
}

struct FeedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeedItem(item: FeedUserItem(
            name: "tesseract",
            profileImage: "bg2",
            likes: 4405,
            post: "bg1",
            description: "This is an image that I have found on the Internet. It's probably good not to post this online just in case.",
            comments: [
                Comment(commentId: "1234",
                        userName: "catlover",
                        content: " This image is great 😄",
                        isLiked: true)
        ]))
    }
}

//
//  Post.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 28/07/2020.
//

import Foundation

typealias PostId = String

struct Post: Identifiable, Codable, Hashable, Equatable {
    let id = UUID().uuidString
    let postId: PostId
    let description: String
    let userId: UserId!
    let likes: [UserId]
    let comments: [CommentId]

    enum CodingKeys: String, CodingKey {
        case postId
        case description
        case userId
        case comments
        case likes
    }
}

//
//  Comment.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 21/06/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import Foundation

typealias CommentId = String

struct Comment: Identifiable, Hashable, Equatable {
    let id: String = UUID().uuidString
    let commentId: CommentId
    let userName: String
    let content: String
    let isLiked: Bool
}

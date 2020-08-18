//
//  FeedUserItem.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 21/06/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import Foundation

struct FeedUserItem: Identifiable, Hashable, Equatable {
    let id: String = UUID().uuidString
    let name: String
    let profileImage: String
    let likes: Int
    let post: String
    let description: String
    let comments: [Comment]
}

//
//  User.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 28/07/2020.
//

import Foundation

typealias UserId = String

struct User: Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let userId: UserId
    let profilePicture: String?
    let posts: [PostId]
}

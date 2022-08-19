//
//  Posts.swift
//  APILearning
//
//  Created by Luiz Sena on 17/08/22.
//

import Foundation

struct Post: Codable {
    let id: String
    let content: String
    let user_id: String
    let created_at: String
    let updated_at: String
}

struct PostModel {
    let id: String
    let content: String
    let username: String
}

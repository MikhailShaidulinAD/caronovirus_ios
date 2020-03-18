//
//  NewsDataModel.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

struct NewsDataModel: Decodable {
    var posts: [Post]
    let count: Int
}

// MARK: - Post
struct Post: Decodable {
    let id: Int
    let title, desc, author: String
    let link: String
    let created_at, updated_at: String
}

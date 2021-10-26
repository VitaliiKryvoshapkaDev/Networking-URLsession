//
//  Post.swift
//  Networking 19
//
//  Created by Vitalii Kryvoshapka on 26.10.2021.
//

import Foundation

//Add model data from server (From JSON->Post)
class Post: Codable {
    var userId:Int
    var id: Int
    var title: String
    var body: String
}

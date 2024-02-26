//
//  Post.swift
//  DecodingJsonRestApi
//
//  Created by Sushant Suwal on 26/02/2024.
//

import Foundation

struct Post: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}


class PostViewModel: ObservableObject {
    @Published var postData = [Post]()
    
    func fetchData() async {
        guard let downloadedPosts: [Post] = await WebService().downloadData(fromURL: "https://jsonplaceholder.typicode.com/posts") else {return}
        postData = downloadedPosts
    }
}

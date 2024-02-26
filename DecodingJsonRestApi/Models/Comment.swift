//
//  Comment.swift
//  DecodingJsonRestApi
//
//  Created by Sushant Suwal on 26/02/2024.
//

import Foundation

struct Comment: Hashable, Identifiable, Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}



class CommentViewModel: ObservableObject {
    @Published var commentsData = [Comment]()
    
    func fetchComments(forPostId postId: Int) async {
        guard let downloadedComments: [Comment] = await WebService().downloadData(fromURL: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)") else { return }
        commentsData = downloadedComments
    }
}

//
//  PostDetailScreen.swift
//  DecodingJsonRestApi
//
//  Created by Sushant Suwal on 26/02/2024.
//

import SwiftUI

struct PostDetailScreen: View {
    let post: Post;
    @StateObject var commentsVm = CommentViewModel()
    
    var body: some View {
        VStack {
            PostView(post: post)
                .padding(.all)
            CommentList(comments: commentsVm.commentsData)
                .listStyle(.plain)
                .onAppear(){
                    Task {
                        await commentsVm.fetchComments(forPostId: post.id)
                    }
                }
        }
    }
}

struct CommentList: View {
    let comments: [Comment]
    var body: some View {
        List(comments) { comment in
            VStack(alignment: .leading) {
                Text(comment.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.subheadline)
                Text(comment.email).fontWeight(.semibold).font(.caption)
                Text(comment.body).font(.caption)
            }
        }
    }
}

#Preview {
    NavigationStack{
        PostDetailScreen(post: Post(
           userId: 1,
           id: 1,
           title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
           body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
        ))
    }
}


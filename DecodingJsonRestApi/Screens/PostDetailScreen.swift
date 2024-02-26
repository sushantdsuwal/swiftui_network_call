//
//  PostDetailScreen.swift
//  DecodingJsonRestApi
//
//  Created by Sushant Suwal on 26/02/2024.
//

import SwiftUI

struct PostDetailScreen: View {
    let post: Post;
    
    var body: some View {
        VStack(alignment: .leading) {
            PostDetailView(post: post)
        }
        .navigationTitle(post.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostDetailView :View {
    let post: Post;
    
    var body: some View {
        VStack {
            Text(post.body)
            Spacer()
        }
    }
    
}


#Preview {
    NavigationStack{
        PostDetailScreen(post: Post(
            userId: 1,
            id: 1,
            title: "this is the title",
            body: "this is the "
        ))
    }
}

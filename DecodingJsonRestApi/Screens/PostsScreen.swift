//
//  PostsScreen.swift
//  DecodingJsonRestApi
//
//  Created by Sushant Suwal on 26/02/2024.
//

import SwiftUI

struct PostsScreen: View {
    @StateObject var vm = PostViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(vm.postData) { post in
                    NavigationLink(value: post) {
                        PostList(post: post)
                    }
                }
                .navigationTitle("Posts")
                .navigationDestination(for: Post.self) { post in
                   PostDetailScreen(post: post)
                }
                .onAppear {
                    if vm.postData.isEmpty {
                        Task {
                            await vm.fetchData()
                        }
                    }
                }
            }
        }
    }
}

struct PostList: View {
    let post: Post
    
    var body: some View {
        HStack {
            Text("\(post.userId)")
                .padding()
                .overlay(Circle().stroke(.blue))
            
            VStack(alignment: .leading) {
                Text(post.title)
                    .bold()
                    .lineLimit(1)
                
                Text(post.body)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
    }
}


#Preview {
    PostsScreen()
}

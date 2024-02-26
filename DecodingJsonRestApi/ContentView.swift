//
//  ContentView.swift
//  DecodingJsonRestApi
//
//  Created by Sushant Suwal on 26/02/2024.
//

import SwiftUI



struct ContentView: View {

    @StateObject var vm = PostViewModel()
    
    var body: some View {
        VStack {
            List(vm.postData) { post in
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
            }.onAppear {
                if vm.postData.isEmpty {
                    Task {
                        await vm.fetchData()
                    }
                }
            }
        }
      
    }
}

#Preview {
    ContentView()
}

//
//  SwiftUIView.swift
//  APILearning
//
//  Created by Luiz Sena on 17/08/22.
//

import SwiftUI

struct PostScreen: View {

    @State private var coments = [PostModel]()

    var body: some View {
        List(coments, id: \.content) { coment in
            VStack(alignment: .leading) {
                Text(coment.username)
                Text(coment.content)
            }
        }.task {
            coments = await getAllPostsWithUsername()
        }
        .padding()
    }

    // Melhor que estar aqui seria se estivesse num PostScreenViewModel
    func getAllPostsWithUsername() async -> [PostModel] {
        let posts: [Post] = await API.getAllPosts()

        var postsModel: [PostModel] = []

        for post in posts {
            let user = await API.getUsers(id: post.user_id)
            let postModel = PostModel(id: post.id, content: post.content, username: user.name)
            postsModel.append(postModel)
        }

        return postsModel
    }
}

struct PostScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostScreen()
    }
}

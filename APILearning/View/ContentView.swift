//
//  ContentView.swift
//  APILearning
//
//  Created by Luiz Sena on 09/08/22.
//

import SwiftUI

struct ContentView: View {

    @State var posts: [Post] = []

    var body: some View {
        SignUp()

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

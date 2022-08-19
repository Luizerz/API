//
//  Api.swift
//  APILearning
//
//  Created by Luiz Sena on 16/08/22.
//

import Foundation

//Using completion handler

class API {
    static func getUsers() {
        let url = URL(string: "http://adaspace.local/users")!

        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in

            //        print("response: \(String(describing: response)), data: \(String(describing: data)), error: \(String(describing: error))")

            guard let responseData = data else {return}

            do {
                let users = try JSONDecoder().decode([Users].self, from: responseData)
                print(users[1])
            } catch let error {
                print("error: \(error)")
            }
            //        if let responseString = String(data: responseData, encoding: .utf8) {
            //
            //            print(responseString)
            //        }
        }

        task.resume()
    }

    static func getUsers(id:String) async -> User {
        let url: URL = URL(string: "http://adaspace.local/users/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let userDecoded = try JSONDecoder().decode(User.self, from: data)

            return userDecoded
        } catch{
            print(error)
        }

        return User(email: "", id: "", name: "")
    }

    static func getAllPosts() async -> [Post] {
        let url: URL = URL(string: "http://adaspace.local/posts")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let allPostsDecoded = try JSONDecoder().decode([Post].self, from: data)

            return allPostsDecoded
        } catch {
            print(error)
        }
        return []
    }

    static func postLogin() async -> [Post] {
        let url: URL = URL(string: "http://adaspace.local/posts")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let allPostsDecoded = try JSONDecoder().decode([Post].self, from: data)

            return allPostsDecoded
        } catch {
            print(error)
        }
        return []
    }

    static func loginUser(email:String, password:String) async -> String {
        guard let url = URL(string:"http://adaspace.local/users/login")else{
            return""
        }

        var urlRequest = URLRequest(url:url)
        urlRequest.httpMethod = "POST"
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.allHTTPHeaderFields=[
            "Content-Type": "application/json"
        ]

        let authData = (email + ":" + password).data(using: .utf8)!.base64EncodedData()
        let authString = String(data: authData, encoding: .utf8)!
        print(String(data: authData, encoding: .utf8)!)
        urlRequest.addValue("Basic \(authString)",forHTTPHeaderField: "Authorization")

        let dict: String = ""

        do {
            let dictData = try JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)
            urlRequest.httpBody = dictData
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print(String(data: data, encoding: .utf8)!)
            let decoded = try JSONDecoder().decode(Token.self, from: data)
            if let responseHeader = response as? HTTPURLResponse {
                if responseHeader.statusCode == 200 {
                    print(String(data: data, encoding: .utf8)!)
                    return String(decoded.token)
                }
            }
            print(decoded.token)
        } catch {
            print(error)
        }
        return ""
    }
    
}


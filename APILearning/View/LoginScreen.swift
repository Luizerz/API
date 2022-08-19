//
//  LoginScreen.swift
//  APILearning
//
//  Created by Luiz Sena on 17/08/22.
//

import SwiftUI

struct LoginScreen: View {
    @State var email: String
    @State var password: String

    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    LottieView(lottieFile: "garotoDePrograma")
                        .frame(width: 300, height: 160, alignment: .center)
                    VStack(alignment: .leading){
                        Text("Coloque seu Email")
                            .font(.system(size: 14))
                        TextField(
                            "Email",
                            text: $email
                        ).textInputAutocapitalization(.never)
                        .frame(width: 250, height: 25)
                            .multilineTextAlignment(.leading)
                            .padding(4)
                            .background {
                                RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#6911"))
                            }
                    }
                    VStack(alignment: .leading) {
                        Text("Coloque sua senha")
                            .font(.system(size: 14))
                        SecureField(
                            "Senha",
                            text: $password
                        )
                        .frame(width: 250, height: 25)
                        .multilineTextAlignment(.leading)
                        .padding(4)
                        .background {
                            RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#6911"))
                        }
                    }.padding(.init(top: 0, leading: 0, bottom: 6, trailing: 0))

                    Button(action: {
                        Task{
//                            await API.loginUser(email: email ,password: password)
                            await API.loginUser(email: "alves1@example.com", password: "123")
                        }
                    }, label: { Text("Entrar") })

                        .frame(width: 250, height: 40)
                        .tint(Color(hex: "#ffff"))
                        .background(Color(hex: "#579CFF"))
                        .cornerRadius(10)

                        .padding(.init(top: 0, leading: 0, bottom: 6, trailing: 0))
                    HStack{
                        Text("Não tem conta?")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#282829"))
                        NavigationLink(destination: SignUp(), label: {
                            Text("Cadastre-se")
                        })
                    }
                }
                .padding(.top, 80)
                Spacer()
            }
        }
    }
}

//struct LoginScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginScreen()
//    }
//}

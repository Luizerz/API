//
//  SignUp.swift
//  APILearning
//
//  Created by Luiz Sena on 16/08/22.
//

import SwiftUI

struct SignUp: View {

    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            LottieView(lottieFile: "pombo")
                .frame(width: 250, height: 250, alignment: .center)

            VStack(alignment: .leading){
                Text("Nome de usuário")
                TextField(
                    "User name",
                    text: $username
                )
                .frame(width: 200, height: 25)
                .multilineTextAlignment(.center)
                .padding(4)
                .background {
                    RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#6911"))
                }
            }
            TextField(
                "Email adress",
                text: $email
            )
            .frame(width: 200, height: 25)
            .multilineTextAlignment(.center)
            .padding(4)
            .background {
                RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#6911"))
            }
            SecureField(
                "Password",
                text: $password
            )
            .frame(width: 200, height: 25)
            .multilineTextAlignment(.center)
            .padding(4)
            .background {
                RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#6911"))
            }
            .padding(6)
            Button(action: {  }, label: { Text("Cadastrar") })
                .buttonStyle(.borderedProminent)
                .tint(Color(hex: "#579CFF"))
        }
    }
}

//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUp()
//    }
//}

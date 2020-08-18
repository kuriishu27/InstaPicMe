//
//  LoginView.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 28/07/2020.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var authManager : AuthenticationService = AuthenticationService()

    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""

    @State private var isErrorShown = false
    @State private var errorMessage: String = ""

    @Binding var isValidLogin: Bool

    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)

                VStack {

                    VStack {
                        Text("INSTAPICME")
                            .font(.custom("AvenirNext-Bold", size: 60))
                        Text("Instagram clone")
                            .font(.body)

                        Text("by Christian Ray Leovido")
                            .font(.caption)
                    }
                    .foregroundColor(.white)

                    Image(systemName: "camera")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .padding(50)
						.foregroundColor(Color.white)
                    VStack {
                        HStack {
                            Image(systemName: "person.fill")
                                .padding(.leading, 10)
                            TextField("Email", text: $emailInput)
                                .frame(width: 250, height: 20)
                                .background(Color.white)
                                .padding(10)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)

                        }
                        .background(Color.white)
                        .padding(10)

                        HStack {
                            Image(systemName: "lock.fill")
                                .padding(.leading, 10)

                            SecureField("Password", text: $passwordInput)
                                .frame(width: 250, height: 20)
                                .background(Color.white)
                                .padding(10)
                        }
                        .background(Color.white)
                        .padding(.bottom, 10)

                        Button(action: {
                            authManager.login(email: emailInput, password: passwordInput) { result in

                                switch result {
                                    case .success:
                                        self.isValidLogin.toggle()
                                    case .failure(let error):
                                        self.isErrorShown = true
                                        self.errorMessage = error.localizedDescription
                                }
                            }
                        }) {
                            Text("Login")
                        }
                            .foregroundColor(Color.white)
                            .frame(width: 90, height: 40)
                            .background(Color.pink)
                            .cornerRadius(20)

                        Button(action: {
                            authManager.signup(email: emailInput, password: passwordInput) { result in

                                switch result {
                                    case .success:
                                        self.isValidLogin.toggle()
                                    case .failure(let error):
                                        self.isErrorShown = true
                                        self.errorMessage = error.localizedDescription
                                }
                            }
                        }) {
                            Text("Sign up")
                        }
                            .foregroundColor(Color.white)
                            .frame(width: 90, height: 40)
                            .background(Color.purple)
                            .cornerRadius(20)
                            .padding(.top, 20)

                    }
                    .frame(width: geo.size.width / 2, alignment: .center)
                }
                .frame(width: geo.size.width)
                .alert(isPresented: $isErrorShown) {
                    Alert(title: Text("Error"),
                          message: Text(errorMessage),
                          dismissButton: .default(Text("Ok"),
                                                  action: {
                        self.isErrorShown = false
                    }))
                }
                .onAppear {
                    PostsManager().getPosts { post in
                        print(post)
                    }
                }
            }
        }
    }

}

struct LoginView_Previews: PreviewProvider {

    @State static var isValidLogin: Bool = true
    static var previews: some View {
        LoginView(isValidLogin: $isValidLogin)
    }
}

//
//  AuthenticationService.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 28/07/2020.
//

import FirebaseAuth

final class AuthenticationService: ObservableObject {

    @Published var uid: String?

    let authService = Auth.auth()

    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        authService.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(Result.failure(error))
            } else {

                self.uid = result?.user.uid

                completion(Result.success(true))
            }
        }
    }

    func signup(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        authService.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(Result.failure(error))
            } else {
                self.uid = result?.user.uid

                completion(Result.success(true))
            }

        }
    }

    func signout() throws {
        try authService.signOut()
    }

}

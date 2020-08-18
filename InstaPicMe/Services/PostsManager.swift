//
//  PostsManager.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 28/07/2020.
//

import FirebaseFirestore

protocol Listener {
    func addSnapshotListener(completion: FIRQuerySnapshotBlock)
}

class PostsManager {

    let reference = Firestore.firestore().collection("posts")

    func getPosts(completion: @escaping (Result<[Post], Error>) -> Void) {

        reference.addSnapshotListener { snapshot, error in

            if let error = error {
                completion(Result.failure(error))
            } else {
                guard let documents = snapshot?.documents else {
                    print("No documents")
                    return
                }

                do {
                    let posts = try self.decodeDocuments(documents)

                    let result = Result<[Post], Error>.success(posts)

                    completion(result)
                } catch let error {
                    completion(Result.failure(error))
                }

            }
        }


    }

    func decodeDocuments(_ documents: [QueryDocumentSnapshot]) throws -> [Post] {

        let items = try documents.compactMap({ doc -> Post in

            let data = try JSONSerialization.data(withJSONObject: doc.data(), options: .prettyPrinted)

            return try JSONDecoder().decode(Post.self, from: data)

        })

        return items

    }

}

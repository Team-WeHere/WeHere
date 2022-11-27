//
//  FirestoreManager.swift
//  Workade
//
//  Created by Inho Choi on 2022/11/26.
//

import FirebaseFirestore
import Foundation

class FirestoreDAO {
    private init() { }
    var user: User? = nil
    static let shared = FirestoreDAO()
    private let dto = FirestoreDTO()
    
    private let userCollectionName = "User"
    
    func getUsers() async throws -> [User] {
        let documents = try await dto.getDocuments(collectionName: userCollectionName)
        let decoder = JSONDecoder()
        var users = [User]()
        
        for document in documents {
            let data = document.data()
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            let user = try decoder.decode(User.self, from: jsonData)
            users.append(user)
        }
        
        return users
    }
    
    func createUser(user: User) async throws {
        guard let data = user.asDictionary else { return }
        try await dto.createDocument(collectionName: userCollectionName, documentName: user.id, data: data)
    }
    
    func deleteUser(user: User) async throws {
        try await dto.deleteDocument(collectionName: userCollectionName, documentName: user.id)
    }
    
    func getUser(userID: String) async throws -> User? {
        let documents = try await dto.getDocuments(collectionName: userCollectionName)
        let decoder = JSONDecoder()
        
        for document in documents {
            let data = document.data()
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            let user = try decoder.decode(User.self, from: jsonData)
            
            if user.id == userID {
                return user
            }
        }
        return nil
    }
    
    func isUserSignIn(userID: String) async throws -> Bool {
        if let _ = try await getUser(userID: userID) {
            return true
        } else {
            return false
        }
    }
}

class FirestoreDTO {
    fileprivate init() { }
    
    private let database = Firestore.firestore()
    
    func createDocument(collectionName: String, documentName: String, data: [String: Any]) async throws {
        try await database.collection(collectionName).document(documentName).setData(data)
    }
    
    func updateDocument(collectionName: String, documentName: String, data: [String: Any]) async throws {
        try await database.collection(collectionName).document(documentName).updateData(data)
    }
    
    func deleteDocument(collectionName: String, documentName: String) async throws {
        try await database.collection(collectionName).document(documentName).delete()
    }
    
    func getDocuments(collectionName: String) async throws -> [QueryDocumentSnapshot] {
        return try await database.collection(collectionName).getDocuments().documents
    }
}

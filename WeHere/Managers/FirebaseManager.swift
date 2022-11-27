//
//  FirebaseManager.swift
//  Workade
//
//  Created by Inho Choi on 2022/11/25.
//

import AuthenticationServices
import CryptoKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import Foundation

final class FirebaseManager: NSObject {
    // MARK: - Properties
    static let shared = FirebaseManager()
    private var currentNonce: String?
    lazy private var authorizationController = ASAuthorizationController(authorizationRequests: [createAppleIDRequest()])
    private var appleLoginCompletion: (() -> Void)? = nil
    
    
    private override init() {
        super.init()
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
    }
    
    func touchUpAppleButton(completion: @escaping () -> Void) {
//        request.requestedScopes = [.email, .fullName]
        appleLoginCompletion = completion
        authorizationController.performRequests()
    }
    
    @available(iOS 13, *)
    func createAppleIDRequest() -> ASAuthorizationAppleIDRequest {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        // 애플로그인은 사용자에게서 2가지 정보를 요구함
        request.requestedScopes = [.fullName, .email]
        
        let nonce = randomNonceString()
        request.nonce = sha256(nonce)
        currentNonce = nonce
        
        return request
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if length == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        return result
    }
    
    func getUser() -> Firebase.User? {
        return Auth.auth().currentUser
    }
}

// MARK: - ASAuthorizationControllerDelegate
@available(iOS 13.0, *)
extension FirebaseManager: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // 몇 가지 표준 키 검사를 수행
            // 1️⃣ 현재 nonce가 설정되어 있는지 확인
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            
            // 2️⃣ ID 토큰을 검색하여
            guard let appleIDtoken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            
            // 3️⃣ 문자열로 변환
            guard let idTokenString = String(data: appleIDtoken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDtoken.debugDescription)")
                return
            }
            
            // 4️⃣
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            
            // 5️⃣
            Task {
                do {
                    let authData = try await Auth.auth().signIn(with: credential)
                    let userData = authData.user
                    if let user = try await FirestoreDAO.shared.getUser(userID: userData.uid) {
                        FirestoreDAO.shared.user = user
                    } else {
                        let user = User(id: userData.uid, email: userData.email, partnerID: nil)
                        try await FirestoreDAO.shared.createUser(user: user)
                        FirestoreDAO.shared.user = user
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

// MARK: - ASAuthorizationControllerPresentationContextProviding
extension FirebaseManager: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.filter{$0.isKeyWindow}.first!
    }
}

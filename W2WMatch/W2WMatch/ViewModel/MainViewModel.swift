//
//  MainViewModel.swift
//  jwt_authorizer
//
//  Created by Lev Baklanov on 28.10.2022.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var showAuthContainer = true
    
    @Published var loginPending = false
    @Published var registerPending = false
    @Published var successfullRegistration = false
    
    @Published var user: AutorizedUser?
    
//    @Published var devsProgress: LoadingState = .notStarted
//    @Published var developers: [Developer] = []
    
    @Published var alert: IdentifiableAlert?
    
    init() {
        let refreshToken = UserDefaultsWorker.shared.getRefreshToken()
        if !refreshToken.token.isEmpty && refreshToken.expiresAt > Date().timestampMillis() {
            showAuthContainer = false
        }
    }
    
    func logout() {
        UserDefaultsWorker.shared.dropTokens()
        Requester.shared.dropTokens()
        withAnimation {
            showAuthContainer = true
        }
    }
    
    func login(email: String, password: String) {
        withAnimation {
            loginPending = true
        }
        print("login called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.login(authBody: AuthBody(email: email, password: password, phone: "")) { [self] result in
                print("login response: \(result)")
                withAnimation {
                    loginPending = false
                }
                switch result {
                case .success(let _):
                    // do something with user
                    withAnimation {
                        self.showAuthContainer = false
                    }
                case .serverError(let err):
                    alert = IdentifiableAlert.buildForError(id: "login_server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    alert = IdentifiableAlert.networkError()
                case .authError(let err):
                    alert = IdentifiableAlert.buildForError(id: "login_err", message: Errors.messageFor(err: err.message))
                }
            }
        }
    }
    
    func register(email: String, phone: String , password: String) {
        withAnimation {
            registerPending = true
        }
        print("register called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.register(authBody: AuthBody(email: email, password: password, phone: phone)) { [self] result in
                print("register response: \(result)")
                withAnimation {
                    registerPending = false
                }
                switch result {
                case .success(let user):
                    // do something with user
                    withAnimation {
                        // show RegistrationStep2()
                        self.successfullRegistration = true
                        self.showAuthContainer = false
                    }
                case .serverError(let err):
                    alert = IdentifiableAlert.buildForError(id: "login_server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    alert = IdentifiableAlert.networkError()
                case .authError(let err):
                    alert = IdentifiableAlert.buildForError(id: "login_err", message: Errors.messageFor(err: err.message))
                }
            }
        }
    }
    
    
    /*
    func getDevelopers() {
        withAnimation {
            devsProgress = .loading
        }
        print("get devs called")
        DispatchQueue.global(qos: .userInitiated).async {
            Requester.shared.getDevelopers() { [self] result in
                print("get devs response: \(result)")
                withAnimation {
                    registerPending = false
                }
                switch result {
                case .success(let devs):
                    withAnimation {
                        developers = devs
                        devsProgress = .finished
                    }
                case .serverError(let err):
                    withAnimation {
                        devsProgress = .error
                    }
                    alert = IdentifiableAlert.buildForError(id: "devs_server_err", message: Errors.messageFor(err: err.message))
                case .networkError(_):
                    withAnimation {
                        devsProgress = .error
                    }
                    alert = IdentifiableAlert.networkError()
                case .authError(let err):
                    withAnimation {
                        self.showAuthContainer = true
                    }
                }
            }
        }
    }
    */
}

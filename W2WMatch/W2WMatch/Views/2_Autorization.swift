//
//  Autorization.swift
//  W2WMatch
//
//  Created by Floron on 07.06.2024.
//

import SwiftUI

struct Autorization: View {
    
    //@State private var willMoveToNextScreen = false
    @State private var showingAlert = false
//    @State private var userEmail = ""
//    @State private var userPassword = ""
    @State private var user = UserModel()
    
//    @FocusState private var emailFieldIsFocused: Bool
//    @FocusState private var passwordFieldIsFocused: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func goHome() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: MainPageView())
            window.makeKeyAndVisible()
        }
    }

    var btnBack: some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Авторизация")
                .foregroundColor(Color("W2wBlueColor"))
                .font(.custom("Felidae-Regular", size: 38))
            
            Spacer()
            
            TextField("Введите ваш Email адрес",text: $user.email)
                //.focused($emailFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: 255.0, height: 45.0)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/, lineWidth: 2))
                .foregroundStyle(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
            
            TextField("Пароль", text: $user.password)
                //.focused($passwordFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: 255.0, height: 45.0)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/, lineWidth: 2))
                .foregroundStyle(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
            
            
            Button("Войти") {
//                print("Email: \(userEmail)  Пароль: \(userPassword)")
                NetworkModel().serverRequest(apiToUse: .authorization, user: user) { statusCode in
                    
                    if statusCode == 200 {
                        DispatchQueue.main.async {
                            goHome()
                        }
                    } 
                    if statusCode == 401 {
                        showingAlert = true
                    }
                }
            }
            .padding()
            .frame(width: 255.0, height: 45.0)
            .foregroundStyle(.white)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
            }
            .alert("Аккаунт не найден!", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
       // .navigate(to: MainPageView(), when: $willMoveToNextScreen)
        
    }
}

#Preview {
    Autorization()
}

/*
extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
*/

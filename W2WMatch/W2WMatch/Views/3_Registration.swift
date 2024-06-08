//
//  Registration.swift
//  W2WMatch
//
//  Created by Floron on 07.06.2024.
//

import SwiftUI

struct Registration: View {
    @State private var showingAlert = false
//    @State private var userEmail = ""
//    @State private var userPhone = ""
//    @State private var userPassword = ""
//    @FocusState private var emailFieldIsFocused: Bool
//    @FocusState private var passwordFieldIsFocused: Bool
    @State private var newUser = UserModel()
    
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
            
            Text("Регистрация")
                .foregroundColor(Color("W2wBlueColor"))
                .font(.custom("Felidae-Regular", size: 38))
            
            Spacer()
            
            
            TextField("Введите ваш Email адрес",text: $newUser.email)
               // .focused($emailFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: 255.0, height: 45.0)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/, lineWidth: 2))
                .foregroundStyle(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
            
            TextField("Номер телефона (+7)",text: $newUser.phone)
                //.focused($emailFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: 255.0, height: 45.0)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/, lineWidth: 2))
                .foregroundStyle(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
            
            TextField("Пароль", text: $newUser.password)
                //.focused($passwordFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: 255.0, height: 45.0)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/, lineWidth: 2))
                .foregroundStyle(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
            
            
            Button("Зарегистрировать") {
//                print("Email: \(userEmail)  Пароль: \(userPassword)")
                NetworkModel().serverRequest(apiToUse: .registration, user: newUser) { statusCode, serverResponse in
                    
                    if statusCode == 201 {
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
    Registration()
}

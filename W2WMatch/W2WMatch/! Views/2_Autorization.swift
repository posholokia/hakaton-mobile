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
    @State private var errorMessage = ""
    
    @State var showingDetail = false
    @State private var user = UserModel()
    

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
                .foregroundColor(Color("W2wBlueColor"))
        }
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                ZStack {
                    Image("RegistrationVector1")
                    Image("RegistrationVector2")
                        .padding(.top, -55.0)
                        .padding(.trailing, 15.0)
                    Image("RegistrationVector3")
                        .padding(.top, 43.0)
                        .padding(.trailing, 65.0)
                    
                }.padding(.trailing, 15.0)
            }
            
            //Spacer()
            
            Image("logo vertical")
                .padding(.top, 58.0)
            
            Text("Авторизация")
                .foregroundColor(Color("W2wBlueColor"))
                .font(.custom("PoiretOne-Regular", size: 38))
            
            Spacer()
            
            TextField("Введите ваш Email адрес",text: $user.email)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: 255.0, height: 45.0)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("W2wLightBlueColor"), lineWidth: 2))
                .foregroundStyle(Color("W2wLightBlueColor"))
            
            SecureField("Пароль", text: $user.password)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: 255.0, height: 45.0)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("W2wLightBlueColor"), lineWidth: 2))
                .foregroundStyle(Color("W2wLightBlueColor"))
            
            
            Button("Войти") {
                user.email = user.email.lowercased()
                NetworkModel().serverRequest(apiToUse: .authorization, user: user) { statusCode, serverResponse in
                    if statusCode == 200 {
                        DispatchQueue.main.async {
                            //UserDefaults.standard.set(user, forKey: "UserInfo")
                            goHome()
                        }
                    } 
                    if statusCode == 401 || statusCode == 400 {
                        self.errorMessage = ErrorsAnalyzer().analyzeServerResponce(serverResponce: serverResponse)
                        showingAlert = true
                    }
                }
            }
            .frame(width: 255.0, height: 45.0)
            .foregroundStyle(.white)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("W2wLightBlueColor"))
            }
            .padding(.top)
            .alert(errorMessage, isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
            }
            
            Button(action: {
                print("В разработке")
            }) {
                Text("Забыли пароль?")
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image("Vector")
                .padding(.top, 8.0)
            Text("Войти с помощью")
                .foregroundColor(.gray)
                //.foregroundStyle(Color(cgColor: CGColor(red: 12.0, green: 12.0, blue: 12.0, alpha: 1)))
                .multilineTextAlignment(.center)
                .padding(.top, 0.0)
            
            Image("social")
                .padding(.top, 8.0)
            
            HStack {
                Text("Нет аккаунта?")
                    .foregroundColor(.gray)
                    //.foregroundStyle(Color(cgColor: CGColor(red: 12.0, green: 12.0, blue: 12.0, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .padding(.top, 0.0)
                
                Button(action: {
                    self.showingDetail.toggle()
                }) {
                    Text("Зарегистрируйтесь")
                        .foregroundColor(.black)
                }.sheet(isPresented: $showingDetail) {
                    Registration()
                }
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

//
//extension View {
//    /// Navigate to a new view.
//    /// - Parameters:
//    ///   - view: View to navigate to.
//    ///   - binding: Only navigates when this condition is `true`.
//    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
//        NavigationView {
//            ZStack {
//                self
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)
//
//                NavigationLink(
//                    destination: view
//                        .navigationBarTitle("")
//                        .navigationBarHidden(true),
//                    isActive: binding
//                ) {
//                    EmptyView()
//                }
//            }
//        }
//        .navigationViewStyle(.stack)
//    }
//}


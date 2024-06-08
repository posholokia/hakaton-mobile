//
//  ContentView.swift
//  W2WMatch
//
//  Created by Floron on 02.06.2024.
//

import SwiftUI

struct HelloView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("helloArms")
                    .padding(.bottom, 30)
                
                VStack {
                   Text("Добро пожаловать в")
                        .foregroundColor(Color("W2wBlueColor"))
                    Text("сервис коллабораций")
                        .foregroundColor(Color("W2wOrangeColor"))
                    Text("для брендов")
                        .foregroundColor(Color("W2wBlueColor"))
                }
                .font(.custom("Felidae-Regular", size: 38))
               
                Spacer()
                
                HStack {
                    NavigationLink("Вход") {
                        Autorization()
                    }
                    .padding()
                    .frame(width: 150.0, height: 45.0)
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
                    }

                    NavigationLink("Регистрация") {
                        Registration()
                    }
                    .padding()
                    .frame(width: 150.0, height: 45.0)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/, lineWidth: 2))
                    .foregroundStyle(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
            }
        }
    }
}
            
            //.font(.custom("Felidae-Regular", size: 22))
            
//            Button("Телеграмм") {
//                print("Кнопка Телеграмм нажата")
//                
////                let botURL = URL.init(string: "tg://resolve?domain=academeg_true_original")
////
////                if UIApplication.shared.canOpenURL(botURL!) {
////                    UIApplication.shared.openURL(botURL!)
////                } else {
////                  // Telegram is not installed.
////                }
//                
//                let screenName =  "academeg_true_original" // <<< ONLY CHANGE THIS ID
//                let appURL = NSURL(string: "tg://resolve?domain=\(screenName)")!
//                let webURL = NSURL(string: "https://t.me/\(screenName)")!
//                if UIApplication.shared.canOpenURL(appURL as URL) {
//                    if #available(iOS 10.0, *) {
//                        UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
//                    }
//                    else {
//                        UIApplication.shared.openURL(appURL as URL)
//                    }
//                }
//                else {
//                    //redirect to safari because user doesn't have Telegram
//                    if #available(iOS 10.0, *) {
//                        UIApplication.shared.open(webURL as URL, options: [:], completionHandler: nil)
//                    }
//                    else {
//                        UIApplication.shared.openURL(webURL as URL)
//                    }
//                }
//                
//                
//            }
//            .padding()
//            .frame(width: 150.0, height: 45.0)
//            .overlay( /// apply a rounded border
//                RoundedRectangle(cornerRadius: 15)
//                    .stroke(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/, lineWidth: 2))
//            .foregroundStyle(/*@START_MENU_TOKEN@*/Color("W2wBlueColor")/*@END_MENU_TOKEN@*/)


#Preview {
    HelloView()
}

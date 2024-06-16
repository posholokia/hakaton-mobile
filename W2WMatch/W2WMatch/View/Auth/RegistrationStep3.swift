//
//  RegistrationStep3.swift
//  W2WMatch
//
//  Created by Floron on 15.06.2024.
//

import SwiftUI

struct RegistrationStep3: View {
    
    @EnvironmentObject var mainVm: MainViewModel
    @State var user = AutorizedUser()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    
                    Spacer()
                    
                    Text("Расскажи о своем\nбренде")
                        .foregroundColor(Color("W2wBlueColor"))
                        .font(.custom("PoiretOne-Regular", size: 34))
                        .multilineTextAlignment(.center)
                        
                     
                    Spacer()
                    
                    VStack {
                        
                        
                        
                        HStack {
                            Text("Название Вашего бренда и должность")
                                .font(Font.custom("Manrope", size: 14))
                                .tracking(0.28)
                                .foregroundColor(Color("W2wBlueColor"))
                            Spacer()
                        }
                        
                        TextField(text: $user.myBrand.name.animation()) {
                            Text("Название бренда")
                                .font(Font.custom("Manrope", size: 14).weight(.light))
                                .lineSpacing(20)
                                .foregroundColor(Color("W2wLightBlueColor"))
                        }
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .padding()
                        .frame(width: 255.0, height: 45.0)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("W2wLightBlueColor"), lineWidth: 2))
                        .foregroundStyle(Color("W2wLightBlueColor"))
                        .padding(.bottom, 25.0)
                        
                       
                        HStack {
                            Text("Ссылка на Ваш телеграмм-канал или телеграмм-канал бренда")
                                .font(Font.custom("Manrope", size: 14))
                                .tracking(0.28)
                                .foregroundColor(Color("W2wBlueColor"))
                            Spacer()
                        }
                        
                        TextField(text: $user.myBrand.tgName.animation()) {
                            Text("@nic")
                                .font(Font.custom("Manrope", size: 14).weight(.light))
                                .lineSpacing(20)
                                .foregroundColor(Color("W2wLightBlueColor"))
                        }
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .padding()
                        .frame(width: 255.0, height: 45.0)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("W2wLightBlueColor"), lineWidth: 2))
                        .foregroundStyle(Color("W2wLightBlueColor"))
                        .padding(.bottom, 25.0)
                        
                        HStack {
                            Text("Ссылка на сайт бренда или на маркетплейс (WB, OZON, Lamoda, Яндекс маркет)")
                                .font(Font.custom("Manrope", size: 14))
                                .tracking(0.28)
                                .foregroundColor(Color("W2wBlueColor"))
                            Spacer()
                        }
                        
                        TextField(text: $user.myBrand.shopLink.animation()) {
                            Text("Ссылка")
                                .font(Font.custom("Manrope", size: 14).weight(.light))
                                .lineSpacing(20)
                                .foregroundColor(Color("W2wLightBlueColor"))
                        }
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .padding()
                        .frame(width: 255.0, height: 45.0)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("W2wLightBlueColor"), lineWidth: 2))
                        .foregroundStyle(Color("W2wLightBlueColor"))
                      
                        
                    }
                    .padding(.horizontal, 65.0)
                    //.frame(width: 358)
                    

                    NavigationLink(destination: AboutYorselfScreen(user: user)) {
                        Text("Далее")
                        //надо передать данные на сервер
                    }
                    .frame(width: geometry.size.width - 120, height: 45.0)
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("W2wLightBlueColor"))
                    }
                    .padding(.top)
                    
//                    NavigationLink(destination: MainPageView(user: user)) {
//                        Text("Далее")
//                    }
//                    .frame(width: 255.0, height: 45.0)
//                    .foregroundStyle(.white)
//                    .background {
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(Color("W2wLightBlueColor"))
//                    }
//                    .padding(.top)
                    
                    
                    Image("Vector")
                        .padding(.top, 38.0)
                    
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .navigationArrowLef()
        .background(Color(red: 248, green: 248, blue: 248))
    }
}

#Preview {
    RegistrationStep3(user: AutorizedUser())
}

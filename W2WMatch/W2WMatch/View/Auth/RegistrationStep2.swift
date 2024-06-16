//
//  RegistrationStep2.swift
//  W2WMatch
//
//  Created by Floron on 15.06.2024.
//

import SwiftUI

struct RegistrationStep2: View {
    @State var user = AutorizedUser()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                
                VStack {
                    
                    Spacer()
                    
                    Text("Отлично!")
                        .foregroundColor(Color("W2wBlueColor"))
                        .font(.custom("PoiretOne-Regular", size: 38))
                    
                    Spacer()
                    
                    VStack {
                        Text("Для того, что мы помогли тебе сразу найти партнера, ответь на вопросы")
                        .font(Font.custom("Manrope", size: 14))
                        .multilineTextAlignment(.leading)
                        .tracking(0.28)
                        .foregroundColor(Color("W2wBlueColor"))
                        
                        
                        Text("Ответы займут 10-15 минут. Можешь вернуться\nк завершению регистрации позже. Если переживаешь,,что забудешь,-  оставь свой номер телефона,  мы напомним.")
                            .font(Font.custom("Manrope", size: 12))
                            .tracking(0.28)
                            .foregroundColor(Color("W2wLightBlueColor"))
                            .padding(.top, 5.0)
                            .padding(.bottom, 45.0)
                        
                        
                        HStack {
                            Text("Ваше имя и фамилия")
                                .font(Font.custom("Manrope", size: 14))
                                .tracking(0.28)
                                .foregroundColor(Color("W2wBlueColor"))
                            Spacer()
                        }
                        
                        TextField(text: $user.name.animation()) {
                            Text("Имя и фамилия")
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
                            Text("Ваш никнэйм в Телеграмм")
                                .font(Font.custom("Manrope", size: 14))
                                .tracking(0.28)
                                .foregroundColor(Color("W2wBlueColor"))
                            Spacer()
                        }
                        
                        TextField(text: $user.telegrammNik.animation()) {
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
                      
                        
                    }
                    .padding(.horizontal, 50.0)
                    .frame(width: 358)
                    

//                    Button("Далее") {
//                        
//                    }
//                    .frame(width: 255.0, height: 45.0)
//                    .foregroundStyle(.white)
//                    .background {
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(Color("W2wLightBlueColor"))
//                    }
//                    .padding(.top)
                    
                    NavigationLink(destination: RegistrationStep3(user: user)) {
                        Text("Далее")
                    }
                    .frame(width: 255.0, height: 45.0)
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("W2wLightBlueColor"))
                    }
                    .padding(.top)
                    
                    
                    Image("Vector")
                        .padding(.top, 38.0)
                    
                    Spacer()
 
                    Button(action: {
                        print("В разработке")
                    }) {
                        Text("Перезвоните мне, пожалуйста")
                            .font(Font.custom("Manrope", size: 14).weight(.medium))
                            .lineSpacing(18.20)
                            .foregroundColor(.gray)
                    }
                    
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
    RegistrationStep2()
}

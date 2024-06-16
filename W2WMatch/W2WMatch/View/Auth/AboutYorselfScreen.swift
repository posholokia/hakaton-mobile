//
//  AboutYorselfScreen.swift
//  W2WMatch
//
//  Created by Игорь Крысин on 16.06.2024.
//

import Foundation
import SwiftUI

struct AboutYorselfScreen: View {
    @EnvironmentObject var mainVm: MainViewModel
    @State var user = AutorizedUser()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Супер! Расскажи немного\nподробнее")
                    .foregroundColor(Color("W2wBlueColor"))
                    .font(.custom("PoiretOne-Regular", size: 34))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 18)
                
                Text("На какие темы с тбой можно пообщаться? Или по каким темам ты можешь дать рекомендации?")
                    .font(Font.custom("Manrope", size: 14))
                    .tracking(0.28)
                    .foregroundColor(Color("W2wBlueColor"))
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(text: $user.yourselfinfo.theme.animation()) {
                    Text("Перечислите темы")
                        .font(Font.custom("Manrope", size: 14).weight(.light))
                        .lineSpacing(20)
                        .foregroundColor(Color("W2wLightBlueColor"))
                    
                }
                .textInputAutocapitalization(.never)
                .keyboardType(.default)
                .disableAutocorrection(true)
                .padding()
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                .stroke(Color("FrameRegistration"), lineWidth: 2))
                .foregroundStyle(Color("FrameRegistration"))
                .padding(.bottom, 25.0)
                Text("Расскажите нам о ядре Вашей целевовй аудитории")
                    .font(Font.custom("Manrope", size: 14))
                    .tracking(0.28)
                    .foregroundColor(Color("W2wBlueColor"))
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    TextField(text: $user.yourselfinfo.gender.animation()) {
                        Text("Пол")
                            .font(Font.custom("Manrope", size: 14).weight(.light))
                            .lineSpacing(20)
                            .foregroundColor(Color("W2wLightBlueColor"))
                        
                    }
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("FrameRegistration"), lineWidth: 2))
                    .foregroundStyle(Color("FrameRegistration"))
                    TextField(text: $user.yourselfinfo.age.animation()) {
                        Text("Возраст")
                            .font(Font.custom("Manrope", size: 14).weight(.light))
                            .lineSpacing(20)
                            .foregroundColor(Color("W2wLightBlueColor"))
                        
                    }
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("FrameRegistration"), lineWidth: 2))
                    .foregroundStyle(Color("FrameRegistration"))

                }
                .padding(.bottom, 8)
                HStack {
                    TextField(text: $user.yourselfinfo.incomeLevel.animation()) {
                        Text("Ур. дохода")
                            .font(Font.custom("Manrope", size: 14).weight(.light))
                            .lineSpacing(20)
                            .foregroundColor(Color("W2wLightBlueColor"))
                            .lineLimit(1)
                            
                    }
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("FrameRegistration"), lineWidth: 2))
                    .foregroundStyle(Color("FrameRegistration"))
                    TextField(text: $user.yourselfinfo.geographic.animation()) {
                        Text("ГЕО")
                            .font(Font.custom("Manrope", size: 14).weight(.light))
                            .lineSpacing(20)
                            .foregroundColor(Color("W2wLightBlueColor"))
                        
                    }
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                    .padding()
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("FrameRegistration"), lineWidth: 2))
                    .foregroundStyle(Color("FrameRegistration"))
                }
                .padding(.bottom, 8)
                TextField(text: $user.yourselfinfo.interests.animation()) {
                    Text("Интереcы")
                        .font(Font.custom("Manrope", size: 14).weight(.light))
                        .lineSpacing(20)
                        .foregroundColor(Color("W2wLightBlueColor"))
                    
                }
                .textInputAutocapitalization(.never)
                .keyboardType(.default)
                .disableAutocorrection(true)
                .padding()
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 15)
                .stroke(Color("FrameRegistration"), lineWidth: 2))
                .foregroundStyle(Color("FrameRegistration"))
                
                Button("Далее") {
                    mainVm.user = user
                    mainVm.successfullRegistration = false //тут все так??
                }
                .frame(width: geometry.size.width - 120, height: 45.0)
                .foregroundStyle(.white)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("W2wLightBlueColor"))
                }
                .padding(.top)
                Image("Vector")
                    .padding(.top, 38.0)
                
                //Spacer()
            }.frame(width: geometry.size.width - 120, height: geometry.size.height)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    AboutYorselfScreen()
}

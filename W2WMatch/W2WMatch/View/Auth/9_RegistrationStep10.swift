//
//  RegistrationStep10.swift
//  W2WMatch
//
//  Created by Floron on 22.06.2024.
//

import SwiftUI

struct RegistrationStep10: View {

    @State var brand = CreateBrandRequestBody()
    
    let optionsPublicSpeaker = ["Да",
                                "Нет"]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    
                    //Spacer()
                    
                    Text("Чем Вы можете быть полезны другим?")
                        .foregroundColor(Color("W2wBlueColor"))
                        .font(.custom("PoiretOne-Regular", size: 34))
                        .multilineTextAlignment(.center)
                        
                     
                   // Spacer()
                    
                    VStack {
                        
                        Text("На какие темы с Вами можно пообщаться? Или по каким темам Вы можете дать рекомендации?")
                            .font(Font.custom("Manrope", size: 14))
                            .tracking(0.28)
                            .foregroundColor(Color("W2wBlueColor"))
                            .padding(.bottom, 8)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 48)
                        
                        TextField(text: $brand.topics.animation()) {
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

                        Text("Готовы ли вы быть спикером прямого эфира или участвовать в публичном выступлении для резидентов?")
                            .font(Font.custom("Manrope", size: 14))
                            .tracking(0.28)
                            .foregroundColor(Color("W2wBlueColor"))
                            .padding(.bottom, 8)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 8)
                        
                        ForEach(optionsPublicSpeaker, id: \.self) { option in
                            TableRow(text: option)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        
                        
                    }
                    .padding(.horizontal, 65.0)
                    //.frame(width: 358)
                    
                    //Spacer()
                    
                    NavigationLink(destination: VeryImportantScreen(brand: brand)) {
                        Text("Далее")
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
    RegistrationStep10()
}

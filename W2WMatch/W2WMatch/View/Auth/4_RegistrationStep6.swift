//
//  RegistrationStep6.swift
//  W2WMatch
//
//  Created by Floron on 22.06.2024.
//

import SwiftUI

struct RegistrationStep6: View {

    @State var brand = CreateBrandRequestBody()
    
    let optionsCategory = ["Красота и здоровье",
                           "Товары для детей",
                           "Одежда и обувь",
                           "HoReCa",
                           "Украшения",
                           "Услуги",
                           "Товары для дома",
                           "Фрилансеры / агентства",
                           "Инфлюенсеры / блогеры"]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    
                    Spacer()
                    
                    Text("Расскажите\nо своем бизнесе")
                        .foregroundColor(Color("W2wBlueColor"))
                        .font(.custom("PoiretOne-Regular", size: 34))
                        .multilineTextAlignment(.center)
                        
                     
                    Spacer()
                    
                    VStack {

                        Text("К какой категории относится ваш\nбизнес?")
                            .font(Font.custom("Manrope", size: 14))
                            .tracking(0.28)
                            .foregroundColor(Color("W2wBlueColor"))
                            .padding(.bottom, 8)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("Выберите один вариант")
                            .font(Font.custom("Manrope", size: 12))
                            .tracking(0.28)
                            .foregroundColor(Color("SecondaryText"))
                           // .padding(.bottom)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(optionsCategory, id: \.self) { option in
                            TableRow(text: option)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
//                            if TableRow(text: option).isChecked {
//                                print("\(option) On 1")
//                            }
                            
                        }
                    }
                    .padding(.horizontal, 65.0)
                    //.frame(width: 358)
                    

                    NavigationLink(destination: RegistrationStep7(brand: brand)) {
                        Text("Далее")
                    }
                    .frame(width: geometry.size.width - 120, height: 45.0)
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("W2wLightBlueColor"))
                    }
                   // .padding(.top)
                    
                    Image("Vector")
                        //.padding(.top)
                    
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
    RegistrationStep6()
}

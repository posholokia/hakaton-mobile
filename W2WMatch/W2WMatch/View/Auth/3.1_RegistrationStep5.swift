//
//  RegistrationStep5.swift
//  W2WMatch
//
//  Created by Floron on 22.06.2024.
//

import SwiftUI

struct RegistrationStep5: View {

    @State var brand = CreateBrandRequestBody()
    
    let optionsAvgBill = ["0 - 1.000",
                          "1.000 - 10.000",
                          "10.000 - 100.000",
                          "100.000 - 500.000",
                          "500.000+"]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    
                   // Spacer()
                    
                    Text("Расскажите о своем\nбренде")
                        .foregroundColor(Color("W2wBlueColor"))
                        .font(.custom("PoiretOne-Regular", size: 34))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 50)
                        
                     
                  // Spacer()
                    
                    VStack {

                        Text("Средний чек вашего бренда (в рублях)?")
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
                            .padding(.bottom, 24)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(optionsAvgBill, id: \.self) { option in
                            TableRow(text: option)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
//                            if TableRow(text: option).isChecked {
//                                print("\(option) On 1")
//                            }
                            
                        }
                    }
                    .padding(.horizontal, 65.0)
                    //.frame(width: 358)
                    

                    NavigationLink(destination: RegistrationStep6(brand: brand)) {
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
                        .padding(.top, 30.0)
                    
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
    RegistrationStep5()
}

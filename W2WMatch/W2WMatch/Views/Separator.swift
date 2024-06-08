//
//  ContentView.swift
//  W2WMatch
//
//  Created by Floron on 02.06.2024.
//

import SwiftUI

struct Separator: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: 25)
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        
        
        
            
            GeometryReader { geometry in
                
                
                Path { path in
                    let size = min(geometry.size.width, geometry.size.height)
                    let nearLine = size / 2
                    let farLine = size * 0.5
                    let radius = size / 3.3
                    let delta: CGFloat = 20
                    
                    print("size: \(size)    |    nearLine: \(nearLine)    |  farLine: \(farLine)")
                    
                    path.addArc(center: .init(x: nearLine - radius - delta, y: nearLine),
                                radius: size / 4,
                                startAngle: .degrees(270),
                                endAngle: .degrees(90),
                                clockwise: false)
                    
                    path.addArc(center: .init(x: nearLine, y: nearLine + radius + delta),
                                radius: size / 4,
                                startAngle: .degrees(180),
                                endAngle: .degrees(0),
                                clockwise: false)
                    
//                    path.addArc(center: .init(x: nearLine + delta, y: nearLine),
//                                radius: size / 4,
//                                startAngle: .degrees(90),
//                                endAngle: .degrees(0),
//                                clockwise: false)
    
//                    path.addArc(center: .init(x: farLine, y: farLine),
//                                radius: size / 4,
//                                startAngle: .degrees(270),
//                                endAngle: .degrees(180),
//                                clockwise: true)
//                    path.addArc(center: .init(x: nearLine, y: farLine),
//                                radius: size / 4,
//                                startAngle: .degrees(0),
//                                endAngle: .degrees(270),
//                                clockwise: true)
//                    path.closeSubpath()
                }
                .stroke(Color.orange, lineWidth: 2)
            }
          
    }
}

#Preview {
    Separator()
}

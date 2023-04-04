//
//  CircleButtonVIew.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 4/4/23.
//

import SwiftUI

struct CircleButtonVIew: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.3), radius: 10, x: 0 , y : 0)
            .padding()
    }
}

struct CircleButtonVIew_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           
            CircleButtonVIew(iconName: "info")
                .previewLayout(.sizeThatFits)
//                .preferredColorScheme(.dark)
        }
       
    }
}

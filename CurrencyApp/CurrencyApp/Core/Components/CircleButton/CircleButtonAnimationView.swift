//
//  CircleButtonAnimationView.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 4/4/23.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding  var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1 : 0)
            .opacity(animate ? 0 : 1)
            .animation(animate ? Animation.easeOut(duration: 1) : .none, value: animate )
           
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
           .foregroundColor(Color.theme.red)
           .frame(width: 100, height: 100)
    }
}

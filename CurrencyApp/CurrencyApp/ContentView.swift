//
//  ContentView.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 4/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.theme.red
                .ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.theme.accent)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

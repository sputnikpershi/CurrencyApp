//
//  CurrencyAppApp.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 4/4/23.
//

import SwiftUI

@main
struct CurrencyAppApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}

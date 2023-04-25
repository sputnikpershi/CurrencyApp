//
//  HomeView.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 4/4/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                homeHeader
                SearchBarView(searchText: $vm.searchText)
                
                colomnTitles
                
                if !showPortfolio {
                    allCoinsList
                    .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden)

        }
        .environmentObject(dev.homeVM)
    }
}








extension HomeView {
    var homeHeader: some View {
        HStack {
            CircleButtonVIew(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background(
                CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prives")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)

            Spacer()

            CircleButtonVIew(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    
    private var allCoinsList: some View {
        List(vm.allCoins) {coin in
            CoinRowView(coin: coin, showHoldingsColumn: false)
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List(vm.allCoins) {coin in
            CoinRowView(coin: coin, showHoldingsColumn: true)
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        }
        .listStyle(.plain)
    }
    
    
    private var colomnTitles: some View {
        HStack {
            Text("coin")
            Spacer()
            Text(showPortfolio ? "holding" : "")
            Text("price")
                .frame(width: UIScreen.main.bounds.width/3.5, alignment: .trailing)

        }
            .font(.caption)
            .foregroundColor(Color.theme.secondaryText)
            .padding(.horizontal)
    }
}

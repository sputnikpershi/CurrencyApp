//
//  SearchBarView.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 24/4/23.
//

import SwiftUI

struct SearchBarView: View {
     
    @Binding var  searchText : String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent

                )
            
            
            TextField("seatch by name or sybmol", text: $searchText)
                .autocorrectionDisabled(true)
                .foregroundColor(Color.theme.accent)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.theme.accent)
                        .padding()
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .offset(x: 10)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                }
        }
        .font(.headline)
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
            .fill(Color.theme.background))
            .shadow(
            color: Color.theme.accent.opacity(0.15),
            radius: 10, x: 0, y: 0)
            .padding(.horizontal, 5)
    }
        
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
           
        SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
        
    }
}

//
//  UIApplication.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 25/4/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

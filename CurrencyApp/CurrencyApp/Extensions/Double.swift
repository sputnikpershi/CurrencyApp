//
//  Double.swift
//  CurrencyApp
//
//  Created by Kiryl Rakk on 5/4/23.
//

import Foundation

extension Double {
    
    
    /// Convert a Double to Currency with 2decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // default value
        formatter.currencyCode = "usd" // change currency
        formatter.currencySymbol = "$" // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Convert a Double to Currency  as String with 2 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///```
    func asCurrencyWith2Decimals () -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    
    
    /// Convert a Double to Currency with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12,3456
    ///Convert 0.123456 to $0,123456
    ///```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // default value
        formatter.currencyCode = "usd" // change currency
        formatter.currencySymbol = "$" // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Convert a Double to Currency  as String with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12,3456
    ///Convert 0.123456 to $0,123456
    ///```
    func asCurrencyWith6Decimals () -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    /// Convert a Double to Currency into String
    ///```
    ///Convert 0.123456 to 0,12
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    // Convert a Double to Currency into String
    ///```
    ///Convert 0,12 to 0,12%
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}

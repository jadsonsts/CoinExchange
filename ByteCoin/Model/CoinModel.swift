//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Jadson on 20/08/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    
    let rate: Double
    let quote: String
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
    
    var condidionEmoji: String {
        switch quote {
        case "AUD":
            return "🇦🇺"
        case "BRL":
            return "🇧🇷"
        case "CAD":
            return "🇨🇦"
        case "CNY":
            return "🇨🇳"
        case "EUR":
            return "🇪🇺"
        case "GBP":
            return "🏴󠁧󠁢󠁥󠁮󠁧󠁿"
        case "HKD":
            return "🇭🇰"
        case "IDR":
            return "🇮🇩"
        case "ILS":
            return "🇮🇱"
        case "INR":
            return "🇮🇳"
        case "JPY":
            return "🇯🇵"
        case "MXN":
            return "🇲🇽"
        case "NOK":
            return "🇳🇴"
        case "NZD":
            return "🇳🇿"
        case "PLN":
            return "🇵🇱"
        case "RON":
            return "🇷🇴"
        case "RUB":
            return "🇷🇺"
        case "SEK":
            return "🇸🇪"
        case "SGD":
            return "🇸🇬"
        case "USD":
            return "🇺🇲"
        case "ZAR":
            return "🇿🇦"
        default:
            return "🤑"
        }
    }
}


//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didUpdateCurrency (_ CoinManager: CoinManager, currency: CoinModel)
    func didFailWithError (error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "577F963D-5CEB-47D4-BCEA-92E2F170B5DD"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CurrencyManagerDelegate?
    
    func getCoinPrice (for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let bitCoinPrice = parseJson(safeData){
                        delegate?.didUpdateCurrency(self, currency: bitCoinPrice)
                        //print (String(format: "%.2f", bitCoinPrice.rate))
                    }
                }
//                //Format the data we got back as a string to be able to print it.
//                let dataString = String(data: data!, encoding: .utf8)
//                print(dataString)
            }
            task.resume()
        }
    }
    
    func parseJson(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            let quote = decodedData.asset_id_quote
            let currency = CoinModel(rate: rate, quote: quote)
            
            //let currency = CoinModel (rate: rate)
            return currency
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}

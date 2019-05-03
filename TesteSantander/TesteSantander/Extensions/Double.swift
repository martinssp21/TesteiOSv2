//
//  Double.swift
//  TesteSantander
//
//  Created by Rodrigo Martins on 02/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

extension Double {
    var ToCurrency: String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt_BR")
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}

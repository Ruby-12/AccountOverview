//
//  AccountOverviewModel.swift
//  AccountOverview
//
//  Created by Chandan on 22/02/23.
//

import Foundation


struct AccountActivityModel: Codable {
    let description: String
    let date: String
    let amount: String
    let referenceNumber: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case date
        case amount
        case referenceNumber = "reference_number"
    }
}

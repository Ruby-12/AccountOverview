//
//  AccountOverviewModel.swift
//  AccountOverview
//
//  Created by Chandan on 22/02/23.
//

import Foundation


struct AccountOverviewModel: Codable {
    let accountHolderName: String
    let mmid: String
    let nominee: String
    let ifsc, status: String
    let effectiveAvailableBalance, availableBalance: String
    let uncleared: String

    enum CodingKeys: String, CodingKey {
        case accountHolderName = "account_holder_name"
        case mmid, nominee, ifsc, status
        case effectiveAvailableBalance = "effective_available_balance"
        case availableBalance = "available_balance"
        case uncleared
    }
}

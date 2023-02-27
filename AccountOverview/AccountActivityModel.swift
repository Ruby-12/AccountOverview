
import Foundation
struct AccountActivityModel: Codable {
    let description: String
    let date: String
    let amount: String
    let referenceNumber: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case date
        case amount
        case referenceNumber = "reference_number"
        case type 
    }
}

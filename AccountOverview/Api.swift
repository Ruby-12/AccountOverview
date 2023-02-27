import Foundation

class AccountApi {
    
    func getAccountOverviewData() -> [AccountOverviewModel] {
        var data = [AccountOverviewModel]()
        guard let jsonUrl = Bundle.main.url(forResource: "AccountOverviewData", withExtension: "json") else {
            print("file not found")
            return data
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl)
            data = try JSONDecoder().decode([AccountOverviewModel].self, from: jsonData)
            print("data:", data)
        } catch {
            print(error.localizedDescription)
        }
        
        return data
    }
    
    
    func getAccountActivityData() -> [AccountActivityModel] {
        var data = [AccountActivityModel]()
        guard let jsonUrl = Bundle.main.url(forResource: "AccountActivityData", withExtension: "json") else {
            print("file not found")
            return data
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl)
            data = try JSONDecoder().decode([AccountActivityModel].self, from: jsonData)
            print("data:", data)
        } catch {
            print(error.localizedDescription)
        }
        
        return data
    }
}

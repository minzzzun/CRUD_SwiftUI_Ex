

import SwiftUI
import Combine
import Alamofire




final class UserViewModel : ObservableObject {
    @Published var users: [UserModel] = []
    private var baseURL = "https://67682970cbf3d7cefd37398c.mockapi.io/User"
    
    init(){
        fetchUsers()
    }
    
    
    func fetchUsers(){
        print(#fileID,#function,#line, "fetch")
        AF.request(baseURL)
            .validate()
            .responseDecodable(of: [UserModel].self){ [weak self] response in
                switch response.result {
                case .success(let users):
                    DispatchQueue.main.async {
                        self?.users = users
                        print(users)
                    }
                case .failure(let error):
                    print("Error fetching users: \(error.localizedDescription)")
                }
                
            }
    }
    
}

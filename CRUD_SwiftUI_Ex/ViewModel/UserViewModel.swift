

import SwiftUI
import Combine
import Alamofire




final class UserViewModel : ObservableObject {
    @Published var users: [UserModel] = []
    private var baseURL = "https://67682970cbf3d7cefd37398c.mockapi.io/User"
    
    init(){
        fetchUsers()
    }
    
    //MARK: - GET
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
    
    
    //MARK: - DELETE
    func deleteUsers(id: String, completion: @escaping (Bool) -> Void){
        let deleteURL = "\(baseURL)/\(id)"
        
        AF.request(deleteURL, method: .delete)
            .validate()
            .response { [weak self] response in
                switch response.result {
                case .success:
                    DispatchQueue.main.async {
                        self?.fetchUsers()
                        completion(true)
                    }
    
                case .failure(let error):
                    print("Delete Error : \(error.localizedDescription)")
                    completion(false)
                }
            }
        
        
    }
    
    
    //MARK: - POST
    func addUser(name: String, part: String, age: Int, completion: @escaping (Bool) -> Void ) {
        let parameters : [String: Any] = [
            "name": name,
            "part": part,
            "age": age
        ]
        
        AF.request(baseURL,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
        .validate()
        .responseDecodable(of: UserModel.self ) { [weak self] (response: AFDataResponse<UserModel>) in
            switch response.result {
                        case .success(_):
                            DispatchQueue.main.async {
                                self?.fetchUsers()
                                completion(true)
                            }
                        case .failure(let error):
                            print("Error adding user: \(error.localizedDescription)")
                            completion(false)
                        }        }
        
        
    }
    
    
    
    
    //MARK: - PATCH
    func updateUser(id: String, name: String, part: String, age: Int, completion: @escaping (Bool) -> Void) {
        let parameters: [String: Any] = [
            "name": name,
            "part": part,
            "age": age
        ]
        
        let updateURL = "\(baseURL)/\(id)"
        
        AF.request(updateURL,
                  method: .patch,
                  parameters: parameters,
                  encoding: JSONEncoding.default)
        .validate()
        .responseDecodable(of: UserModel.self) { [weak self] (response: AFDataResponse<UserModel>) in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.fetchUsers()
                    completion(true)
                }
            case .failure(let error):
                print("Error updating user: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
}

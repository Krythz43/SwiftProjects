//
//  Networking.swift
//  Nitigya1
//
//  Created by Krithick Santhosh on 10/01/23.
//

import Foundation

enum UserError :  Error {
    case invalidURL
    case noDataAvailable
    case canNotProcessData
}

struct Networking {
    static let sharedInstance = Networking()
    let session = URLSession.shared
    
    let userURL = "https://jsonplaceholder.typicode.com/users"
    
    func getUsers(completion : @escaping (Result<[User],UserError>) -> Void) {
        guard let UserURL = URL(string: userURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let dataTask = session.dataTask(with: UserURL){data,_,_ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode([User].self, from: jsonData)
                completion(.success(userResponse))
            }
            catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
}

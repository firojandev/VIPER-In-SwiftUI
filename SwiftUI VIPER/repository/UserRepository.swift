//
//  UserRepository.swift
//  SwiftUI VIPER
//
//  Created by Md Altaf Hoshain Firoj on 21/5/25.
//

import Foundation

protocol UserRepository {
    func getUsers() async throws -> [UserModel]
}

final class ApiUserRepository: UserRepository {
    func getUsers() async throws -> [UserModel] {
       let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([UserModel].self, from: data)
    }
    
    
}

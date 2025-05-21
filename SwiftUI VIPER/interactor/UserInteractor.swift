//
//  UserInteractor.swift
//  SwiftUI VIPER
//
//  Created by Md Altaf Hoshain Firoj on 21/5/25.
//

import Foundation

protocol UserInteractor {
    func fetchUsers() async throws -> [UserModel]
}

class UserListInteractor: UserInteractor {
    
    private let repository: UserRepository
    
    init(repository:UserRepository){
        self.repository = repository
    }
    
    func fetchUsers() async throws -> [UserModel] {
        return try await repository.getUsers()
    }
    
    
}

//
//  UserViewModel.swift
//  SwiftUI VIPER
//
//  Created by Md Altaf Hoshain Firoj on 21/5/25.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    
    @Published var users: [UserModel] = []
    @Published var isLoading = false
    @Published var error: String?
    
    private let interactor: UserInteractor
    
    init(interactor: UserInteractor) {
        self.interactor = interactor
    }
    
    func loadUsers() async {
        isLoading = true
        error = nil
        do {
            users = try await interactor.fetchUsers()
        } catch {
               self.error = error.localizedDescription
           }
           isLoading = false
       }
}

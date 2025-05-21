//
//  UsersListView.swift
//  SwiftUI VIPER
//
//  Created by Md Altaf Hoshain Firoj on 21/5/25.
//

import Foundation
import SwiftUI


struct UserListView: View {
    @StateObject var viewModel: UserViewModel

    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .task {
                await viewModel.loadUsers()
            }
        }
    }
}


//
//  ContentView.swift
//  SwiftUI VIPER
//
//  Created by Md Altaf Hoshain Firoj on 21/5/25.
//

import SwiftUI

struct AppDependencies {
    @MainActor
    static func makeUserListViewModel() -> UserViewModel {
        let repo = ApiUserRepository()
        let interactor = UserListInteractor(repository: repo)
        return UserViewModel(interactor: interactor)
    }
}
struct ContentView: View {
    var body: some View {
        UserListView(viewModel: AppDependencies.makeUserListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

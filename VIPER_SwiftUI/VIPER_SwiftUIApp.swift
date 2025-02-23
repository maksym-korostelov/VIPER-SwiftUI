//
//  VIPER_SwiftUIApp.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import SwiftUI

@main
struct VIPER_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            // Assemble the UserList module
            let interactor = UserListInteractor()
            let router = UserListRouter()
            let presenter = UserListPresenter(interactor: interactor, router: router)
            UserListView(presenter: presenter)
        }
    }
}

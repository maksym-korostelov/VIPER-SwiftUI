//
//  UserListRouter.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 23/02/2025.
//

import SwiftUI

/// Protocol defining the router's methods
protocol UserListRouterProtocol {
    func makeUserDetailView(user: User, delegate: UserDetailDelegate) -> AnyView
}

/// Router for the UserList module
class UserListRouter: UserListRouterProtocol {
    func makeUserDetailView(user: User, delegate: UserDetailDelegate) -> AnyView {
        // Assemble the UserDetail module
        let interactor = UserDetailInteractor(user: user)
        let router = UserDetailRouter()
        let presenter = UserDetailPresenter(interactor: interactor, router: router)
        presenter.delegate = delegate
        let view = UserDetailView(presenter: presenter)
        return AnyView(view)
    }
}

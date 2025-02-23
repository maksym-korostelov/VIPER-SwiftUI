//
//  UserListPresenter.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 23/02/2025.
//

import Combine

/// Presenter for the UserList module
class UserListPresenter: ObservableObject {
    /// Published users array to update the view
    @Published var users: [User] = []
    /// Published property to control navigation to the detail view
    @Published var navigateToDetail: Bool = false
    /// The selected user
    var selectedUser: User?

    private var interactor: UserListInteractorInputProtocol
    var router: UserListRouterProtocol

    init(interactor: UserListInteractorInputProtocol, router: UserListRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.interactor.presenter = self
    }

    /// Fetches users via the interactor
    func fetchUsers() {
        interactor.fetchUsers()
    }

    /// Handles user selection and triggers navigation
    func selectUser(_ user: User) {
        selectedUser = user
        navigateToDetail = true
    }

    /// Updates a user via the interactor
    func updateUser(_ user: User) {
        interactor.updateUser(user)
    }
}

/// Conforming to the interactor output protocol to receive data
extension UserListPresenter: UserListInteractorOutputProtocol {
    func didFetchUsers(_ users: [User]) {
        self.users = users
    }
}

/// Conforming to UserDetailDelegate to receive updates from the detail presenter
extension UserListPresenter: UserDetailDelegate {
    func userDetailPresenter(_ presenter: UserDetailPresenter, didUpdateUser user: User) {
        // Update user in the interactor
        updateUser(user)
        // Dismiss the detail view
        navigateToDetail = false
    }
}

//
//  UserListInteractor.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 23/02/2025.
//

import Foundation

/// Protocol defining the interactor's input methods
protocol UserListInteractorInputProtocol {
    var presenter: UserListInteractorOutputProtocol? { get set }
    func fetchUsers()
    func updateUser(_ user: User)
}

/// Protocol defining the interactor's output methods to the presenter
protocol UserListInteractorOutputProtocol: AnyObject {
    func didFetchUsers(_ users: [User])
}

/// Interactor responsible for fetching and updating user data
class UserListInteractor: UserListInteractorInputProtocol {
    weak var presenter: UserListInteractorOutputProtocol?
    private var users: [User] = []

    /// Fetches users (simulated network call)
    func fetchUsers() {
        // Simulate asynchronous data fetching
        DispatchQueue.global().async {
            // Simulated network delay
            Thread.sleep(forTimeInterval: 1)
            // Sample user data
            self.users = [
                User(id: 1, name: "Alice"),
                User(id: 2, name: "Bob"),
                User(id: 3, name: "Charlie")
            ]
            // Return to main thread to update the presenter
            DispatchQueue.main.async {
                self.presenter?.didFetchUsers(self.users)
            }
        }
    }

    /// Updates a user in the user's array
    func updateUser(_ user: User) {
        if let index = users.firstIndex(of: user) {
            users[index] = user
            // Notify the presenter with the updated users array
            presenter?.didFetchUsers(users)
        }
    }
}

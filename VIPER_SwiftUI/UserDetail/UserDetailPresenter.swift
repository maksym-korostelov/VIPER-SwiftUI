//
//  UserDetailPresenter.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 23/02/2025.
//

import Combine

/// Protocol for communication from presenter to view
protocol UserDetailPresenterProtocol: ObservableObject {
    var userName: String { get set }
    func saveUser()
}

/// Delegate protocol to communicate updates back to the UserListPresenter
protocol UserDetailDelegate: AnyObject {
    func userDetailPresenter(_ presenter: UserDetailPresenter, didUpdateUser user: User)
}

/// Presenter for the UserDetail module
class UserDetailPresenter: ObservableObject, UserDetailPresenterProtocol {
    /// Published userName to bind to the view's TextField
    @Published var userName: String = ""

    private var interactor: UserDetailInteractorInputProtocol
    var router: UserDetailRouterProtocol?
    weak var delegate: UserDetailDelegate?

    init(interactor: UserDetailInteractorInputProtocol, router: UserDetailRouterProtocol?) {
        self.interactor = interactor
        self.router = router
        // Initialize userName with the current user's name
        self.userName = interactor.user.name
    }

    /// Saves the updated user information
    func saveUser() {
        // Update the user's name
        interactor.user.name = userName
        // Notify the delegate (UserListPresenter)
        delegate?.userDetailPresenter(self, didUpdateUser: interactor.user)
        // Optionally handle navigation if required
        // Navigation is controlled by the parent view in this case
    }
}

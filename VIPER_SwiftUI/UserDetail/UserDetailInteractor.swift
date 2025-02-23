//
//  UserDetailInteractor.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 23/02/2025.
//

import Foundation

/// Protocol defining the interactor's input methods
protocol UserDetailInteractorInputProtocol {
    var presenter: UserDetailInteractorOutputProtocol? { get set }
    var user: User { get set }
}

/// Protocol defining the interactor's output methods to the presenter
protocol UserDetailInteractorOutputProtocol: AnyObject {
    // No output methods needed for this example
}

/// Interactor for the UserDetail module
class UserDetailInteractor: UserDetailInteractorInputProtocol {
    weak var presenter: UserDetailInteractorOutputProtocol?
    var user: User

    init(user: User) {
        self.user = user
    }
}

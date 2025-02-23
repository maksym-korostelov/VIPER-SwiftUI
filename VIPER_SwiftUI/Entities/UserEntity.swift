//
//  UserEntity.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 23/02/2025.
//

import Foundation

/// User entity that represents a user model
struct User: Identifiable, Equatable {
    let id: Int
    var name: String

    /// Equatable conformance for comparing `User` instances
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}

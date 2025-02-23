//
//  UserListView.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 23/02/2025.
//

import SwiftUI

/// SwiftUI view for the UserList module
struct UserListView: View {
    @StateObject var presenter: UserListPresenter

    var body: some View {
        NavigationView {
            List(presenter.users) { user in
                // Navigate to detail view on selection
                Button(action: {
                    presenter.selectUser(user)
                }) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .onAppear {
                // Fetch users when the view appears
                presenter.fetchUsers()
            }
            // NavigationLink controlled by navigateToDetail
            .background(
                NavigationLink(
                    destination: presenter.router.makeUserDetailView(
                        user: presenter.selectedUser ?? User(id: 0, name: ""),
                        delegate: presenter
                    ),
                    isActive: $presenter.navigateToDetail
                ) {
                    EmptyView()
                }
                .hidden() // Hide the navigation link
            )
        }
    }
}

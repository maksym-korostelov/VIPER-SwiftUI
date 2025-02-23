//
//  UserDetailView.swift
//  VIPER_SwiftUI
//
//  Created by Maksym Korostelov on 23/02/2025.
//

import SwiftUI

/// SwiftUI view for the UserDetail module
struct UserDetailView: View {
    @ObservedObject var presenter: UserDetailPresenter

    var body: some View {
        Form {
            // Bind the TextField to presenter's userName property
            TextField("Name", text: $presenter.userName)
                .autocapitalization(.words)
        }
        .navigationBarTitle("Edit User", displayMode: .inline)
        .navigationBarItems(trailing: Button("Save") {
            // Call saveUser when Save button is tapped
            presenter.saveUser()
        })
    }
}

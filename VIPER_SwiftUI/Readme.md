Application Overview
Functionality: A simple app that fetches a list of users from a mock API and displays their names in a list. When a user taps on a name, the app navigates to a detail view showing more information.

Key Objectives:

Implement the VIPER architecture in both UIKit and SwiftUI.
Highlight the differences in how VIPER components interact in each framework.
Focus on the View, Presenter, and Router to show the most significant contrasts.

_Data Flow Explanation_
UserListView Appears:

UserListView calls presenter.fetchUsers() in onAppear.
  UserListPresenter requests UserListInteractor to fetch users.
  UserListInteractor fetches users and returns them via presenter.didFetchUsers(users).
  UserListPresenter updates @Published var users, causing UserListView to update the list.

User Selects a User:
  Tapping a user calls presenter.selectUser(user).
  UserListPresenter sets selectedUser and navigateToDetail = true.
  The NavigationLink in UserListView becomes active and navigates to UserDetailView.

UserDetailView Displays:
  UserDetailView shows the user's name in a TextField, bound to presenter.userName.

User Edits and Saves:
  User edits the name and taps "Save".
  UserDetailPresenter updates interactor.user.name and calls delegate?.userDetailPresenter(self, didUpdateUser: user).
  UserListPresenter, acting as the delegate, receives the updated user.
  UserListPresenter calls updateUser(_ user: User) to update the user via UserListInteractor.
  UserListInteractor updates the user and notifies presenter.didFetchUsers(users).
  UserListPresenter updates the users array, and UserListView reflects the changes.
  UserListPresenter sets navigateToDetail = false to dismiss UserDetailView.

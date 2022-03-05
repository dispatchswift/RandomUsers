//
//  UsersView.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import SwiftUI

struct UsersView: View {
	@StateObject var viewModel = UsersViewModel()
	
	var body: some View {
		NavigationView {
			List {
				ForEach(viewModel.users) { user in
					let destinationViewModel = UsersDetailViewModel(user: user)
					NavigationLink(
						destination: UsersDetailView(viewModel: destinationViewModel)
					) {
						UsersRowView(
							firstName: user.firstName,
							lastName: user.lastName,
							avatarURL: user.avatar
						)
					}
				}
			}
			.navigationTitle("Random Users")
			.refreshable {
				await viewModel.getRandomUsers(total: 5)
			}
		}
	}
}

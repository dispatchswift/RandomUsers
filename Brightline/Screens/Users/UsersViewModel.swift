//
//  UsersViewModel.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

@MainActor class UsersViewModel: ObservableObject {
	@Published var users: [User] = []
	
	private var service = NetworkService()
	
	init() {
		Task {
			await getRandomUsers(total: 5)
		}
	}
	
	func getRandomUsers(total: Int) async {
		do {
			users = try await withThrowingTaskGroup(of: User.self) { group in
				for _ in 0..<total {
					group.addTask {
						return try await self.service.getRandomUser(url: "https://random-data-api.com/api/users/random_user")
					}
				}
				
				let allUsers = try await group.reduce(into: [User]()) { result, user in
					result.append(user)
				}
				
				return allUsers
			}
		} catch {
			print("Failed to get users")
		}
	}
}

//
//  UsersDetailViewModel.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

@MainActor class UsersDetailViewModel: ObservableObject {
	@Published private var user: User
	
	var fullName: String {
		return "\(user.firstName) \(user.lastName)"
	}
	
	var avatarURL: URL? {
		return URL(string: user.avatar)
	}
		
	init(user: User) {
		self.user = user
	}
	
	func address() -> String {
		let address = user.address
		return "\(address.streetAddress) \(address.streetName) \(address.city), \(address.state) \(address.zipCode)"
	}
	
	func dateOfBirth() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		
		guard let newDate = dateFormatter.date(from: user.dateOfBirth) else {
			return "N/A"
		}
		
		dateFormatter.dateFormat = "MMMM d, yyyy"
		return dateFormatter.string(from: newDate)
	}
}

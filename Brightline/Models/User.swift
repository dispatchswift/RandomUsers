//
//  User.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

struct User: Codable, Identifiable {
	let id: Int
	let uid: String
	let password: String
	let firstName: String
	let lastName: String
	let username: String
	let email: String
	let avatar: String
	let gender: String
	let phoneNumber: String
	let socialInsuranceNumber: String
	let dateOfBirth: String
	let employment: Employment
	let address: Address
	let creditCard: CreditCard
	let subscription: Subscription
}

extension User {
	enum CodingKeys: String, CodingKey {
		case id
		case uid
		case password
		case firstName = "first_name"
		case lastName = "last_name"
		case username
		case email
		case avatar
		case gender
		case phoneNumber = "phone_number"
		case socialInsuranceNumber = "social_insurance_number"
		case dateOfBirth = "date_of_birth"
		case employment
		case address
		case creditCard = "credit_card"
		case subscription
	}
}

extension User {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(Int.self, forKey: .id)
		uid = try container.decode(String.self, forKey: .uid)
		password = try container.decode(String.self, forKey: .password)
		firstName = try container.decode(String.self, forKey: .firstName)
		lastName = try container.decode(String.self, forKey: .lastName)
		username = try container.decode(String.self, forKey: .username)
		email = try container.decode(String.self, forKey: .email)
		avatar = try container.decode(String.self, forKey: .avatar)
		gender = try container.decode(String.self, forKey: .gender)
		phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
		socialInsuranceNumber = try container.decode(String.self, forKey: .socialInsuranceNumber)
		dateOfBirth = try container.decode(String.self, forKey: .dateOfBirth)
		employment = try container.decode(Employment.self, forKey: .employment)
		address = try container.decode(Address.self, forKey: .address)
		creditCard = try container.decode(CreditCard.self, forKey: .creditCard)
		subscription = try container.decode(Subscription.self, forKey: .subscription)
	}
}

//
//  Subscription.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

struct Subscription: Codable {
	let plan: String
	let status: String
	let paymentMethod: String
	let term: String
}

extension Subscription {
	enum CodingKeys: String, CodingKey {
		case plan
		case status
		case paymentMethod = "payment_method"
		case term
	}
}

extension Subscription {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		plan = try container.decode(String.self, forKey: .plan)
		status = try container.decode(String.self, forKey: .status)
		paymentMethod = try container.decode(String.self, forKey: .paymentMethod)
		term = try container.decode(String.self, forKey: .term)
	}
}

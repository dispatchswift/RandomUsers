//
//  CreditCard.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

struct CreditCard: Codable {
	let ccNumber: String
}

extension CreditCard {
	enum CodingKeys: String, CodingKey {
		case ccNumber = "cc_number"
	}
}

extension CreditCard {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		ccNumber = try container.decode(String.self, forKey: .ccNumber)
	}
}

//
//  Address.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

struct Address: Codable {
	let city: String
	let streetName: String
	let streetAddress: String
	let zipCode: String
	let state: String
	let country: String
	let coordinates: Coordinates
}

extension Address {
	enum CodingKeys: String, CodingKey {
		case city
		case streetName = "street_name"
		case streetAddress = "street_address"
		case zipCode = "zip_code"
		case state
		case country
		case coordinates
	}
}

extension Address {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		city = try container.decode(String.self, forKey: .city)
		streetName = try container.decode(String.self, forKey: .streetName)
		streetAddress = try container.decode(String.self, forKey: .streetAddress)
		zipCode = try container.decode(String.self, forKey: .zipCode)
		state = try container.decode(String.self, forKey: .state)
		country = try container.decode(String.self, forKey: .country)
		coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
	}
}

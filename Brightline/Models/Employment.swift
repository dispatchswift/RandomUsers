//
//  Employment.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

struct Employment: Codable {
	let title: String
	let keySkill: String
}

extension Employment {
	enum CodingKeys: String, CodingKey {
		case title
		case keySkill = "key_skill"
	}
}

extension Employment {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		title = try container.decode(String.self, forKey: .title)
		keySkill = try container.decode(String.self, forKey: .keySkill)
	}
}

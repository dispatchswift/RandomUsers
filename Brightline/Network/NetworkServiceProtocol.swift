//
//  NetworkServiceProtocol.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

protocol NetworkServiceProtocol {
	func getRandomUser(url: String) async throws -> User
}

//
//  NetworkService.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
	func getRandomUser(url: String) async throws -> User {
		guard let url = URL(string: url) else {
			throw NetworkError.badURL
		}
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let httpURLResponse = response as? HTTPURLResponse,
					(200...299).contains(httpURLResponse.statusCode) else {
						throw NetworkError.badResponse((response as! HTTPURLResponse).statusCode)
					}
		
		guard let user = try? JSONDecoder().decode(User.self, from: data) else {
			throw NetworkError.decodingError
		}
		
		return user
	}
}

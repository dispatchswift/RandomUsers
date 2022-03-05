//
//  NetworkError.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import Foundation

enum NetworkError {
	case badURL
	case badResponse(_ statusCode: Int)
	case badData
	case decodingError
	case unknown
}

extension NetworkError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .badURL:
			return "❌ Bad URL"
		case .badResponse:
			return "❌ Bad response"
		case .badData:
			return "❌ Bad data."
		case .decodingError:
			return "❌ Decoding error."
		case .unknown:
			return "Unknown error."
		}
	}
}

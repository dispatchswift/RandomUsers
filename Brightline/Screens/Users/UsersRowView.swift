//
//  UsersRowView.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import SwiftUI

struct UsersRowView: View {
	let firstName: String
	let lastName: String
	let avatarURL: String
	
	var body: some View {
		HStack(spacing: 12) {
			if let url = URL(string: avatarURL) {
				AsyncImage(
					url: url
				) { image in
					image
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(maxWidth: 75, maxHeight: 75)
				} placeholder: {
					ProgressView()
						.frame(width: 75, height: 75)
				}
			} else {
				Image(systemName: "person")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 75, height: 75)
			}
			
			Text("\(firstName) \(lastName)")
		}
	}
}

//
//  UsersDetailView.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import SwiftUI

struct UsersDetailView: View {
	@ObservedObject var viewModel: UsersDetailViewModel
	
	init(viewModel: UsersDetailViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				if let url = viewModel.avatarURL {
					AsyncImage(
						url: url
					) { image in
						StretchyParallaxHeaderView(image: image)
					} placeholder: {
						ProgressView()
							.frame(height: 250)
					}
				} else {
					StretchyParallaxHeaderView(image: Image(systemName: "person"))
				}
				
				VStack(alignment: .leading, spacing: 8) {
					HStack {
						Text("Name: ")
							.font(.caption)
							.foregroundColor(.gray)
						Text(viewModel.fullName)
							.font(.headline)
					}
					
					HStack {
						Text("Address: ")
							.font(.caption)
							.foregroundColor(.gray)
						Text(viewModel.address())
							.font(.body)
							.lineLimit(nil)
					}
					
					HStack {
						Text("DOB: ")
							.font(.caption)
							.foregroundColor(.gray)
						Text(viewModel.dateOfBirth())
							.font(.body)
					}
				}
				.padding()
			}
		}
	}
}

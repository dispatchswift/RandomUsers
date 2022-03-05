//
//  StretchyParallaxHeaderView.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import SwiftUI

struct StretchyParallaxHeaderView: View {
	let image: Image
	
	var body: some View {
		GeometryReader { geometry in
			VStack {
				if geometry.frame(in: .global).minY <= 0 {
					image
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: geometry.size.width, height: geometry.size.height)
						.offset(y: geometry.frame(in: .global).minY / 7)
						.background(.gray)
						.clipped()
				} else {
					image
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
						.background(.gray)
						.clipped()
						.offset(y: -geometry.frame(in: .global).minY)
				}
			}
		}
		.frame(height: 250)
	}
}


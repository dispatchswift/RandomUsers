//
//  BrightlineApp.swift
//  Brightline
//
//  Created by Amari Duran on 3/4/22.
//

import SwiftUI

@main
struct BrightlineApp: App {
	
	init() {
		#if PRODUCTION
		print("🛠 Environment: PRODUCTION")
		#elseif STAGING
		print("🛠 Environment: STAGING")
		#else
		print("🛠 Environment: DEVELOPMENT")
		#endif
	}
	
	var body: some Scene {
		WindowGroup {
			UsersView()
		}
	}
}

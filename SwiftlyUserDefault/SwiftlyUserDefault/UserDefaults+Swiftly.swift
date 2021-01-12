//
//  UserDefaults+Swiftly.swift
//  SwiftlyUserDefault
//
//  Created by Fernando Olivares on 1/11/21.
//  Copyright © 2021 linsaeng. All rights reserved.
//

import Foundation

public extension UserDefaults {
	
	func setValue<T>(_ key: SwiftlyUserDefaultable, value: T) {
		setValue(value, forKey: key.key)
	}
	
	func getValue<T>(_ key: SwiftlyUserDefaultable) -> T? {
		return value(forKey: key.key) as? T
	}
	
	func deleteValue(_ key: SwiftlyUserDefaultable) {
		removeObject(forKey: key.key)
	}
	
	func deleteAllValue(_ keys: [SwiftlyUserDefaultable]) {
		for key in keys {
			deleteValue(key)
		}
	}
	
}

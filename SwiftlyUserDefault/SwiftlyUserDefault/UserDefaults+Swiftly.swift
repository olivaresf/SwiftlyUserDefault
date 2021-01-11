//
//  UserDefaults+Swiftly.swift
//  SwiftlyUserDefault
//
//  Created by Fernando Olivares on 1/11/21.
//  Copyright © 2021 linsaeng. All rights reserved.
//

import Foundation

extension UserDefaults {
	
	@discardableResult
	public static func setValue<T>(_ key: SwiftlyUserDefaultable, value: T) -> Bool {
		db.setValue(value, forKey: key.key)
		return db.synchronize()
	}
	
	public static func getValue<T>(_ key: SwiftlyUserDefaultable) -> T? {
		return db.value(forKey: key.key) as? T
	}
	
	@discardableResult
	public static func deleteValue(_ key: SwiftlyUserDefaultable) -> Bool {
		db.removeObject(forKey: key.key)
		return db.synchronize()
	}
	
	public static func deleteAllValue(_ keys: SwiftlyUserDefaultable...) {
		for key in keys {
			self.deleteValue(key)
		}
	}
	
}

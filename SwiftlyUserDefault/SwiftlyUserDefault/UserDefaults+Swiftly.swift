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
	public func setValue<T>(_ key: SwiftlyUserDefaultable, value: T) -> Bool {
		setValue(value, forKey: key.key)
		return synchronize()
	}
	
	public func getValue<T>(_ key: SwiftlyUserDefaultable) -> T? {
		return value(forKey: key.key) as? T
	}
	
	@discardableResult
	public func deleteValue(_ key: SwiftlyUserDefaultable) -> Bool {
		removeObject(forKey: key.key)
		return synchronize()
	}
	
	public func deleteAllValue(_ keys: SwiftlyUserDefaultable...) {
		for key in keys {
			self.deleteValue(key)
		}
	}
	
}

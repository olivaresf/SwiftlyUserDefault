//
//  SwiftlyUserDefault.swift
//  SwiftlyUserDefault
//
//  Created by saenglin on 2019/12/27.
//  Copyright © 2019 linsaeng. All rights reserved.
//

import Foundation

public protocol SwiftlyUserDefaultable {
    var key: String { get }
}

@available (*, deprecated, message: "Use `UserDefaults` extension directly.")
public class SwiftlyUserDefault: NSObject {
    
    private static let db = UserDefaults.standard

    private override init() { super.init() }
    
    @discardableResult
    public static func setValue<T>(_ key: SwiftlyUserDefaultable, value: T) -> Bool {
        db.setValue(key, value: value)
        return true
    }
    
    public static func getValue<T>(_ key: SwiftlyUserDefaultable) -> T? {
		return db.getValue(key)
    }
    
    @discardableResult
    public static func deleteValue(_ key: SwiftlyUserDefaultable) -> Bool {
        db.deleteValue(key)
        return true
    }
    
    public static func deleteAllValue(_ keys: SwiftlyUserDefaultable...) {
		db.deleteAllValue(keys)
    }
}

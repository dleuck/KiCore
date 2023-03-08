//
//  File.swift
//  
//
//  Created by Daniel Leuck on 2023/03/08.
//

import Foundation

extension Double: SoftNullable {
    public var isNull: Bool {
        return self.isNaN
    }
}

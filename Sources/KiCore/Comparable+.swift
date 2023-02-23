//
//  File.swift
//  
//
//  Created by Daniel Leuck on 2023/02/23.
//

public extension Comparable {
    func clamp(_ limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

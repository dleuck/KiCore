//
//  Grid.swift
//  
//
//  Created by Daniel Leuck on 2022/02/16.
//

import Foundation

public class Grid<T>: CustomStringConvertible, Equatable {
    
    public static func == (lhs: Grid<T>, rhs: Grid<T>) -> Bool {
        return lhs.description == rhs.description
    }

    var rows: Array<Array<T>>
    
    public init(width: Int, height: Int, fill: T) {
        rows = [[T]](repeating: Array<T>(repeating: fill, count: width), count: height)
    }

    public subscript(x:Int, y:Int) -> T {
        get { return rows[y][x] }
        set { rows[y][x] = newValue }
    }
    
    public subscript(row:Int) -> Array<T> {
        return rows[row]
    }
    
    public var description: String { rows.description }
        
    public var plainDescription: String {
        var output = ""
        for row in rows {
            for item in row {
                output+="\(item)"
            }
            output+="\n"
        }
        return output
    }
}

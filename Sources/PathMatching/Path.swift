//
//  Path.swift
//  PathMatching
//
//  Created by Sven Herzberg on 29.11.22.
//

/// Represents a sequence of path components.
public struct Path {
    var components: [String]
    
    /// Create a path representing `components`.
    public init(components: [String]) {
        self.components = components
    }
}

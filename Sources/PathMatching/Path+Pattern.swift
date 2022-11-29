//
//  Path+Pattern.swift
//  PathMatching
//
//  Created by Sven Herzberg on 29.11.22.
//

extension Path {
    /// A path matching pattern.
    public enum Pattern {
        case constant(String)
        case prefix(String, [String])
    }
    
    public static func ~= (pattern: Pattern, value: Path) -> Bool {
        switch pattern {
        case let .constant(constant):
            return value.components == [constant]
        case let .prefix(prefix, tail):
            return value.components == CollectionOfOne(prefix) + tail
        }
    }
}

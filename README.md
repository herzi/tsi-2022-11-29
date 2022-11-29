# TSI 2022-12-01: Path Matching

This package contains a small module `PathMatching` containing the following types:

## Reproduction of the Underlying Issue

1. Open this package using Xcode. The package was created using Xcode 14.1 (14B47b) on a MacBook Pro 13" (2020) running macOS 12.6.1 (21G217).
2. The package is self-contained, there isn't even a dependency on `Foundation`.
3. Run all tests, you'll realize that `[PathMatchingTests.PathMatchingTests testBindSuffix]` fails expectedly.
4. Open the failing test and replace `#if true` with `#if false` to see the problem.
5. Compilation will now fail with an error message like this one:

> /Users/herzi/Workspace/tsi-2022-12-01/Tests/PathMatchingTests/PathMatchingTests.swift:57:35: error: pattern variable binding cannot appear in an expression
>         case let .prefix("hello", world): // ERROR: Pattern variable binding cannot appear in an expression
>                                   ^

Now the big question: *How to capture values as constants from pattern matching with custom types?*  

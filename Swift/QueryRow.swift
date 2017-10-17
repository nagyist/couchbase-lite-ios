//
//  QueryRow.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 3/22/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


/// A row of data generated by a Query.
public class QueryRow {
    
    /// The projecting result value at the given index.
    ///
    /// - Parameter index: The index.
    /// - Returns: The value.
    public func value(at index: Int) -> Any? {
        return impl.value(at: UInt(index))
    }
    
    
    /// The projecting result value at the given index as a Boolean value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> Bool {
        return impl.boolean(at: UInt(index))
    }
    
    
    /// The projecting result value at the given index as an Integer value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> Int {
        return impl.integer(at: UInt(index))
    }
    
    
    /// The projecting result value at the given index as an Integer value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> Int64 {
        return impl.longLong(at: UInt(index))
    }
    
    
    /// The projecting result value at the given index as a Float value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> Float {
        return impl.float(at: UInt(index))
    }
    
    
    /// The projecting result value at the given index as a Double value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> Double {
        return impl.double(at: UInt(index))
    }
    
    
    /// The projecting result value at the given index as an String value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> String? {
        return impl.string(at: UInt(index))
    }
    
    
    /// The projecting result value at the given index as a Date value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> Date? {
        return impl.date(at: UInt(index))
    }
    
    
    /// The projecting result value at the given index as an Array value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> [Any]? {
        return impl.value(at: UInt(index)) as? [Any]
    }
    
    
    /// The projecting result value at the given index as a Dictionary value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> [String:Any]? {
        return impl.value(at: UInt(index)) as? [String:Any]
    }
    
    
    /// The projecting result value at the given index as an Object value.
    ///
    /// - Parameter index: The index.
    public subscript(index: Int) -> Any? {
        return impl.value(at: UInt(index))
    }
    
    // MARK: Internal
    
    let impl: CBLQueryRow
    let database: Database
    
    init(impl: CBLQueryRow, database: Database) {
        self.impl = impl
        self.database = database
    }
}


/// A single result from a full-text Query.
public class FullTextQueryRow: QueryRow {
    
    /// The text emitted when the view was indexed which contains the match(es).
    public var fullTextMatched: String? {
        let row = impl as! CBLFullTextQueryRow
        return row.fullTextMatched
    }
    
    
    /// The number of query words that were found in the fullText.
    /// (If a query word appears more than once, only the first instance is counted.)
    public var matchCount: UInt {
        let row = impl as! CBLFullTextQueryRow
        return row.matchCount
    }
    
    
    /// The character range in the fullText of a particular match.
    ///
    /// - Parameter matchNumber: The match number.
    /// - Returns: The chracter range of the given match.
    func textRangeOfMatch(_ matchNumber: UInt) -> NSRange {
        let row = impl as! CBLFullTextQueryRow
        return row.textRange(ofMatch: matchNumber)
    }
    
    
    /// The index of the search term matched by a particular match. Search terms are the individual
    /// words in the full-text search expression, skipping duplicates and noise/stop-words. They're
    /// numbered from zero.
    ///
    /// - Parameter matchNumber: The match number
    /// - Returns: The index of the search term matched by a the given match.
    func termIndexOfMatch(_ matchNumber: UInt) -> UInt {
        let row = impl as! CBLFullTextQueryRow
        return row.termIndex(ofMatch: matchNumber)
    }
}

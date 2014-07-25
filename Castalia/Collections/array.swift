//
//  array.swift
//  Castalia
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

/* 
TODO:
    operators:
        ==
        !=
        <
        >
        <=
        >=

    iterators:
        begin
        end
        rbegin
        rend

*/

public class array<T>
{
    lazy var backingStorage : [T] = [T]()
    
    init(_ args: T...) {
        for arg in args {
            backingStorage.append(arg)
        }
    }
    
    public func empty() -> Bool {
        return backingStorage.isEmpty
    }
    
    public func size() -> Int {
        return backingStorage.count
    }
    
    public func fill(value: T) {
        for i in 0 ..< self.size() {
            self[i] = value
        }
    }
    
    public func at(position: Int) -> T? {
        if position < self.size() && !self.empty() {
            return backingStorage[position]
        }
        
        return nil
    }
    
    public func front() -> T? {
        if !self.empty() {
            return backingStorage[0]
        }
        
        return nil
    }
    
    public func back() -> T? {
        if backingStorage.endIndex <= self.size() && !self.empty() {
            return backingStorage[backingStorage.endIndex - 1]
        }
        
        return nil
    }
    
    subscript(position: Int) -> T? {
        
        get {
            return at(position)
        }
        
        set(newValue) {
            if position < self.size() {
                backingStorage[position] = newValue!
            }
        }
    }
    
}

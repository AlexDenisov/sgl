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

    iterators:
        rbegin
        rend
*/

public class array<T: CastaliaComparable> : CastaliaComparable
{
    public typealias iterator = random_access_iterator<T>
    
    lazy var backingStorage : [node<T>] = [node<T>]()
    var head: node<T>?
    var tail: node<T>?

    /// TODO: cleanup
    var end_node: node<T>?
    
    init(_ args: T...) {
        for arg in args {
            add(arg)
        }
    }
    
    func add(value: T) {
        var newNode = node(value)
        if !head {
            head = newNode
            end_node = node()
        } else {
            tail!.next = newNode
        }
        newNode.prev = tail
        tail = newNode
        tail!.next = end_node
        backingStorage.append(newNode)
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
            return backingStorage[position].value
        }
        
        return nil
    }
    
    public func front() -> T? {
        if !self.empty() {
            return backingStorage[0].value
        }
        
        return nil
    }
    
    public func back() -> T? {
        if backingStorage.endIndex <= self.size() && !self.empty() {
            return backingStorage[backingStorage.endIndex - 1].value
        }
        
        return nil
    }
    
    subscript(position: Int) -> T? {
        
        get {
            return at(position)
        }
        
        set(newValue) {
            if position < self.size() {
                backingStorage[position].value = newValue!
            }
        }
    }
    
    public func begin() -> iterator {
        return iterator(head)
    }
    
    public func end() -> iterator {
        if end_node {
            end_node!.prev = tail
        }
        return iterator(end_node)
    }
    
}

public func == <T: CastaliaComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    if lhs.size() != rhs.size() {
        return false
    }
    
    for index in 0 ..< lhs.size() {
        if lhs[index]! != rhs[index]! {
            return false
        }
    }
    
    return true
}

public func != <T: CastaliaComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    return !(lhs == rhs)
}

public func < <T: CastaliaComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    if (lhs.size() < rhs.size()) {
        return true
    }
    
    if (lhs.size() > rhs.size()) {
        return false
    }
    
    for index in 0 ..< lhs.size() {
        if lhs[index]! < rhs[index]! {
            return true
        }
    }
    
    return false
}

public func > <T: CastaliaComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    return !(lhs < rhs) && !(lhs == rhs)
}

public func <= <T: CastaliaComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    return (lhs < rhs) || (lhs == rhs)
}

public func >= <T: CastaliaComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    return !(lhs < rhs) || (lhs == rhs)
}

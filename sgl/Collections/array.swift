//
//  array.swift
//  sgl
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class array<T: SGLComparable> : SGLComparable
{
    public typealias iterator = random_access_iterator<T>
    public typealias reverse_iterator = reverse_random_access_iterator<T>
    
    lazy var backingStorage : [node<T>] = [node<T>]()
    var head: node<T>?
    var tail: node<T>?

    var _begin: node<T> = node()
    var _end: node<T> = node()
    
    init(_ args: T...) {
        for arg in args {
            add(arg)
        }
    }
    
    func add(value: T) {
        var newNode = node(value)
        if !head {
            head = newNode
            head!.prev = _begin
            _begin.next = head
        } else {
            tail!.next = newNode
            newNode.prev = tail
        }
        tail = newNode
        tail!.next = _end
        _end.prev = tail
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
        return iterator(_end)
    }
    
    public func rbegin() -> reverse_iterator {
        return reverse_iterator(tail)
    }
    
    public func rend() -> reverse_iterator {
        return reverse_iterator(_begin)
    }
    
}

public func == <T: SGLComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
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

public func != <T: SGLComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    return !(lhs == rhs)
}

public func < <T: SGLComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
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

public func > <T: SGLComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    return !(lhs < rhs) && !(lhs == rhs)
}

public func <= <T: SGLComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    return (lhs < rhs) || (lhs == rhs)
}

public func >= <T: SGLComparable>(lhs: array<T>, rhs: array<T>) -> Bool {
    return !(lhs < rhs) || (lhs == rhs)
}

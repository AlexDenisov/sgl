//
//  array.swift
//  sgl
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class array<Type: comparable> : comparable
{
    public typealias iterator = random_access_iterator<Type, normal_iterator_strategy<Type>>
    public typealias reverse_iterator = random_access_iterator<Type, reverse_iterator_strategy<Type>>
    
    lazy var backingStorage : [node<Type>] = [node<Type>]()
    var head: node<Type>?
    var tail: node<Type>?

    var _begin: node<Type> = node()
    var _end: node<Type> = node()
    
    public init(_ args: Type...) {
        for arg in args {
            add(arg)
        }
    }
    
    func add(value: Type) {
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
    
    public func fill(value: Type) {
        for i in 0 ..< self.size() {
            self[i] = value
        }
    }
    
    public func at(position: Int) -> Type? {
        if position < self.size() && !self.empty() {
            return backingStorage[position].value
        }
        
        return nil
    }
    
    public func front() -> Type? {
        if !self.empty() {
            return backingStorage[0].value
        }
        
        return nil
    }
    
    public func back() -> Type? {
        if backingStorage.endIndex <= self.size() && !self.empty() {
            return backingStorage[backingStorage.endIndex - 1].value
        }
        
        return nil
    }
    
    subscript(position: Int) -> Type? {
        
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

public func == <Type: comparable>(lhs: array<Type>, rhs: array<Type>) -> Bool {
    if lhs.size() != rhs.size() {
        return false
    }
    
    for index in 0 ..< lhs.size() {
        if !(lhs[index]! == rhs[index]!) {
            return false
        }
    }
    
    return true
}

public func != <Type: comparable>(lhs: array<Type>, rhs: array<Type>) -> Bool {
    return !(lhs == rhs)
}

public func < <Type: comparable>(lhs: array<Type>, rhs: array<Type>) -> Bool {
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

public func > <Type: comparable>(lhs: array<Type>, rhs: array<Type>) -> Bool {
    return !(lhs < rhs) && !(lhs == rhs)
}

public func <= <Type: comparable>(lhs: array<Type>, rhs: array<Type>) -> Bool {
    return (lhs < rhs) || (lhs == rhs)
}

public func >= <Type: comparable>(lhs: array<Type>, rhs: array<Type>) -> Bool {
    return !(lhs < rhs) || (lhs == rhs)
}

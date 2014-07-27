//
//  random_access_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class random_access_iterator<T> : base_iterator<T>
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
}

@prefix public func ++ <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    var newIterator = random_access_iterator(iterator.pointee?.next)
    iterator = newIterator
    return newIterator
}

@postfix public func ++ <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    var newIterator = random_access_iterator(iterator.pointee?.next)
    var retIterator = iterator
    iterator = newIterator
    return retIterator
}

public func += <T>(inout iterator: random_access_iterator<T>, step: Int) -> random_access_iterator<T> {
    iterator = iterator + step
    return iterator
}

public func + <T>(iterator: random_access_iterator<T>, step: Int) -> random_access_iterator<T> {
    var pointee = iterator.pointee
    
    if step > 0 {
        for _ in 0 ..< step {
            pointee = pointee?.next
        }
    } else {
        for _ in 0 ..< (step * -1) {
            pointee = pointee?.prev
        }
    }
    

    return random_access_iterator(pointee)
}

public func + <T>(step: Int, iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    return iterator + step
}

@prefix public func -- <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    var tail = iterator.pointee?.prev
    var newIterator = random_access_iterator(tail)
    iterator = newIterator
    return newIterator
}

@postfix public func -- <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    var tail = iterator.pointee?.prev
    var newIterator = random_access_iterator(tail)
    var retIterator = iterator
    iterator = newIterator
    return retIterator
}

public func -= <T>(inout iterator: random_access_iterator<T>, step: Int) -> random_access_iterator<T> {
    iterator = iterator - step
    return iterator
}

public func - <T>(iterator: random_access_iterator<T>, step: Int) -> random_access_iterator<T> {
    var pointee = iterator.pointee
    if step > 0 {
        for _ in 0 ..< step {
            pointee = pointee?.prev
        }
    } else {
        for _ in 0 ..< (step * -1) {
            pointee = pointee?.next
        }
    }
    return random_access_iterator(pointee)
}

public func - <T>(step: Int, iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    return iterator - step
}
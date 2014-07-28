//
//  random_access_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class random_access_iterator<T> : base_iterator<T>, iterator_protocol
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
}

@prefix public func ++ <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    return forward_iterator_impl<T, random_access_iterator<T>, empty_iterator_strategy<T>>().prefix_next(&iterator)
}

@postfix public func ++ <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    return forward_iterator_impl<T, random_access_iterator<T>, empty_iterator_strategy<T>>().postfix_next(&iterator)
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

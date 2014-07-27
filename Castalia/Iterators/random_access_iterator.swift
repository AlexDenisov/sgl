//
//  random_access_iterator.swift
//  Castalia
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

@prefix func ++ <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    var newIterator = random_access_iterator(iterator.pointee?.next)
    iterator = newIterator
    return newIterator
}

@postfix func ++ <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    var newIterator = random_access_iterator(iterator.pointee?.next)
    var retIterator = iterator
    iterator = newIterator
    return retIterator
}

func += <T>(inout iterator: random_access_iterator<T>, step: Int) -> random_access_iterator<T> {
    iterator = iterator + step
    return iterator
}

func + <T>(iterator: random_access_iterator<T>, step: Int) -> random_access_iterator<T> {
    var pointee = iterator.pointee
    for _ in 0 ..< step {
        pointee = pointee?.next
    }
    return random_access_iterator(pointee)
}

func + <T>(step: Int, iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    return iterator + step
}

@prefix func -- <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    var tail = iterator.pointee?.prev
    var newIterator = random_access_iterator(tail)
    iterator = newIterator
    return newIterator
}

@postfix func -- <T>(inout iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    var tail = iterator.pointee?.prev
    var newIterator = random_access_iterator(tail)
    var retIterator = iterator
    iterator = newIterator
    return retIterator
}

func -= <T>(inout iterator: random_access_iterator<T>, step: Int) -> random_access_iterator<T> {
    iterator = iterator - step
    return iterator
}

func - <T>(iterator: random_access_iterator<T>, step: Int) -> random_access_iterator<T> {
    var pointee = iterator.pointee
    for _ in 0 ..< step {
        pointee = pointee?.prev
    }
    return random_access_iterator(pointee)
}

func - <T>(step: Int, iterator: random_access_iterator<T>) -> random_access_iterator<T> {
    return iterator - step
}

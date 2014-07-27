//
//  reverse_random_access_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class reverse_random_access_iterator<T> : base_iterator<T>
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
}

@prefix func ++ <T>(inout iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    var newIterator = reverse_random_access_iterator(iterator.pointee?.prev)
    iterator = newIterator
    return newIterator
}

@postfix func ++ <T>(inout iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    var newIterator = reverse_random_access_iterator(iterator.pointee?.prev)
    var retIterator = iterator
    iterator = newIterator
    return retIterator
}

func += <T>(inout iterator: reverse_random_access_iterator<T>, step: Int) -> reverse_random_access_iterator<T> {
    iterator = iterator + step
    return iterator
}

func + <T>(iterator: reverse_random_access_iterator<T>, step: Int) -> reverse_random_access_iterator<T> {
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
    return reverse_random_access_iterator(pointee)
}

func + <T>(step: Int, iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    return iterator + step
}

@prefix func -- <T>(inout iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    var tail = iterator.pointee?.next
    var newIterator = reverse_random_access_iterator(tail)
    iterator = newIterator
    return newIterator
}

@postfix func -- <T>(inout iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    var tail = iterator.pointee?.next
    var newIterator = reverse_random_access_iterator(tail)
    var retIterator = iterator
    iterator = newIterator
    return retIterator
}

func -= <T>(inout iterator: reverse_random_access_iterator<T>, step: Int) -> reverse_random_access_iterator<T> {
    iterator = iterator - step
    return iterator
}

func - <T>(iterator: reverse_random_access_iterator<T>, step: Int) -> reverse_random_access_iterator<T> {
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
    return reverse_random_access_iterator(pointee)
}

func - <T>(step: Int, iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    return iterator - step
}

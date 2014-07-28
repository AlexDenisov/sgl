//
//  reverse_random_access_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class reverse_random_access_iterator<T> : base_iterator<T>, iterator_protocol
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
}

@prefix public func ++ <T>(inout iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    return forward_iterator_impl<T, reverse_random_access_iterator<T>, reverse_iterator_strategy<T>>().prefix_next(&iterator)
}

@postfix public func ++ <T>(inout iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    return forward_iterator_impl<T, reverse_random_access_iterator<T>, reverse_iterator_strategy<T>>().postfix_next(&iterator)
}

@prefix public func -- <T>(inout iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    return bidirectional_iterator_impl<T, reverse_random_access_iterator<T>, reverse_iterator_strategy<T>>().prefix_prev(&iterator)
}

@postfix public func -- <T>(inout iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    return bidirectional_iterator_impl<T, reverse_random_access_iterator<T>, reverse_iterator_strategy<T>>().postfix_prev(&iterator)
}

public func += <T>(inout iterator: reverse_random_access_iterator<T>, step: Int) -> reverse_random_access_iterator<T> {
    iterator = iterator + step
    return iterator
}

public func + <T>(iterator: reverse_random_access_iterator<T>, step: Int) -> reverse_random_access_iterator<T> {
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

public func + <T>(step: Int, iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    return iterator + step
}

public func -= <T>(inout iterator: reverse_random_access_iterator<T>, step: Int) -> reverse_random_access_iterator<T> {
    iterator = iterator - step
    return iterator
}

public func - <T>(iterator: reverse_random_access_iterator<T>, step: Int) -> reverse_random_access_iterator<T> {
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

public func - <T>(step: Int, iterator: reverse_random_access_iterator<T>) -> reverse_random_access_iterator<T> {
    return iterator - step
}

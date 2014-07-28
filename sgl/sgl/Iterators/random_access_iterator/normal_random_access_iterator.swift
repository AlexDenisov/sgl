//
//  normal_normal_random_access_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class normal_random_access_iterator<T> : random_access_iterator<T>, iterator_protocol
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
}

@prefix public func ++ <T>(inout iterator: normal_random_access_iterator<T>) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().prefix_next(&iterator)
}

@postfix public func ++ <T>(inout iterator: normal_random_access_iterator<T>) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().postfix_next(&iterator)
}

@prefix public func -- <T>(inout iterator: normal_random_access_iterator<T>) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().prefix_prev(&iterator)
}

@postfix public func -- <T>(inout iterator: normal_random_access_iterator<T>) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().postfix_prev(&iterator)
}

public func + <T>(iterator: normal_random_access_iterator<T>, step: Int) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().move_forward(iterator, step: step)
}

public func + <T>(step: Int, iterator: normal_random_access_iterator<T>) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().move_forward(iterator, step: step)
}

public func - <T>(iterator: normal_random_access_iterator<T>, step: Int) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().move_backward(iterator, step: step)
}

public func - <T>(step: Int, iterator: normal_random_access_iterator<T>) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().move_backward(iterator, step: step)
}

public func += <T>(inout iterator: normal_random_access_iterator<T>, step: Int) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().move_forward_and_assign(&iterator, step: step)
}

public func -= <T>(inout iterator: normal_random_access_iterator<T>, step: Int) -> normal_random_access_iterator<T> {
    return random_access_iterator_impl<T, normal_random_access_iterator<T>, normal_iterator_strategy<T>>().move_backward_and_assign(&iterator, step: step)
}

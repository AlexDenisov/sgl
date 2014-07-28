//
//  normal_bidirectional_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class normal_bidirectional_iterator<T> : forward_iterator<T>, iterator_protocol
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
}

@prefix public func ++ <T>(inout iterator: normal_bidirectional_iterator<T>) -> normal_bidirectional_iterator<T> {
    return bidirectional_iterator_impl<T, normal_bidirectional_iterator<T>, normal_iterator_strategy<T>>().prefix_next(&iterator)
}

@postfix public func ++ <T>(inout iterator: normal_bidirectional_iterator<T>) -> normal_bidirectional_iterator<T> {
    return bidirectional_iterator_impl<T, normal_bidirectional_iterator<T>, normal_iterator_strategy<T>>().postfix_next(&iterator)
}

@prefix public func -- <T>(inout iterator: normal_bidirectional_iterator<T>) -> normal_bidirectional_iterator<T> {
    return bidirectional_iterator_impl<T, normal_bidirectional_iterator<T>, normal_iterator_strategy<T>>().prefix_prev(&iterator)
}

@postfix public func -- <T>(inout iterator: normal_bidirectional_iterator<T>) -> normal_bidirectional_iterator<T> {
    return bidirectional_iterator_impl<T, normal_bidirectional_iterator<T>, normal_iterator_strategy<T>>().postfix_prev(&iterator)
}

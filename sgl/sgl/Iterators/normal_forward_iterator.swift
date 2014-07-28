//
//  normal_forward_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class normal_forward_iterator<T> : forward_iterator<T>, iterator_protocol
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
}

@prefix public func ++ <T>(inout iterator: normal_forward_iterator<T>) -> normal_forward_iterator<T> {
    return forward_iterator_impl<T, normal_forward_iterator<T>, normal_iterator_strategy<T>>().prefix_next(&iterator)
}

@postfix public func ++ <T>(inout iterator: normal_forward_iterator<T>) -> normal_forward_iterator<T> {
    return forward_iterator_impl<T, normal_forward_iterator<T>, normal_iterator_strategy<T>>().postfix_next(&iterator)
}

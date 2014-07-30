//
//  forward_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class forward_iterator<T, S: iterator_strategy_protocol> : base_iterator<T>, iterator_protocol
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
    
    func prefix_next<IT: iterator_protocol>(inout iterator: IT) -> IT {
        return forward_iterator_impl<T, IT, S>().prefix_next(&iterator)
    }
    
    func postfix_next<IT: iterator_protocol>(inout iterator: IT) -> IT {
        return forward_iterator_impl<T, IT, S>().postfix_next(&iterator)
    }
    
}

@prefix public func ++ <T, S: iterator_strategy_protocol>(inout iterator: forward_iterator<T, S>) -> forward_iterator<T, S> {
    return iterator.prefix_next(&iterator)
}

@postfix public func ++ <T, S: iterator_strategy_protocol>(inout iterator: forward_iterator<T, S>) -> forward_iterator<T, S> {
    return iterator.postfix_next(&iterator)
}

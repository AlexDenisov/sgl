//
//  forward_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class forward_iterator<Type, Strategy: iterator_strategy_protocol> : base_iterator<Type>, iterator_protocol
{
    init(_ pointee: node<Type>?) {
        super.init(pointee)
    }
    
    func prefix_next<IteratorType: iterator_protocol>(inout iterator: IteratorType) -> IteratorType {
        return forward_iterator_impl<Type, IteratorType, Strategy>().prefix_next(&iterator)
    }
    
    func postfix_next<IteratorType: iterator_protocol>(inout iterator: IteratorType) -> IteratorType {
        return forward_iterator_impl<Type, IteratorType, Strategy>().postfix_next(&iterator)
    }
    
}

@prefix public func ++ <Type, Strategy: iterator_strategy_protocol>(inout iterator: forward_iterator<Type, Strategy>) -> forward_iterator<Type, Strategy> {
    return iterator.prefix_next(&iterator)
}

@postfix public func ++ <Type, Strategy: iterator_strategy_protocol>(inout iterator: forward_iterator<Type, Strategy>) -> forward_iterator<Type, Strategy> {
    return iterator.postfix_next(&iterator)
}

//
//  bidirectional_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class bidirectional_iterator<Type, Strategy: iterator_strategy_protocol> : forward_iterator<Type, Strategy>, iterator_protocol
{
    required public init(_ pointee: node<Type>?) {
        super.init(pointee)
    }
    
    func prefix_prev<IteratorType: iterator_protocol>(inout iterator: IteratorType) -> IteratorType {
        return bidirectional_iterator_impl<Type, IteratorType, Strategy>().prefix_prev(&iterator)
    }
    
    func postfix_prev<IteratorType: iterator_protocol>(inout iterator: IteratorType) -> IteratorType {
        return bidirectional_iterator_impl<Type, IteratorType, Strategy>().postfix_prev(&iterator)
    }
    
}

prefix public func ++ <Type, Strategy: iterator_strategy_protocol>(inout iterator: bidirectional_iterator<Type, Strategy>) -> bidirectional_iterator<Type, Strategy> {
    return iterator.prefix_next(&iterator)
}

postfix public func ++ <Type, Strategy: iterator_strategy_protocol>(inout iterator: bidirectional_iterator<Type, Strategy>) -> bidirectional_iterator<Type, Strategy> {
    return iterator.postfix_next(&iterator)
}

prefix public func -- <Type, Strategy: iterator_strategy_protocol>(inout iterator: bidirectional_iterator<Type, Strategy>) -> bidirectional_iterator<Type, Strategy> {
    return iterator.prefix_prev(&iterator)
}

postfix public func -- <Type, Strategy: iterator_strategy_protocol>(inout iterator: bidirectional_iterator<Type, Strategy>) -> bidirectional_iterator<Type, Strategy> {
    return iterator.postfix_prev(&iterator)
}

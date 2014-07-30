//
//  bidirectional_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class bidirectional_iterator<T, S: iterator_strategy_protocol> : forward_iterator<T, S>, iterator_protocol
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
    
    func prefix_prev<IT: iterator_protocol>(inout iterator: IT) -> IT {
        return bidirectional_iterator_impl<T, IT, S>().prefix_prev(&iterator)
    }
    
    func postfix_prev<IT: iterator_protocol>(inout iterator: IT) -> IT {
        return bidirectional_iterator_impl<T, IT, S>().postfix_prev(&iterator)
    }
    
}

@prefix public func ++ <T, S: iterator_strategy_protocol>(inout iterator: bidirectional_iterator<T, S>) -> bidirectional_iterator<T, S> {
    return iterator.prefix_next(&iterator)
}

@postfix public func ++ <T, S: iterator_strategy_protocol>(inout iterator: bidirectional_iterator<T, S>) -> bidirectional_iterator<T, S> {
    return iterator.postfix_next(&iterator)
}

@prefix public func -- <T, S: iterator_strategy_protocol>(inout iterator: bidirectional_iterator<T, S>) -> bidirectional_iterator<T, S> {
    return iterator.prefix_prev(&iterator)
}

@postfix public func -- <T, S: iterator_strategy_protocol>(inout iterator: bidirectional_iterator<T, S>) -> bidirectional_iterator<T, S> {
    return iterator.postfix_prev(&iterator)
}

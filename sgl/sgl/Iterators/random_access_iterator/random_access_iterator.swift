//
//  random_access_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class random_access_iterator<Type, Strategy: iterator_strategy_protocol> : bidirectional_iterator<Type, Strategy>, iterator_protocol
{
    init(_ pointee: node<Type>?) {
        super.init(pointee)
    }
    
    func move_forward <IteratorType: iterator_protocol>(iterator: IteratorType, step: Int) -> IteratorType {
        return random_access_iterator_impl<Type, IteratorType, Strategy>().move_forward(iterator, step: step)
    }
    
    func move_backward <IteratorType: iterator_protocol>(iterator: IteratorType, step: Int) -> IteratorType {
        return random_access_iterator_impl<Type, IteratorType, Strategy>().move_backward(iterator, step: step)
    }
    
    func move_forward_and_assign <IteratorType: iterator_protocol>(inout iterator: IteratorType, step: Int) -> IteratorType {
        return random_access_iterator_impl<Type, IteratorType, Strategy>().move_forward_and_assign(&iterator, step: step)
    }
    
    func move_backward_and_assign <IteratorType: iterator_protocol>(inout iterator: IteratorType, step: Int) -> IteratorType {
        return random_access_iterator_impl<Type, IteratorType, Strategy>().move_backward_and_assign(&iterator, step: step)
    }
    
}

@prefix public func ++ <Type, Strategy: iterator_strategy_protocol>(inout iterator: random_access_iterator<Type, Strategy>) -> random_access_iterator<Type, Strategy> {
    return iterator.prefix_next(&iterator)
}

@postfix public func ++ <Type, Strategy: iterator_strategy_protocol>(inout iterator: random_access_iterator<Type, Strategy>) -> random_access_iterator<Type, Strategy> {
    return iterator.postfix_next(&iterator)
}

@prefix public func -- <Type, Strategy: iterator_strategy_protocol>(inout iterator: random_access_iterator<Type, Strategy>) -> random_access_iterator<Type, Strategy> {
    return iterator.prefix_prev(&iterator)
}

@postfix public func -- <Type, Strategy: iterator_strategy_protocol>(inout iterator: random_access_iterator<Type, Strategy>) -> random_access_iterator<Type, Strategy> {
    return iterator.postfix_prev(&iterator)
}

public func + <Type, Strategy: iterator_strategy_protocol>(iterator: random_access_iterator<Type, Strategy>, step: Int) -> random_access_iterator<Type, Strategy> {
    return iterator.move_forward(iterator, step: step)
}

public func + <Type, Strategy: iterator_strategy_protocol>(step: Int, iterator: random_access_iterator<Type, Strategy>) -> random_access_iterator<Type, Strategy> {
    return iterator.move_forward(iterator, step: step)
}

public func - <Type, Strategy: iterator_strategy_protocol>(iterator: random_access_iterator<Type, Strategy>, step: Int) -> random_access_iterator<Type, Strategy> {
    return iterator.move_backward(iterator, step: step)
}

public func - <Type, Strategy: iterator_strategy_protocol>(step: Int, iterator: random_access_iterator<Type, Strategy>) -> random_access_iterator<Type, Strategy> {
    return iterator.move_backward(iterator, step: step)
}

public func += <Type, Strategy: iterator_strategy_protocol>(inout iterator: random_access_iterator<Type, Strategy>, step: Int) -> random_access_iterator<Type, Strategy> {
    return iterator.move_forward_and_assign(&iterator, step: step)
}

public func -= <Type, Strategy: iterator_strategy_protocol>(inout iterator: random_access_iterator<Type, Strategy>, step: Int) -> random_access_iterator<Type, Strategy> {
    return iterator.move_backward_and_assign(&iterator, step: step)
}

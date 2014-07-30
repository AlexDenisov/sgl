//
//  random_access_iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class random_access_iterator<T, S: iterator_strategy_protocol> : bidirectional_iterator<T, S>, iterator_protocol
{
    init(_ pointee: node<T>?) {
        super.init(pointee)
    }
    
    func move_forward <IT: iterator_protocol>(iterator: IT, step: Int) -> IT {
        return random_access_iterator_impl<T, IT, S>().move_forward(iterator, step: step)
    }
    
    func move_backward <IT: iterator_protocol>(iterator: IT, step: Int) -> IT {
        return random_access_iterator_impl<T, IT, S>().move_backward(iterator, step: step)
    }
    
    func move_forward_and_assign <IT: iterator_protocol>(inout iterator: IT, step: Int) -> IT {
        return random_access_iterator_impl<T, IT, S>().move_forward_and_assign(&iterator, step: step)
    }
    
    func move_backward_and_assign <IT: iterator_protocol>(inout iterator: IT, step: Int) -> IT {
        return random_access_iterator_impl<T, IT, S>().move_backward_and_assign(&iterator, step: step)
    }
    
}

@prefix public func ++ <T, S: iterator_strategy_protocol>(inout iterator: random_access_iterator<T, S>) -> random_access_iterator<T, S> {
    return iterator.prefix_next(&iterator)
}

@postfix public func ++ <T, S: iterator_strategy_protocol>(inout iterator: random_access_iterator<T, S>) -> random_access_iterator<T, S> {
    return iterator.postfix_next(&iterator)
}

@prefix public func -- <T, S: iterator_strategy_protocol>(inout iterator: random_access_iterator<T, S>) -> random_access_iterator<T, S> {
    return iterator.prefix_prev(&iterator)
}

@postfix public func -- <T, S: iterator_strategy_protocol>(inout iterator: random_access_iterator<T, S>) -> random_access_iterator<T, S> {
    return iterator.postfix_prev(&iterator)
}

public func + <T, S: iterator_strategy_protocol>(iterator: random_access_iterator<T, S>, step: Int) -> random_access_iterator<T, S> {
    return iterator.move_forward(iterator, step: step)
}

public func + <T, S: iterator_strategy_protocol>(step: Int, iterator: random_access_iterator<T, S>) -> random_access_iterator<T, S> {
    return iterator.move_forward(iterator, step: step)
}

public func - <T, S: iterator_strategy_protocol>(iterator: random_access_iterator<T, S>, step: Int) -> random_access_iterator<T, S> {
    return iterator.move_backward(iterator, step: step)
}

public func - <T, S: iterator_strategy_protocol>(step: Int, iterator: random_access_iterator<T, S>) -> random_access_iterator<T, S> {
    return iterator.move_backward(iterator, step: step)
}

public func += <T, S: iterator_strategy_protocol>(inout iterator: random_access_iterator<T, S>, step: Int) -> random_access_iterator<T, S> {
    return iterator.move_forward_and_assign(&iterator, step: step)
}

public func -= <T, S: iterator_strategy_protocol>(inout iterator: random_access_iterator<T, S>, step: Int) -> random_access_iterator<T, S> {
    return iterator.move_backward_and_assign(&iterator, step: step)
}

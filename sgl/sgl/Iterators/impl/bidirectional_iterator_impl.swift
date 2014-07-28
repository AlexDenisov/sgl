//
//  bidirectional_iterator_impl.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

class bidirectional_iterator_impl<T, iterator: iterator_protocol, strategy: iterator_strategy_protocol> : forward_iterator_impl<T, iterator, strategy>
{
    func prefix_prev(inout it: iterator) -> iterator {
        var s = strategy()
        var tail = s.prev_pointee(it.pointee)
        var newIterator = iterator(tail)
        it = newIterator
        return newIterator
    }
    
    func postfix_prev(inout it: iterator) -> iterator {
        var s = strategy()
        var tail = s.prev_pointee(it.pointee)
        
        var newIterator = iterator(tail)
        var retIterator = it
        it = newIterator
        return retIterator
    }
}

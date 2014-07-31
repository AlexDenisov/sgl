//
//  bidirectional_iterator_impl.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

class bidirectional_iterator_impl<Type, Iterator: iterator_protocol, Strategy: iterator_strategy_protocol> : forward_iterator_impl<Type, Iterator, Strategy>
{
    func prefix_prev(inout it: Iterator) -> Iterator {
        var s = Strategy()
        var tail = s.prev_pointee(it.pointee)
        var newIterator = Iterator(tail)
        it = newIterator
        return newIterator
    }
    
    func postfix_prev(inout it: Iterator) -> Iterator {
        var s = Strategy()
        var tail = s.prev_pointee(it.pointee)
        
        var newIterator = Iterator(tail)
        var retIterator = it
        it = newIterator
        return retIterator
    }
}

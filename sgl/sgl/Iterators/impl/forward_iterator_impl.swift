//
//  forward_iterator_impl.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

class forward_iterator_impl<T, iterator: iterator_protocol, strategy: iterator_strategy_protocol>
{
    func prefix_next(inout it: iterator) -> iterator {
        var s = strategy()
        var newIterator = iterator(s.next_pointee(it.pointee))
        it = newIterator
        return newIterator
    }
    
    func postfix_next(inout it: iterator) -> iterator {
        var s = strategy()
        var newIterator = iterator(s.next_pointee(it.pointee))
        var retIterator = it
        it = newIterator
        return retIterator
    }
}

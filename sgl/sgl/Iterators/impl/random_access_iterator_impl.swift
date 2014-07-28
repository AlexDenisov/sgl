//
//  random_access_iterator_impl.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

class random_access_iterator_impl<T, iterator: iterator_protocol, strategy: iterator_strategy_protocol> : bidirectional_iterator_impl<T, iterator, strategy>
{
    func move_forward(it: iterator, step: Int) -> iterator {
        var s = strategy()
        var pointee = it.pointee
        
        if step > 0 {
            for _ in 0 ..< step {
                pointee = s.next_pointee(pointee)
            }
        } else {
            for _ in 0 ..< (step * -1) {
                pointee = s.prev_pointee(pointee)
            }
        }
        
        return iterator(pointee)
    }
    
    func move_backward(it: iterator, step: Int) -> iterator {
        var s = strategy()
        var pointee = it.pointee
        
        if step > 0 {
            for _ in 0 ..< step {
                pointee = s.prev_pointee(pointee)
            }
        } else {
            for _ in 0 ..< (step * -1) {
                pointee = s.next_pointee(pointee)
            }
        }
        
        return iterator(pointee)
    }
    
    func move_forward_and_assign(inout it: iterator, step: Int) -> iterator {
        it = move_forward(it, step: step)
        return it
    }
    
    func move_backward_and_assign(inout it: iterator, step: Int) -> iterator {
        it = move_backward(it, step: step)
        return it
    }
    
}

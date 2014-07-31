//
//  random_access_iterator_impl.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

class random_access_iterator_impl<Type, Iterator: iterator_protocol, Strategy: iterator_strategy_protocol> : bidirectional_iterator_impl<Type, Iterator, Strategy>
{
    func move_forward(it: Iterator, step: Int) -> Iterator {
        var s = Strategy()
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
        
        return Iterator(pointee)
    }
    
    func move_backward(it: Iterator, step: Int) -> Iterator {
        var s = Strategy()
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
        
        return Iterator(pointee)
    }
    
    func move_forward_and_assign(inout it: Iterator, step: Int) -> Iterator {
        it = move_forward(it, step: step)
        return it
    }
    
    func move_backward_and_assign(inout it: Iterator, step: Int) -> Iterator {
        it = move_backward(it, step: step)
        return it
    }
    
}

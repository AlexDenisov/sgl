//
//  array_bidirectional_iterator_spec.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

func array_bidirectional_concat<T, S: iterator_strategy_protocol>(begin: bidirectional_iterator<T, S>, end: bidirectional_iterator<T, S>) -> String {
    var result: String = ""
    var it = end
    while it != begin {
        var v = (--it).value()!
        result += "\(v) "
    }
    
    return result
}

class array_bidirectional_iterator_spec : SleipnirSpec
{
    typealias SUTArray = array<Int>
    
    var spec : () = describe("array bidirectional iterator") {
        var subject: SUTArray!
        
        beforeEach {
            subject = SUTArray(1, 3, 5, 7)
        }
        
        it("normal iterator") {
            var expected = "7 5 3 1 "
            var actual = array_bidirectional_concat(subject.begin(), subject.end())
            
            expect(expected).to(equal(actual))
        }
        
        it("reverse iterator") {
            var expected = "1 3 5 7 "
            var actual = array_bidirectional_concat(subject.rbegin(), subject.rend())
            
            expect(expected).to(equal(actual))
        }
        
    }
    
}



//
//  array_forward_iterator_spec.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

func array_forward_concat<T>(begin: forward_iterator<T>, end: forward_iterator<T>) -> String {
    var result: String = ""
    var it = begin
    while it != end {
        var v = (it++).value()
        result += "\(v) "
    }
    
    return result
}

class array_forward_iterator_spec : SleipnirSpec
{
    typealias SUTArray = array<Int>

    var spec : () = xdescribe("array forward iterator") {
        var subject: SUTArray!
        
        beforeEach {
            subject = SUTArray(1, 3, 5, 7)
        }
        
        it("normal iterator") {
            var expected = "1 3 5 7 "
            var actual = array_forward_concat(subject.begin(), subject.end())
            
            expect(expected).to(equal(actual))
        }
        
        it("reverse iterator") {
            var expected = "7 5 3 1 "
            var actual = array_forward_concat(subject.rbegin(), subject.rend())
            
            expect(expected).to(equal(actual))
        }
        
    }
    
}


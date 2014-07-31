//
//  main.swift
//  Strategyample
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import sgl

func print_array<Type, Strategy: iterator_strategy_protocol>(begin: forward_iterator<Type, Strategy>, end: forward_iterator<Type, Strategy>) {
    var it = begin
    while it != end {
        let value = (it++).value()!
        print("\(value) ")
    }
    println()
}

var a = array<Int>(1, 2, 3, 4, 5)

print_array(a.begin(), a.end())
print_array(a.rbegin(), a.rend())

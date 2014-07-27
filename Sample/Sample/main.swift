//
//  main.swift
//  Sample
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import sgl

var a = array<Int>(1, 2, 3, 4, 5)

var it = a.begin()

while it != a.end() {
    print((it++).value()!)
    print(" ")
}

println()

var rit = a.rbegin()

while rit != a.rend() {
    print((rit++).value()!)
    print(" ")
}

println()
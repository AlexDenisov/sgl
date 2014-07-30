//
//  node.swift
//  sgl
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class node<T>
{
    var value: T?
    weak var next: node?
    weak var prev: node?
    
    init() {
    }
    
    init(_ value: T) {
        self.value = value
    }
}

//
//  reverse_iterator_strategy.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class reverse_iterator_strategy<T> : iterator_strategy_protocol
{
    public init() {}
    public func next_pointee<T>(n: node<T>?) -> node<T>? {
        return n?.prev
    }
    
    public func prev_pointee<T>(n: node<T>?) -> node<T>? {
        return n?.next
    }
}

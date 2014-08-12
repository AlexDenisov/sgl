//
//  normal_iterator_strategy.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class normal_iterator_strategy<Type> : iterator_strategy_protocol
{
    public required init() {}
    public func next_pointee<Type>(n: node<Type>?) -> node<Type>? {
        return n?.next
    }
    
    public func prev_pointee<Type>(n: node<Type>?) -> node<Type>? {
        return n?.prev
    }
}

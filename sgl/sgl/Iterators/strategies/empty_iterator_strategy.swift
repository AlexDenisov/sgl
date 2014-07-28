//
//  iterator_strategy.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class empty_iterator_strategy<T> : iterator_strategy_protocol
{
    init() {}
    func next_pointee<T>(n: node<T>?) -> node<T>? { return nil }
    func prev_pointee<T>(n: node<T>?) -> node<T>? { return nil }
}

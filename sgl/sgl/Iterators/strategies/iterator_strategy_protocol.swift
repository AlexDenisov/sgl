//
//  iterator_strategy_protocol.swift
//  sgl
//
//  Created by AlexDenisov on 7/28/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public protocol iterator_strategy_protocol
{
    init()
    func next_pointee<Type>(n: node<Type>?) -> node<Type>?
    func prev_pointee<Type>(n: node<Type>?) -> node<Type>?
}

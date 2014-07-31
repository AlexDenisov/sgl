//
//  iterator.swift
//  sgl
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

protocol iterator_protocol
{
    typealias Type
    init(_ pointee: node<Type>?)
    var pointee: node<Type>? { get set }
}

public class base_iterator<Type> : iterator_protocol, equality_comparable
{
    var pointee: node<Type>?
    init(_ pointee: node<Type>?) {
        self.pointee = pointee
    }
    
    public func value() -> Type? {
        if pointee {
            return pointee!.value
        }
        
        return nil
    }
}

public func == <Type>(lhs: base_iterator<Type>, rhs: base_iterator<Type>) -> Bool {
    return lhs.pointee === rhs.pointee
}

public func != <Type>(lhs: base_iterator<Type>, rhs: base_iterator<Type>) -> Bool {
    return !(lhs == rhs)
}

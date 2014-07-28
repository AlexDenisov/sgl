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
    typealias T
    init(_ pointee: node<T>?)
    var pointee: node<T>? { get set }
}

public class base_iterator<T> : iterator_protocol, equality_comparable
{
    var pointee: node<T>?
    init(_ pointee: node<T>?) {
        self.pointee = pointee
    }
    
    public func value() -> T? {
        if pointee {
            return pointee!.value
        }
        
        return nil
    }
}

public func == <T>(lhs: base_iterator<T>, rhs: base_iterator<T>) -> Bool {
    return lhs.pointee === rhs.pointee
}

public func != <T>(lhs: base_iterator<T>, rhs: base_iterator<T>) -> Bool {
    return !(lhs == rhs)
}

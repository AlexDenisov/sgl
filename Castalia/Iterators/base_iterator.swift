//
//  iterator.swift
//  Castalia
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public class base_iterator<T> : EqualityComparable
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

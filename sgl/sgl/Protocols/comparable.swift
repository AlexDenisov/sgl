//
//  SGLComparable.swift
//  sgl
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public protocol equality_comparable {
    func == (lhs: Self, rhs: Self) -> Bool
}

public protocol less_than_comparable {
    func < (lhs: Self, rhs: Self) -> Bool
}

public protocol comparable: less_than_comparable, equality_comparable {
    
}

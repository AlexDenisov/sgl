//
//  EqualComparable.swift
//  Castalia
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation

public protocol EqualityComparable {
    func == (lhs: Self, rhs: Self) -> Bool
    func != (lhs: Self, rhs: Self) -> Bool
}

//
//  array_mutation_spec.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class array_mutation_spec : SleipnirSpec
{
    var spec : () = describe("mutation") {
        var subject: array<Int>!
        
        context("of empty array") {
            
            beforeEach {
                subject = array<Int>()
            }
            
            it("via subscript") {
                subject[1] = 42
                expect(subject[1]).to(beNil())
            }
            
            it("via fill()") {
                subject.fill(42)
                expect(subject.front()).to(beNil())
            }
            
        }
        
        context("of non-empty array") {
            
            beforeEach {
                subject = array<Int>(1, 2, 3, 4)
            }
            
            it("via subscript") {
                subject[1] = 42
                expect(subject[1]).to(equal(42))
            }
            
            it("via fill()") {
                subject.fill(42)
                expect(subject.front()).to(equal(42))
                expect(subject.back()).to(equal(42))
            }
            
        }
        
    }
    
}


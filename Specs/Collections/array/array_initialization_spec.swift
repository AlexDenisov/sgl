//
//  array_initialization_spec.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class array_initialization_spec : SleipnirSpec
{
    var spec : () = describe("array initializion") {

        var subject: array<Int>!
        
        context("with parameters") {
            
            beforeEach {
                subject = array<Int>(1, 2, 3, 4)
            }
            
            it("has correct size") {
                expect(subject.size()).to(equal(4))
            }
            
            it("non empty") {
                expect(subject.empty()).to(beFalse())
            }
            
        }
        
        context("without parameters") {
            
            beforeEach {
                subject = array<Int>()
            }
            
            it("has correct size") {
                expect(subject.size()).to(equal(0))
            }
            
            it("empty") {
                expect(subject.empty()).to(beTrue())
            }
            
        }
        
    }
}

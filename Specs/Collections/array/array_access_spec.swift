//
//  array_access_spec.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class array_access_spec : SleipnirSpec
{
    typealias SUTArray = array<Int>
    
    var spec : () = describe("access") {
        
        var subject: SUTArray!
        
        context("to empty array returns nil") {
            
            beforeEach {
                subject = SUTArray()
            }
            
            it("via subscript") {
                expect(subject[0]).to(beNil())
            }
            
            it("via at()") {
                expect(subject.at(42)).to(beNil())
            }
            
            it("via front()") {
                expect(subject.front()).to(beNil())
            }
            
            it("via back()") {
                expect(subject.back()).to(beNil())
            }
            
        }
        
        context("to non-empty array returns correct value") {
            
            beforeEach {
                subject = SUTArray(1,2,3,4)
            }
            
            it("via subscript") {
                expect(subject[3]).to(equal(4))
            }
            
            it("via at()") {
                expect(subject.at(2)).to(equal(3))
            }
            
            it("via front()") {
                expect(subject.front()).to(equal(1))
            }
            
            it("via back()") {
                expect(subject.back()).to(equal(4))
            }
            
        }
        
    }
    
}

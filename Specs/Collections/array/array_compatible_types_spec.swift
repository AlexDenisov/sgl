//
//  array_types_compatibility.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class array_compatible_types_spec : SleipnirSpec
{
    var spec : () = describe("array compatible types") {
        
        it("UInt") {
            var subject = array<UInt>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }
        
        it("Int") {
            var subject = array<Int>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }
        
        it("UInt8") {
            var subject = array<UInt8>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }
        
        it("Int8") {
            var subject = array<Int8>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }
        
        it("UInt16") {
            var subject = array<UInt16>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }
        
        it("Int16") {
            var subject = array<Int16>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }

        it("UInt32") {
            var subject = array<UInt32>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }
        
        it("Int32") {
            var subject = array<Int32>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }

        it("UInt64") {
            var subject = array<UInt64>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }
        
        it("Int64") {
            var subject = array<Int64>(1)
            
            expect(subject.begin().value()).to(equal(1))
        }
        
        it("Double") {
            var subject = array<Double>(1.0)
            
            expect(subject.begin().value()).to(equal(1.0))
        }
        
        it("Float") {
            var subject = array<Float>(1.0)
            
            expect(subject.begin().value()).to(equal(1.0))
        }
        
    }
    
}

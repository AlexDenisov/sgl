//
//  iterators_spec.swift
//  Castalia
//
//  Created by AlexDenisov on 7/26/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class RandomAccessIteratorSpec: SleipnirSpec
{
    typealias SUTArray = array<Int>
    
    var spec: () = describe("random access iterator") {
        var subject: SUTArray!
        
        beforeEach {
            subject = SUTArray(1, 3, 5, 7)
        }

        describe("methods") {
            
            it("begin()") {
                expect(subject.begin().value()).to(equal(1))
            }
            
            it("end()") {
                expect(subject.end().value()).to(beNil())
            }
            
        }
        
        describe("arithmethic") {
            
            it("prefix increment") {
                var it = subject.begin()
                
                expect((++it).value()).to(equal(3))
                expect(it.value()).to(equal(3))
            }
            
            it("postfix increment") {
                var it = subject.begin()
                
                expect((it++).value()).to(equal(1))
                expect(it.value()).to(equal(3))
            }
            
            it("postfix constant addition") {
                var it = subject.begin()
                
                expect((it + 2).value()).to(equal(3))
            }
            
            it("prefix constant addition") {
                var it = subject.begin()
                
                expect((2 + it).value()).to(equal(3))
            }
            
            it("addition assignment") {
                var it = subject.begin()
                
                it += 2
                expect(it.value()).to(equal(3))
            }
            
            it("prefix decrement") {
                var it = subject.end()
                
                expect((--it).value()).to(equal(5))
                expect(it.value()).to(equal(5))
            }
            
            it("postfix decrement") {
                var it = subject.end()
                
                expect((it--).value()).to(beNil())
                expect(it.value()).to(equal(7))
            }
            
            it("postfix constant subtraction") {
                var it = subject.end()
                
                expect((it - 2).value()).to(equal(5))
            }
            
            it("prefix constant subtraction") {
                var it = subject.end()
                
                expect((2 - it).value()).to(equal(5))
            }
            
            it("subtraction assignment") {
                var it = subject.end()
                
                it -= 2
                expect(it.value()).to(equal(5))
            }
            
        }
        
        describe("equality") {
            
            it("begin iterators equal") {
                var result = subject.begin() == subject.begin()
                
                expect(result).to(beTrue())
            }
            
            it("begin + size + 1 equal to end") {
                var result = (subject.begin() + (subject.size() + 1)) == subject.end()
                
                expect(result).to(beTrue())
            }
            
        }
        
    }
    
}

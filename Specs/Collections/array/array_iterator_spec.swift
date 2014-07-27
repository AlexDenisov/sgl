//
//  array_iterator_spec.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class array_iterator_spec : SleipnirSpec
{
    typealias SUTArray = array<Int>
    typealias SUTIterator = SUTArray.iterator
    
    var spec : () = describe("array iterator") {
        
        var subject: SUTArray!
        var iterator: SUTIterator = SUTIterator(nil)
        
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
        
        describe("arithmetic") {
            
            context("increment") {
                
                beforeEach {
                    iterator = subject.begin()
                }
                
                it("prefix") {
                    expect((++iterator).value()).to(equal(3))
                    expect(iterator.value()).to(equal(3))
                }
                
                it("postfix") {
                    expect((iterator++).value()).to(equal(1))
                    expect(iterator.value()).to(equal(3))
                }
                
            }
            
            context("positive constant addition") {
                
                beforeEach {
                    iterator = subject.begin()
                }
                
                it("postfix") {
                    expect((iterator + 2).value()).to(equal(5))
                }
                
                it("prefix") {
                    expect((2 + iterator).value()).to(equal(5))
                }
                
                it("assignment") {
                    iterator += 2
                    expect(iterator.value()).to(equal(5))
                }
                
            }
            
            context("negative constant addition") {
                
                beforeEach {
                    iterator = subject.begin() + 2
                }
                
                it("postfix") {
                    expect((iterator + -2).value()).to(equal(1))
                }
                
                it("prefix") {
                    expect((-2 + iterator).value()).to(equal(1))
                }
                
                it("assignment") {
                    iterator += -2
                    expect(iterator.value()).to(equal(1))
                }
                
            }
            
            context("decrement") {
                
                beforeEach {
                    iterator = subject.end()
                }
                
                it("prefix") {
                    expect((--iterator).value()).to(equal(7))
                    expect(iterator.value()).to(equal(7))
                }
                
                it("postfix") {
                    expect((iterator--).value()).to(beNil())
                    expect(iterator.value()).to(equal(7))
                }
                
            }
            
            context("positive constant subtraction") {
                
                beforeEach {
                    iterator = subject.end()
                }
                
                it("postfix") {
                    expect((iterator - 2).value()).to(equal(5))
                }
                
                it("prefix") {
                    expect((2 - iterator).value()).to(equal(5))
                }
                
                it("assignment") {
                    iterator -= 2
                    expect(iterator.value()).to(equal(5))
                }
                
            }
            
            context("negative constant subtraction") {
                
                beforeEach {
                    iterator = subject.end() - 3
                }
                
                it("postfix") {
                    expect((iterator - -2).value()).to(equal(7))
                }
                
                it("prefix") {
                    expect((-2 - iterator).value()).to(equal(7))
                }
                
                it("assignment") {
                    iterator -= -2
                    expect(iterator.value()).to(equal(7))
                }
                
            }
            
        }
        
        describe("equality") {
            
            it("begin iterators equal") {
                var result = subject.begin() == subject.begin()
                
                expect(result).to(beTrue())
            }
            
            it("begin + size equal to end") {
                var result = (subject.begin() + subject.size()) == subject.end()
                
                expect(result).to(beTrue())
            }
            
            it("end iterators equal") {
                var result = subject.end() == subject.end()
                
                expect(result).to(beTrue())
            }
            
        }

    }
    
}


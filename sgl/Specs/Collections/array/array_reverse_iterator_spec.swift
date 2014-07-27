//
//  array_reverse_iterator_spec.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class array_reverse_iterator_spec : SleipnirSpec
{
    typealias SUTArray = array<Int>
    typealias SUTIterator = SUTArray.reverse_iterator
    
    var spec : () = describe("array reverse iterator") {
        
        var subject: SUTArray!
        var iterator: SUTIterator = SUTIterator(nil)
        
        beforeEach {
            subject = SUTArray(1, 3, 5, 7)
        }
        
        describe("methods") {
            
            it("rbegin()") {
                expect(subject.rbegin().value()).to(equal(7))
            }
            
            it("rend()") {
                expect(subject.rend().value()).to(beNil())
            }
            
        }
        
        describe("arithmetic") {
            
            context("increment") {
                
                beforeEach {
                    iterator = subject.rbegin()
                }
                
                it("prefix") {
                    expect((++iterator).value()).to(equal(5))
                    expect(iterator.value()).to(equal(5))
                }
                
                it("postfix") {
                    expect((iterator++).value()).to(equal(7))
                    expect(iterator.value()).to(equal(5))
                }
                
            }
            
            context("positive contant addition") {
                
                beforeEach {
                    iterator = subject.rbegin()
                }
                
                it("postfix") {
                    expect((iterator + 2).value()).to(equal(3))
                }
                
                it("prefix") {
                    expect((2 + iterator).value()).to(equal(3))
                }
                
                it("assignment") {
                    iterator += 2
                    expect(iterator.value()).to(equal(3))
                }
                
            }
            
            context("negative contant addition") {
                
                beforeEach {
                    iterator = subject.rbegin() + 2
                }
                
                it("postfix") {
                    expect((iterator + -2).value()).to(equal(7))
                }
                
                it("prefix") {
                    expect((-2 + iterator).value()).to(equal(7))
                }
                
                it("assignment") {
                    iterator += -2
                    expect(iterator.value()).to(equal(7))
                }
                
            }
            
            context("decrement") {
                
                beforeEach {
                    iterator = subject.rend()
                }
                
                it("prefix") {
                    expect((--iterator).value()).to(equal(1))
                    expect(iterator.value()).to(equal(1))
                }
                
                it("postfix") {
                    expect((iterator--).value()).to(beNil())
                    expect(iterator.value()).to(equal(1))
                }
                
            }
            
            context("positive constant subtraction") {
                
                beforeEach {
                    iterator = subject.rend()
                }
                
                it("postfix") {
                    expect((iterator - 2).value()).to(equal(3))
                }
                
                it("prefix") {
                    expect((2 - iterator).value()).to(equal(3))
                }
                
                it("assignment") {
                    iterator -= 2
                    expect(iterator.value()).to(equal(3))
                }
                
            }
            
            context("negative constant subtraction") {
                
                beforeEach {
                    iterator = subject.rend() - 3
                }
                
                it("postfix") {
                    expect((iterator - -2).value()).to(equal(1))
                }
                
                it("prefix") {
                    expect((-2 - iterator).value()).to(equal(1))
                }
                
                it("assignment") {
                    iterator -= -2
                    expect(iterator.value()).to(equal(1))
                }
                
            }
            
        }
        
        describe("equality") {
            
            it("rbegin iterators equal") {
                var result = subject.rbegin() == subject.rbegin()
                
                expect(result).to(beTrue())
            }
            
            it("rbegin + size equal to rend") {
                var result = (subject.rbegin() + subject.size()) == subject.rend()
                
                expect(result).to(beTrue())
            }
            
            it("rend iterators equal") {
                var result = subject.rend() == subject.rend()
                
                expect(result).to(beTrue())
            }
            
        }
        
    }
}

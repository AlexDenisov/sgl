//
//  iterators_spec.swift
//  sgl
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
            
            it("rbegin()") {
                expect(subject.rbegin().value()).to(equal(7))
            }
            
            it("rend()") {
                expect(subject.rend().value()).to(beNil())
            }
            
        }
        
        context("normal iterator") {
            
            var iterator: SUTArray.iterator = SUTArray.iterator(nil)
            
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

        context("reverse iterator") {
         
            var iterator: SUTArray.reverse_iterator = SUTArray.reverse_iterator(nil)
            
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
    
}

//
//  array_specs.swift
//  Castalia
//
//  Created by AlexDenisov on 7/25/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class array_specs : SleipnirSpec {
    
    var spec : () = describe("array") {
        var subject: array<Int>!
        
        describe("initializion") {
            
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
        
        describe("access") {

            context("to empty array returns nil") {
                
                beforeEach {
                    subject = array<Int>()
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
                    subject = array<Int>(1,2,3,4)
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
        
        describe("mutation") {
            
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
        
        describe("comparison") {
            var rhs: array<Int>!
            
            context("equality") {
                
                it("of equal arrays") {
                    subject = array<Int>(1, 2, 3, 4)
                    rhs = array<Int>(1, 2, 3, 4)
                    var equal = rhs == subject
                    expect(equal).to(beTrue())
                }
                
                it("of empty arrays") {
                    subject = array<Int>()
                    rhs = array<Int>()
                    var equal = rhs == subject
                    expect(equal).to(beTrue())
                }
                
                describe("of non-equal arrays") {
                    
                    it("with different size") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(3, 2)
                        var equal = rhs == subject
                        expect(equal).toNot(beTrue())
                    }
                    
                    it("with equal size") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(3, 2, 1)
                        var equal = rhs == subject
                        expect(equal).toNot(beTrue())
                    }
                    
                }
                
            }
            
            context("inequality") {
                
                it("of non-equal arrays") {
                    subject = array<Int>(1, 2, 3, 4)
                    rhs = array<Int>(1, 2, 3)
                    var equal = rhs != subject
                    expect(equal).to(beTrue())
                }
                
                it("of empty arrays") {
                    subject = array<Int>()
                    rhs = array<Int>()
                    var equal = rhs != subject
                    expect(equal).to(beFalse())
                }
                
                it("of equal arrays") {
                    subject = array<Int>(1, 2, 3)
                    rhs = array<Int>(1, 2, 3)
                    var equal = rhs != subject
                    expect(equal).to(beFalse())
                }
                
            }
            
            context("less than") {
                
                context("when array less than") {
                    
                    it("by size") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(1, 2, 3, 4)
                        var result = subject < rhs
                        expect(result).to(beTrue())
                    }
                    
                    it("by value") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(2, 2, 3)
                        var result = subject < rhs
                        expect(result).to(beTrue())
                    }
                    
                }
                
                context("when array not less than") {
                    
                    it("by size") {
                        subject = array<Int>(1, 2, 3, 4)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject < rhs
                        expect(result).to(beFalse())
                    }
                    
                    it("by value") {
                        subject = array<Int>(2, 2, 3)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject < rhs
                        expect(result).to(beFalse())
                    }
                    
                }
                
                context("when arrays equal") {
                    
                    it("by value") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject < rhs
                        expect(result).to(beFalse())
                    }
                    
                }
                
            }
            
            context("greater than") {
                
                context("when array greater than") {
                    
                    it("by size") {
                        subject = array<Int>(1, 2, 3, 4)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject > rhs
                        expect(result).to(beTrue())
                    }
                    
                    it("by value") {
                        subject = array<Int>(2, 2, 3)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject > rhs
                        expect(result).to(beTrue())
                    }
                    
                }
                
                context("when array not greater than") {
                    
                    it("by size") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(1, 2, 3, 4)
                        var result = subject > rhs
                        expect(result).to(beFalse())
                    }
                    
                    it("by value") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(2, 2, 3)
                        var result = subject > rhs
                        expect(result).to(beFalse())
                    }
                    
                }
                
                context("when arrays equal") {
                    
                    it("by value") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject > rhs
                        expect(result).to(beFalse())
                    }
                    
                }
                
            }
            
            context("less than or equal") {
                
                context("when array less than") {
                    
                    it("by size") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(1, 2, 3, 4)
                        var result = subject <= rhs
                        expect(result).to(beTrue())
                    }
                    
                    it("by value") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(2, 2, 3)
                        var result = subject <= rhs
                        expect(result).to(beTrue())
                    }
                    
                }
                
                context("when array not less than") {
                    
                    it("by size") {
                        subject = array<Int>(1, 2, 3, 4)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject <= rhs
                        expect(result).to(beFalse())
                    }
                    
                    it("by value") {
                        subject = array<Int>(2, 2, 3)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject <= rhs
                        expect(result).to(beFalse())
                    }
                    
                }
                
                context("when arrays equal") {
                    
                    it("by value") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject <= rhs
                        expect(result).to(beTrue())
                    }
                    
                }
                
            }
            
            context("greater than or equal") {
                
                context("when array greater than") {
                    
                    it("by size") {
                        subject = array<Int>(1, 2, 3, 4)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject >= rhs
                        expect(result).to(beTrue())
                    }
                    
                    it("by value") {
                        subject = array<Int>(2, 2, 3)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject >= rhs
                        expect(result).to(beTrue())
                    }
                    
                }
                
                context("when array not greater than") {
                    
                    it("by size") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(1, 2, 3, 4)
                        var result = subject >= rhs
                        expect(result).to(beFalse())
                    }
                    
                    it("by value") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(2, 2, 3)
                        var result = subject >= rhs
                        expect(result).to(beFalse())
                    }
                    
                }
                
                context("when arrays equal") {
                    
                    it("by value") {
                        subject = array<Int>(1, 2, 3)
                        rhs = array<Int>(1, 2, 3)
                        var result = subject >= rhs
                        expect(result).to(beTrue())
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

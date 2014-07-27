//
//  array_comparison_spec.swift
//  sgl
//
//  Created by AlexDenisov on 7/27/14.
//  Copyright (c) 2014 AlexDenisov. All rights reserved.
//

import Foundation
import Sleipnir

class array_comparison_spec : SleipnirSpec
{
    typealias SUTArray = array<Int>
    
    var spec : () = describe("comparison") {
        
        var subject: SUTArray!
        var rhs: SUTArray!
        
        context("equality") {
            
            it("of equal arrays") {
                subject = SUTArray(1, 2, 3, 4)
                rhs = SUTArray(1, 2, 3, 4)
                var equal = rhs == subject
                expect(equal).to(beTrue())
            }
            
            it("of empty arrays") {
                subject = SUTArray()
                rhs = SUTArray()
                var equal = rhs == subject
                expect(equal).to(beTrue())
            }
            
            describe("of non-equal arrays") {
                
                it("with different size") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(3, 2)
                    var equal = rhs == subject
                    expect(equal).toNot(beTrue())
                }
                
                it("with equal size") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(3, 2, 1)
                    var equal = rhs == subject
                    expect(equal).toNot(beTrue())
                }
                
            }
            
        }
        
        context("inequality") {
            
            it("of non-equal arrays") {
                subject = SUTArray(1, 2, 3, 4)
                rhs = SUTArray(1, 2, 3)
                var equal = rhs != subject
                expect(equal).to(beTrue())
            }
            
            it("of empty arrays") {
                subject = SUTArray()
                rhs = SUTArray()
                var equal = rhs != subject
                expect(equal).to(beFalse())
            }
            
            it("of equal arrays") {
                subject = SUTArray(1, 2, 3)
                rhs = SUTArray(1, 2, 3)
                var equal = rhs != subject
                expect(equal).to(beFalse())
            }
            
        }
        
        context("less than") {
            
            context("when array less than") {
                
                it("by size") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(1, 2, 3, 4)
                    var result = subject < rhs
                    expect(result).to(beTrue())
                }
                
                it("by value") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(2, 2, 3)
                    var result = subject < rhs
                    expect(result).to(beTrue())
                }
                
            }
            
            context("when array not less than") {
                
                it("by size") {
                    subject = SUTArray(1, 2, 3, 4)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject < rhs
                    expect(result).to(beFalse())
                }
                
                it("by value") {
                    subject = SUTArray(2, 2, 3)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject < rhs
                    expect(result).to(beFalse())
                }
                
            }
            
            context("when arrays equal") {
                
                it("by value") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject < rhs
                    expect(result).to(beFalse())
                }
                
            }
            
        }
        
        context("greater than") {
            
            context("when array greater than") {
                
                it("by size") {
                    subject = SUTArray(1, 2, 3, 4)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject > rhs
                    expect(result).to(beTrue())
                }
                
                it("by value") {
                    subject = SUTArray(2, 2, 3)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject > rhs
                    expect(result).to(beTrue())
                }
                
            }
            
            context("when array not greater than") {
                
                it("by size") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(1, 2, 3, 4)
                    var result = subject > rhs
                    expect(result).to(beFalse())
                }
                
                it("by value") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(2, 2, 3)
                    var result = subject > rhs
                    expect(result).to(beFalse())
                }
                
            }
            
            context("when arrays equal") {
                
                it("by value") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject > rhs
                    expect(result).to(beFalse())
                }
                
            }
            
        }
        
        context("less than or equal") {
            
            context("when array less than") {
                
                it("by size") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(1, 2, 3, 4)
                    var result = subject <= rhs
                    expect(result).to(beTrue())
                }
                
                it("by value") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(2, 2, 3)
                    var result = subject <= rhs
                    expect(result).to(beTrue())
                }
                
            }
            
            context("when array not less than") {
                
                it("by size") {
                    subject = SUTArray(1, 2, 3, 4)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject <= rhs
                    expect(result).to(beFalse())
                }
                
                it("by value") {
                    subject = SUTArray(2, 2, 3)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject <= rhs
                    expect(result).to(beFalse())
                }
                
            }
            
            context("when arrays equal") {
                
                it("by value") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject <= rhs
                    expect(result).to(beTrue())
                }
                
            }
            
        }
        
        context("greater than or equal") {
            
            context("when array greater than") {
                
                it("by size") {
                    subject = SUTArray(1, 2, 3, 4)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject >= rhs
                    expect(result).to(beTrue())
                }
                
                it("by value") {
                    subject = SUTArray(2, 2, 3)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject >= rhs
                    expect(result).to(beTrue())
                }
                
            }
            
            context("when array not greater than") {
                
                it("by size") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(1, 2, 3, 4)
                    var result = subject >= rhs
                    expect(result).to(beFalse())
                }
                
                it("by value") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(2, 2, 3)
                    var result = subject >= rhs
                    expect(result).to(beFalse())
                }
                
            }
            
            context("when arrays equal") {
                
                it("by value") {
                    subject = SUTArray(1, 2, 3)
                    rhs = SUTArray(1, 2, 3)
                    var result = subject >= rhs
                    expect(result).to(beTrue())
                }
                
            }
            
        }
        
    }
    
}

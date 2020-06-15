//
//  TestCaseA.swift
//  SwiftTest
//
//  Created by fan.liu on 2020/6/15.
//  Copyright © 2020 fan.liu. All rights reserved.
//

import UIKit
typealias ProtocolALL = ProtocolB & ProtocolC

public protocol ProtocolB {
    func functionB()
}

public protocol ProtocolC {
    func functionC()
}

class ProxyWrapper: NSObject, ProtocolALL {
    weak var delegate: AnyObject? = nil
    func functionB(){
        delegate?.functionB?()
    }
    
    func functionC(){
        delegate?.functionC?()
    }
    
    init(delegate: AnyObject) {
        self.delegate = delegate
        super.init()
    }
}


class TestCaseA: NSObject {
    lazy var proxy = ProxyWrapper(delegate: self)
    func startTest() -> Void {
        proxy.functionB()
        proxy.functionC()
    }
    
    @objc func functionB(){
        print(#function)
    }
    
    
    @objc func functionC(){
        print(#function)
    }
}

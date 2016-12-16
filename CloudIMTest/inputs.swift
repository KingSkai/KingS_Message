//
//  inputs.swift
//  CloudIMTest
//
//  Created by 王凯 on 2016/12/8.
//  Copyright © 2016年 王凯. All rights reserved.
//

import Foundation

struct Inputs: OptionSet {
    let rawValue: Int
    
    static let user = Inputs(rawValue: 1)  //1
    static let pass = Inputs(rawValue: 1 << 1) //10
    static let mail = Inputs(rawValue: 1 << 2) //100
    
}


extension Inputs {
    var boolValue: Bool {
        return self.rawValue == 0b111
    }
}

//判断是否全部输入
extension Inputs {
    func isAllOK() -> Bool {
        //        return self == [.user, .pass, .mail]
        //        return self.rawValue == 0b111
        
        //选项的数目
        let count = 3
        
        //找到几项
        var found = 0
        
        //在数目范围内查找,若找到, 次数增加
        for time in 0..<count where contains(Inputs(rawValue: 1 << time)) {
            found += 1
        }
        
        //比较次数与选项的数目
        return found == count
        
    }
}

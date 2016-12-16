//
//  Common.swift
//  CloudIMTest
//
//  Created by 王凯 on 2016/12/16.
//  Copyright © 2016年 王凯. All rights reserved.
//

import UIKit


class Common: NSObject {

    static let sharedInstance = Common()
    private override init() {}
    
    
    func shakeView(_ viewToShake: UIView) {
        let t: CGFloat = 4.0
        let translateRight = CGAffineTransform.identity.translatedBy(x: t, y: 0.0)
        let translateLeft = CGAffineTransform.identity.translatedBy(x: -t, y: 0.0)
        viewToShake.transform = translateLeft
        UIView.animate(withDuration: 0.07, delay: 0.0, options: [.autoreverse, .repeat], animations: {() -> Void in
            UIView.setAnimationRepeatCount(2.0)
            viewToShake.transform = translateRight
        }, completion: {(_ finished: Bool) -> Void in
            if finished {
                UIView.animate(withDuration: 0.05, delay: 0.0, options: .beginFromCurrentState, animations: {() -> Void in
                    viewToShake.transform = CGAffineTransform.identity
                }, completion: { _ in })
            }
        })
    }
    
    func gogo() {
        
        
        
    }

}

//final class Single: NSObject {
//    static let shared = Single()
//    private override init() {
//
//
//    }
//}
//
//func shakeView(_ viewToShake: UIView) {
//    let t: CGFloat = 4.0
//    let translateRight = CGAffineTransform.identity.translatedBy(x: t, y: 0.0)
//    let translateLeft = CGAffineTransform.identity.translatedBy(x: -t, y: 0.0)
//    viewToShake.transform = translateLeft
//    UIView.animate(withDuration: 0.07, delay: 0.0, options: [.autoreverse, .repeat], animations: {() -> Void in
//        UIView.setAnimationRepeatCount(2.0)
//        viewToShake.transform = translateRight
//    }, completion: {(_ finished: Bool) -> Void in
//        if finished {
//            UIView.animate(withDuration: 0.05, delay: 0.0, options: .beginFromCurrentState, animations: {() -> Void in
//                viewToShake.transform = CGAffineTransform.identity
//            }, completion: { _ in })
//        }
//    })
//}

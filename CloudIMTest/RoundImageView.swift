//
//  RoundImageView.swift
//  CloudIMTest
//
//  Created by 王凯 on 2016/12/5.
//  Copyright © 2016年 王凯. All rights reserved.
//

import UIKit

@IBDesignable

class RoundImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    // 可侦测的属性
    @IBInspectable var cornerRadius: CGFloat = 0{
//        get{
//            return self.layer.cornerRadius
//        }
//        set{
//            self.layer.cornerRadius = newValue
//            self.layer.masksToBounds = (newValue > 0)
//        }
        didSet{
            layer.cornerRadius = cornerRadius;
            layer.masksToBounds = cornerRadius > 0;
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0{
        
        didSet{
            layer.borderWidth = borderWidth
        }
        
    }
    
    
    
    @IBInspectable var borderColor : UIColor? {
        
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
        
    }
}

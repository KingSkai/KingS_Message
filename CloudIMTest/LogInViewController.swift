//
//  LogInViewController.swift
//  CloudIMTest
//
//  Created by 王凯 on 2016/12/5.
//  Copyright © 2016年 王凯. All rights reserved.
//

import UIKit

// 扩展StoryBoard
//extension UIView{
//    
//    // 使用@IBInspectable创建的属性会在storyboard的右侧属性栏中显示出来(此处需要重写setter getter方法)
//   @IBInspectable var cornerRadius: CGFloat{
//        get{
//            return self.layer.cornerRadius
//        }
//        set{
//            self.layer.cornerRadius = newValue
//            self.layer.masksToBounds = (newValue > 0)
//        }
//    }
//    
//    
//}


class LogInViewController: UIViewController, JSAnimatedImagesViewDataSource {
    
    // 背景动态图片
    @IBOutlet weak var backGroundImageView: JSAnimatedImagesView!
    // 头像
    @IBOutlet weak var portrait: RoundImageView!
    // 新用户/忘记密码模块
    @IBOutlet weak var bottomStackView: UIStackView!

    // 自动登录模块
    @IBOutlet weak var logInStackView: UIStackView!
    // 用户信息输入模块
    @IBOutlet weak var userStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        backGroundImageView.delegate = self
//        backGroundImageView.startAnimating()
        backGroundImageView.dataSource = self
        // 视图层级调整
        sendToBack()
        
    }
    
    func sendToBack() {
        backGroundImageView.bringSubview(toFront: portrait)
        backGroundImageView.bringSubview(toFront: bottomStackView)
        backGroundImageView.bringSubview(toFront: logInStackView)
        backGroundImageView.bringSubview(toFront: userStackView)
    }

//    func animatedImagesNumber(ofImages animatedImagesView: RCAnimatedImagesView!) -> UInt {
//        return 6
//    }
//    
//    func animatedImagesView(_ animatedImagesView: RCAnimatedImagesView!, imageAt index: UInt) -> UIImage! {
//        return UIImage(named: "IMG_\(index + 1)")
//    }
    
    
    func animatedImagesNumber(ofImages animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 6
    }
    
    func animatedImagesView(_ animatedImagesView: JSAnimatedImagesView!, imageAt index: UInt) -> UIImage! {
        return UIImage(named: "IMG_\(index + 1)")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
//        backGroundImageView.stopAnimating()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        UIView.animate(withDuration: 1.0, animations: {
//            // axis 轴 -> 将其变为垂直的
//            self.logInStackView.axis = UILayoutConstraintAxis.vertical
//            
//        })
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

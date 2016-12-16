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
    
    @IBOutlet weak var textName: UITextBox!
    @IBOutlet weak var textPass: UITextBox!
    
    @IBOutlet weak var btnLog: UIButton!
    // 单例调用
    let common = Common.sharedInstance

    
//    var possibleInputs : Inputs = []

    
    @IBAction func actionLog(_ sender: Any) {



        if (self.textName.text?.isEmpty)!{
            self.errorNotice("用户名为空")
            return
        } else if (self.textPass.text?.isEmpty)! {
            self.errorNotice("密码为空")
            return
        }
        
        
        let query = AVQuery(className: "KingS")
        query.whereKey("user", equalTo: self.textName.text! as String)
        query.whereKey("pass", equalTo: self.textPass.text! as String)
        query.getFirstObjectInBackground { (object, err) in
            
            if object != nil {
                
//                Single.shared

                
                ((UIApplication.shared.delegate) as! AppDelegate).enterMainUI();
                
            } else {
                
                self.common.shakeView(self.textName)
                self.common.shakeView(self.textPass)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    self.errorNotice("信息不匹配")
                })
                
                print(err.debugDescription)
                
                
            }
            
        }

    }
    
    func textFieldDidChange() {
        
//        print("sss")
        let query = AVQuery(className: "KingS")
        query.whereKey("user", equalTo: self.textName.text! as String)
        query.getFirstObjectInBackground { (object, err) in
            
            if object != nil {
                
                
            } else {
                
                self.textName.highlightState = UITextBoxHighlightState.wrong("用户名不存在")

                
            }
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        backGroundImageView.delegate = self
//        backGroundImageView.startAnimating()
        
        self.textPass.addTarget(self, action: #selector(textFieldDidChange), for: .editingDidBegin)

        
        textNotice()
        
        backGroundImageView.dataSource = self
        // 视图层级调整
        sendToBack()
        
    }
    
    // 用户名和密码的输入提示
    func textNotice() {
        
        let v1 = AJWValidator(type: .string)
        v1?.addValidation(toEnsureMinimumLength: 3, invalidMessage: "用户名至少3位")
        v1?.addValidation(toEnsureMaximumLength: 15, invalidMessage: "用户名最大15位")
        self.textName.ajw_attach(v1)
        
        v1?.validatorStateChangedHandler = { (newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .validationStateValid:
                self.textName.highlightState = .default
//                self.possibleInputs.formUnion(Inputs.user)
                
            default:
                let errorMsg = v1?.errorMessages.first as? String
                self.textName.highlightState = UITextBoxHighlightState.wrong(errorMsg!)
                
//                self.possibleInputs.subtract(Inputs.user)
            }
            
//            self.btnLog?.isEnabled = self.possibleInputs.isAllOK()
        }
        
        let v2 = AJWValidator(type: .string)
        v2?.addValidation(toEnsureMinimumLength: 3, invalidMessage: "密码至少3位")
        v2?.addValidation(toEnsureMaximumLength: 15, invalidMessage: "最长15位")
        self.textPass.ajw_attach(v2)
        
        v2?.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .validationStateValid:
                self.textPass.highlightState = .default
//                self.possibleInputs.formUnion(Inputs.pass)
                
            default:
                let errorMsg = v2?.errorMessages.first as? String
                self.textPass.highlightState = UITextBoxHighlightState.wrong(errorMsg!)
//                self.possibleInputs.subtract(Inputs.pass)
            }
            
//            self.btnLog?.isEnabled = self.possibleInputs.boolValue
            
        }

        
    }
    
    func sendToBack() {
        backGroundImageView.bringSubview(toFront: portrait)
        backGroundImageView.bringSubview(toFront: bottomStackView)
        backGroundImageView.bringSubview(toFront: logInStackView)
        backGroundImageView.bringSubview(toFront: userStackView)
    }


    
    func animatedImagesNumber(ofImages animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 6
    }
    
    func animatedImagesView(_ animatedImagesView: JSAnimatedImagesView!, imageAt index: UInt) -> UIImage! {
        return UIImage(named: "IMG_\(index + 1)")
        
    }

    // 页面出现
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
//        backGroundImageView.stopAnimating()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        

        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        navigationController?.setNavigationBarHidden(true, animated: true)
//        
//        // segue 即为下一个视图控制区
//        let dest = segue.destination as! ViewController
        
//    }
 

}

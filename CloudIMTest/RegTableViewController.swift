//
//  RegTableViewController.swift
//  CloudIMTest
//
//  Created by 王凯 on 2016/12/6.
//  Copyright © 2016年 王凯. All rights reserved.
//

import UIKit

class RegTableViewController: UITableViewController {


    @IBOutlet var logInTextFields: [UITextField]!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    // 必填
    @IBOutlet weak var user: UITextBox!
    @IBOutlet weak var pass: UITextBox!
    @IBOutlet weak var mail: UITextBox!
    // 选填
    @IBOutlet weak var region: UITextBox!
    @IBOutlet weak var question: UITextBox!
    @IBOutlet weak var answer: UITextBox!
    
    var possibleInputs : Inputs = []

    // 检查必填
    func checkRequareField() {
        for text in logInTextFields {
            if (text.text?.isEmpty)!{
//                self.successNotice("必填项为空")
                // 三方菊花类
                self.errorNotice("必填项为空")

            }
            
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.+[A-Za-z]{2,4}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
            guard predicate.evaluate(with: mail.text) else {
                self.errorNotice("邮箱格式有误!")
                return
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



        self.navigationController?.navigationBar.isHidden = false
        self.title = "新用户注册"
        
        let v1 = AJWValidator(type: .string)
        v1?.addValidation(toEnsureMinimumLength: 3, invalidMessage: "用户名至少3位")
        v1?.addValidation(toEnsureMaximumLength: 15, invalidMessage: "最大15位")
        self.user.ajw_attach(v1)

        v1?.validatorStateChangedHandler = { (newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .validationStateValid:
                self.user.highlightState = .default
                self.possibleInputs.formUnion(Inputs.user)
                
            default:
                let errorMsg = v1?.errorMessages.first as? String
                self.user.highlightState = UITextBoxHighlightState.wrong(errorMsg!)
                
                self.possibleInputs.subtract(Inputs.user)
            }
            
            self.doneButton?.isEnabled = self.possibleInputs.isAllOK()
            
        }
        
        let v2 = AJWValidator(type: .string)
        v2?.addValidation(toEnsureMinimumLength: 3, invalidMessage: "密码至少3位")
        v2?.addValidation(toEnsureMaximumLength: 15, invalidMessage: "最长15位")
        self.pass.ajw_attach(v2)
        
        v2?.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .validationStateValid:
                self.pass.highlightState = .default
                self.possibleInputs.formUnion(Inputs.pass)
                
            default:
                let errorMsg = v2?.errorMessages.first as? String
                self.pass.highlightState = UITextBoxHighlightState.wrong(errorMsg!)
                self.possibleInputs.subtract(Inputs.pass)
            }
            self.doneButton?.isEnabled = self.possibleInputs.boolValue
            
        }
        
        let v3 = AJWValidator(type: .string)
        v3?.addValidationToEnsureValidEmail(withInvalidMessage: "Email格式不对")
        self.mail.ajw_attach(v3)
        v3?.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .validationStateValid:
                self.mail.highlightState = .default
                self.possibleInputs.formUnion(Inputs.mail)
            default:
                let errorMsg = v3?.errorMessages.first as? String
                self.mail.highlightState = UITextBoxHighlightState.wrong(errorMsg!)
                self.possibleInputs.subtract(Inputs.mail)
                
            }
            self.doneButton?.isEnabled = self.possibleInputs.boolValue
            
        }
        
    }
    // 注册新用户
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        
        //显示一个载入提示
        self.pleaseWait()
        
        //建立用户的 AVObject
        let user = AVObject(className: "KingS")
        
        //把输入的文本框的值，设置到对象中
        user["user"] = self.user.text
        user["pass"] = self.pass.text
        user["mail"] = self.mail.text
        user["region"] = self.region.text
        user["question"] = self.question.text
        user["answer"] = self.answer.text
        
        //查询用户是否已经注册
        let query = AVQuery(className: "KingS")
        query.whereKey("user", equalTo: self.user.text! as String)
        
        //执行查询
        query.getFirstObjectInBackground { (object, e) -> Void in
            self.clearAllNotice()
            
            
            //如果查询到相关用户
            if object != nil {
                self.errorNotice("用户已注册")
                self.user.becomeFirstResponder()
                self.doneButton?.isEnabled = false
                
            } else {
                
                //用户注册
                user.saveInBackground({ (succeed, error) -> Void in
                    if succeed {
                        self.successNotice("注册成功")
                        self.navigationController?.popViewController(animated: true)
                        
                    } else {
                        print((error?.localizedDescription)! as String)
                    }
                })
                
            }
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 3
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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
    
    // 必填
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var mail: UITextField!
    // 选填
    @IBOutlet weak var region: UITextField!
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var answer: UITextField!
    
    // 检查必填
    func checkRequareField() {
        for text in logInTextFields {
            if (text.text?.isEmpty)!{
//                self.successNotice("必填项为空")
                self.errorNotice("必填项为空")
//                print("必填项为空")
//                let alter = UIAlertController(title: "必填项为空", message: nil, preferredStyle: UIAlertControllerStyle.alert)
//                let alterAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:nil)
//                alter.addAction(alterAction)
//                self.present(alter, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



        self.navigationController?.navigationBar.isHidden = false
        self.title = "新用户注册"
        

        
    }
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        
        checkRequareField()
        
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

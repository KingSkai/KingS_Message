//
//  ConversationViewController.swift
//  CloudIMTest
//
//  Created by 王凯 on 2016/11/28.
//  Copyright © 2016年 王凯. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.targetId = "wangkai2"
        
//        self.userName = RCIMClient.shared().currentUserInfo.name
        
//        self.conversationType = .ConversationType_PRIVATE
//        self.title = "与" + "王凯" + "对话中"

        // 头像形状(原型 USER_AVATAR_CYCLE)
        RCIM.shared().globalMessageAvatarStyle = RCUserAvatarStyle.USER_AVATAR_CYCLE
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

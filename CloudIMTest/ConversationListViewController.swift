//
//  ConversationListViewController.swift
//  CloudIMTest
//
//  Created by 王凯 on 2016/11/28.
//  Copyright © 2016年 王凯. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {

    let conVC = RCConversationViewController()
    
    @IBAction func showMenu(_ sender: UIBarButtonItem) {

        
        var frame = (sender.value(forKey: "view") as AnyObject).frame
        
        frame?.origin.y = (frame?.origin.y)! + 30;
        
        let menuItems = [
            KxMenuItem.init("客服", image: UIImage(named: "服务(1)"), target: self, action: #selector(ConversationListViewController.ClickMenue1)),
            KxMenuItem.init("与凯哥聊天界面", image: UIImage(named: "联系人(1)"), target: self, action: #selector(ConversationListViewController.ClickMenue2))
        ]
        
        KxMenu.show(in: self.view, from: frame!, menuItems: menuItems)
//        let items = [
//            MenuItem(title: "客服", iconName: "服务(1)", glow: UIColor.red, index: 0),
//            MenuItem(title: "与凯哥聊天", iconName: "会话(1)", glow: UIColor.blue, index: 1),
//            MenuItem(title: "通讯录", iconName: "联系人(1)", glow: UIColor.yellow, index: 2),
//            MenuItem(title: "关于", iconName: "about", glow: UIColor.gray, index: 3)
//        ]
//        let menue = PopMenu(frame: self.view.bounds, items: items)
//        
//        menue?.menuAnimationType = .netEase
//        
//        if (menue?.isShowed)! {
//            return
//        }
////        var selectItem :MenuItem
//        
//        menue?.didSelectedItemCompletion = {(_ selectedItem: MenuItem!) -> Void in
//            
//            
//        }
    }
    
    func ClickMenue1() {
        print("需要什么服务呢")
    }
    
    func ClickMenue2() {
        let conVC = RCConversationViewController()
        conVC.targetId = "wangkai1"
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = "王凯1"
        self.navigationController?.pushViewController(conVC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        // 闭包 - 回调
        appDelegate?.connectServer {
            print("连接成功2")
            
//            self.title = "链接成功"
            // 设置在列表中需要显示的会话类型
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                ])
            // 从数据库中重新读取会话列表数据，并刷新会话列表
            self.refreshConversationTableViewIfNeeded()
        }
        
        
        
    }

    // 对话列表点击方法
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        
        // 代码跳转到会话界面
//        let conVC = RCConversationViewController()
//        
//        conVC.targetId = model.targetId
//        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
//        conVC.title = model.conversationTitle
//
//
//        self.navigationController?.pushViewController(conVC, animated: true)
//    
//        self.tabBarController?.tabBar.isHidden = true
                conVC.targetId = model.targetId
                conVC.conversationType = RCConversationType.ConversationType_PRIVATE
                conVC.title = model.conversationTitle
        
        self.tabBarController?.tabBar.isHidden = true;

        self.navigationController?.pushViewController(conVC, animated: true)
        // 来自storyBoard的自定义转场
//        self.performSegue(withIdentifier: "tapOnCell", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destVC = segue.destination as? RCConversationViewController
        
        destVC?.targetId = self.conVC.targetId
        destVC?.conversationType = self.conVC.conversationType
        destVC?.title = conVC.title
        self.tabBarController?.tabBar.isHidden = true;
        
    }
    

}

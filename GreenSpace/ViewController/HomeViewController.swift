//
//  HomeViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//

import UIKit
import PanModal

class HomeViewController: UIViewController{
    
    @IBOutlet weak var betgeModalButton: UIButton!
    
    @IBOutlet weak var myItemModalButton: UIButton!
    override func viewDidLoad(){
        super.viewDidLoad()
        
        print("heeloo")
        let request = UserRequest(nickname: "suu", password: "fdsajkl;1")
        LoginAPI.login(request: request) { succeed, failed in
            if succeed != nil {
                print("success")
            }
        }
        
    }

    
    @IBAction func pressAlarmButton(_ sender: Any) {
        let friendRequest = FollowingListRequest()
        
        FriendAPI.getFollowingList(request: friendRequest) { succeed1, failed1 in
            if succeed1 != nil {
                print(succeed1!)
            }
            print(failed1!)
        }
//        if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AlarmViewController.self)){
//            self.navigationController?.pushViewController(pushVC, animated: true)}
    }
    
    
    @IBAction func pressModalButton(_ sender: UIButton) {
        switch sender{
        case betgeModalButton:
            print("betge")
            let betgeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: BetgeCollectionViewController.self)) as! BetgeCollectionViewController
            presentPanModal(betgeVC)
        case myItemModalButton:
            print("item")
            let myItemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: MyItemCollectionViewController.self)) as! MyItemCollectionViewController
            presentPanModal(myItemVC)
        default: break
        }
    }
    
    
}

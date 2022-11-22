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
    
    @IBOutlet weak var myItemImageView: UIImageView!
    
    @IBOutlet weak var betgeImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        myItemImageView.image = UIImage(named: GlobalImage.shared.myItemImageName)
        betgeImageView.image = UIImage(named: GlobalImage.shared.betgeImageName)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        print("heeloo")
        let request = SigninRequest(nickname: "suu", password: "fdsajkl;1")
        LoginAPI.signin(request: request) { succeed, failed in
            if succeed != nil {
                print("success")
            }
        }
        
    }

    
    @IBAction func pressAlarmButton(_ sender: Any) {
        FriendAPI.getFollowingList() { succeed1, failed1 in
            if succeed1 != nil {
                print("hihi : ", succeed1!)
            }
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

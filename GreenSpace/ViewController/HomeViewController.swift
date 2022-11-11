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
    }

    
    @IBAction func pressAlarmButton(_ sender: Any) {
        if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AlarmViewController.self)){
            self.navigationController?.pushViewController(pushVC, animated: true)}
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

//
//  HomeViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//

import UIKit
import PanModal

class HomeViewController: UIViewController{
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var betgeModalButton: UIButton!
    
    @IBOutlet weak var myItemModalButton: UIButton!
    
    @IBOutlet weak var myItemImageView: UIImageView!
    
    @IBOutlet weak var myPoint: UIButton!
    @IBOutlet weak var betgeImageView: UIImageView!
    
    
    func setPoint(){
        let userPoint = String(GlobalUser.shared.point) ?? "0"
        myPoint.setTitle("\(userPoint) 포인트", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        characterImageView.image = UIImage(named: "natural")
        
        //유저정보 가져와서 포인트 가져옴.
        LoginAPI.profile { succeed, failed in }
        setPoint()
        myItemImageView.image = UIImage(named: GlobalImage.shared.myItemImageName)
        betgeImageView.image = UIImage(named: GlobalImage.shared.betgeImageName)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        characterImageView.image = UIImage(named: "natural")
        LoginAPI.profile { succeed, failed in }
    }


    
    @IBAction func pressAlarmButton(_ sender: Any) {
        
        if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AlarmViewController.self)){
            self.navigationController?.pushViewController(pushVC, animated: true)
        }
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

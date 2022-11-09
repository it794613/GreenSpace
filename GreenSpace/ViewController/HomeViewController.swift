//
//  HomeViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//

import UIKit

class HomeViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }

    
    @IBAction func pressAlarmButton(_ sender: Any) {
        if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AlarmViewController.self)){
            self.navigationController?.pushViewController(pushVC, animated: true)}
    }
    

    
}

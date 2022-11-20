//
//  AlarmViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//
import UIKit

class AlarmViewController: UIViewController{
    
    @IBOutlet weak var alarmTableView: UITableView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.alarmTableView.delegate = self
        self.alarmTableView.dataSource = self
    }
    
    func viewWillAppear(){
        super.viewWillAppear(true)
        /// 알람이 있으면 알람 이미지 변경하기 위해 wil appear 사용.
        
    }
    
    
}


//MARK: - 테이블뷰 델리겟
extension AlarmViewController: UITableViewDelegate{
    
}

//MARK: -테이블뷰 데이터 소스
//TODO: - 데이터 넣기.
extension AlarmViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = alarmTableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell") as! AlarmTableViewCell
        
        
        return cell
    }
    
    
}

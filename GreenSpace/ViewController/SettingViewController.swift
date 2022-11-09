//
//  RegisterViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//

import UIKit

class SettingViewController: UIViewController{
    
    @IBOutlet weak var NickNameTextField: UITextField!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    
    /// 닉네임 변경하기 위한 버튼 액션
    @IBAction func pressChangeNickName(_ sender: UIButton) {
        
        NickNameTextField.isHidden = false
        
        
    }
    
    /// 검색 가능 기능 스위치 액션
    @IBAction func switchSearchPermission(_ sender: UISwitch) {
    }
    
    
    /// 로그아웃 버튼 액션
    @IBAction func pressLogout(_ sender: UIButton) {
    }
    
    /// 회원탈퇴 버튼 액션
    @IBAction func pressWithdrawal(_ sender: UIButton) {
    }
    
    
    
    
}

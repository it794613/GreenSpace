//
//  RegisterViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//

import UIKit

class SettingViewController: UIViewController{
    
    @IBOutlet weak var NickNameTextField: UITextField!
    
    @IBOutlet weak var userNickName: UILabel!
    
    var nickNameTextFiledIsHidden = true
    
    override func viewDidLoad(){
        super.viewDidLoad()
        NickNameTextField.delegate = self
        NickNameTextField.isHidden = nickNameTextFiledIsHidden
    }
    
    
    /// 닉네임 변경하기 위한 버튼 액션
    @IBAction func pressChangeNickName(_ sender: UIButton) {
        if nickNameTextFiledIsHidden == false{
            if NickNameTextField.text != ""{
                userNickName.text = NickNameTextField.text
                // usernickname 변화를 서버에 보내줌
            }
        }
        nickNameTextFiledIsHidden.toggle()
        NickNameTextField.isHidden = nickNameTextFiledIsHidden
        
        
    }
    
    /// 검색 가능 기능 스위치 액션
    @IBAction func switchSearchPermission(_ sender: UISwitch) {
        //온일때 데이터 보내줘야함.
        if sender.isOn{
            
        }
        //아닐때 데이터 보내줘야함.
        else{
            
        }
    }
    
    
    /// 로그아웃 버튼 액션
    @IBAction func pressLogout(_ sender: UIButton) {
        
    }
    
    /// 회원탈퇴 버튼 액션
    @IBAction func pressWithdrawal(_ sender: UIButton) {
        
    }
    
    
    
    
}

extension SettingViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nickNameTextFiledIsHidden.toggle()
        textField.isHidden = nickNameTextFiledIsHidden
        textField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        userNickName.text = textField.text
        // usernickname 변화를 서버에 보내줌
    }
}

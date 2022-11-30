//
//  RegisterViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//

import UIKit

class SettingViewController: UIViewController{

    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var NickNameTextField: UITextField!

    @IBOutlet weak var userNickName: UILabel!

    var nickNameTextFiledIsHidden = true

    override func viewDidLoad(){
        super.viewDidLoad()
        NickNameTextField.delegate = self
        NickNameTextField.isHidden = nickNameTextFiledIsHidden
    }


    //로그인뷰 보내는 함수
    func presentLoginView(){
        guard let LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        LoginViewController.modalTransitionStyle = .crossDissolve
        LoginViewController.modalPresentationStyle = .fullScreen
        self.present(LoginViewController, animated: true, completion: nil)
    }



    /// 닉네임 변경하기 위한 버튼 액션
    @IBAction func pressChangeNickName(_ sender: UIButton) {
        if !nickNameTextFiledIsHidden {
            if NickNameTextField.text != "" {
                userNickName.text = NickNameTextField.text
            }
        }
        nickNameTextFiledIsHidden.toggle()
        NickNameTextField.isHidden = nickNameTextFiledIsHidden


    }

    /// 검색 가능 기능 스위치 액션
    @IBAction func switchSearchPermission(_ sender: UISwitch) {
        //온일때 데이터 보내줘야함.

        LoginAPI.update(request: UserRequest(open: false)) { succeed, failed in
            if let changedUser = succeed{
                GlobalUser.shared.open = changedUser.open
                GlobalUser.shared.show()
            }
        }
    }



    /// 로그아웃 버튼 액션
    @IBAction func pressLogout(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)

        Auth.shared.clear()
        presentLoginView()

    }

    /// 회원탈퇴 버튼 액션
    @IBAction func pressWithdrawal(_ sender: UIButton) {

        LoginAPI.delete { succeed, failed in
            if succeed == true {
                Auth.shared.clear()
                self.presentLoginView()
            } else {
                //알람창
                print("deleted")
                let alert = UIAlertController(title: "에러", message: "네트워크 통신이 원활하지 않습니다.", preferredStyle: UIAlertController.Style.alert)
                let defaultAlert = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                alert.addAction(defaultAlert)
                self.present(alert, animated: false)
            }
        }
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
        if let inputNickName = userNickName.text{
            LoginAPI.update(request: UserRequest(username: inputNickName)) { succeed, failed in
                if let changedUser = succeed{
                    GlobalUser.shared.username = changedUser.username
                }
            }
        }
    }
}

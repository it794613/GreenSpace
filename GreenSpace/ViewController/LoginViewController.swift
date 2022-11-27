//
//  ViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    func gotoHomeView(){
        self.presentingViewController?.dismiss(animated: true)
        guard let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "NaviagationController") as? UINavigationController else { return }
                HomeVC.modalTransitionStyle = .coverVertical
                HomeVC.modalPresentationStyle = .fullScreen
                self.present(HomeVC, animated: true, completion: nil)
    }
    
    
    //경고창
    func returnWarning(message: String){
        let alert = UIAlertController(title: "경고", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        let defaultAlert = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAlert)
        self.present(alert, animated: false)
    }

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//회원가입
    @IBAction func pressSingUp(_ sender: Any) {
        guard let id = idTextField.text else{ return returnWarning(message: "아이디를 입력해주세요.")}
        print(id)
        guard let password = passwordTextField.text else{ return returnWarning(message: "패스워드를 입력해주세요.")}
        print(password)
        LoginAPI.signup(request: SignupRequest(nickname: id, username: id, password: password)) { succeed, failed in
            if let result = succeed {
                if result{
                    LoginAPI.signin(request: SigninRequest(nickname: id, password: password)) { succeed, failed in }
                    self.gotoHomeView()
                }
                else{
                    print("회원가입 실패")
                    self.returnWarning(message: "아이디와 패스워드를 확인해주세요.")
                }
            }
        }
        
        
        
    }
    
    //로그인
    @IBAction func pressLogin(_ sender: UIButton) {
        
        guard let id = idTextField.text else{ return returnWarning(message: "아이디를 입력해주세요.")}
        guard let password = passwordTextField.text else{ return returnWarning(message: "패스워드를 입력해주세요.")}
    
        LoginAPI.signin(request: SigninRequest(nickname: id, password: password)) { succeed, failed in
            if let result = succeed{
                self.gotoHomeView()
            }else{
                self.returnWarning(message: "아이디와 패스워드를 다시 확인해주세요")
            }
        }
        
        
    }
}


extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}


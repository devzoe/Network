//
//  ViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/20.
//

import UIKit
import Alamofire
import NaverThirdPartyLogin


class LoginViewController: UIViewController {
    
    var naverLogin : NaverLogin = NaverLogin()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpNaver(_ sender: Any) {
        naverLogin.loginInstance?.delegate = self
        naverLogin.loginInstance?.requestThirdPartyLogin()
    }
    
    @IBAction func touchUpLogout(_ sender: Any) {
        naverLogin.loginInstance?.requestDeleteToken()
    }
    
    
}

extension LoginViewController: NaverThirdPartyLoginConnectionDelegate {
    // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
        //     let naverSignInVC = NLoginThirdPartyOAuth20InAppBrowserViewController(request: request)!
        //     naverSignInVC.parentOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.orientation.rawValue)!
        //     present(naverSignInVC, animated: false, completion: nil)
    }
    
    // 로그인에 성공했을 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("[Success] : Success Naver Login")
        naverLogin.getNaverInfo()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "navi2") as? UINavigationController else {
            print("Controller not found")
            return
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    // 접근 토큰 갱신
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        
    }
    
    // 로그아웃 할 경우 호출(토큰 삭제)
    func oauth20ConnectionDidFinishDeleteToken() {
        naverLogin.loginInstance?.requestDeleteToken()
    }
    
    // 모든 Error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("[Error] :", error.localizedDescription)
    }
}

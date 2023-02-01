//
//  VocaViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import UIKit

class VocaViewController: UIViewController {
    var papago : Papago = Papago() // Model
    var naverPapago: NaverPapago = NaverPapago() // API
    var detectLangs: DetectLanguage = DetectLanguage()
    //var word: Word = Word(languge: "", word: "", partOfSpeech: "", definition: "", example: "")
    var searchMeaning : SearchMeaning = SearchMeaning()
    
    @IBOutlet weak var before: UITextField!
    @IBOutlet weak var after: UILabel!

    @IBOutlet weak var textField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.placeholder = "번역할 내용을 입력하세요."
        //플레이스홀더 글씨 색 정하기
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 없는 게 더 깔끔
        //self.view.bringSubviewToFront(translationTitleView)
        //setGradient(gradView: translationTitleView, color1: .blue, color2: .red, color3: .systemPink, color4: .purple)
        //self.view.bringSubviewToFront(translationTitle)
        
    }
    func setGradient(gradView: UIView,color1:UIColor,color2:UIColor,color3:UIColor,color4:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor,color3.cgColor]
        //gradient.locations = [0.5 , 0.7]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = gradView.bounds
        gradView.layer.addSublayer(gradient)
        gradient.cornerRadius = 15
        
    }
    
    
    @IBAction func translation(_ sender: Any) {
        let text = before.text!
        papago.updateBefore(text)
        detectLangs.detectLangs(papago, self)
    }
    
    func detect() {
        let language = papago.readBeforeLanguage()
        if (language == "ko") {
            papago.updateAfterLaunguage("en")
            naverPapago.callKoToEnURL(papago, self)
        } else {
            papago.updateAfterLaunguage("ko")
            naverPapago.callEnToKoURL(papago, self)
        }
    }
    func translatedText() {
        let translatedText = papago.readAfter()
        after.text = translatedText
        print("vocaVC: \(translatedText)")
    }

}

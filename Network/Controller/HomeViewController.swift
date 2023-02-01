//
//  HomeViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var todayStudy: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationItem.leftBarButtonItem?.tintColor = .white
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // 타이틀 색상
       // setGradient(gradView: todayStudy, color1: .blue, color2: .red, color3: .systemPink, color4: .purple)
    }

    
}

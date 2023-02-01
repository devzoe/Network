//
//  PlayViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/24.
//

import UIKit
import WebKit

class PlayViewController: UIViewController {
    var key = ""
    var top = ""

    @IBOutlet weak var playView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getVideo()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = top
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        print("play disappear")
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func getVideo(){
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(key)") else {return}
        let request = URLRequest(url: url)
        playView.load(request)
    }
    
    
    
    
}


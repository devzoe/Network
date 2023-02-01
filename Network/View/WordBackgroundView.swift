//
//  WordBackgroundView.swift
//  Network
//
//  Created by 남경민 on 2022/12/23.
//

import UIKit

class WordBackgroundView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#function)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#function)
        loadView()
    }
    
    private func loadView() {
        let purpleView = makeView()
        purpleView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 30)
        addSubview(purpleView)
        
        let label = makeLabel()
        label.frame = CGRect(x: 0, y: 50, width: bounds.width, height: 20)
        addSubview(label)
    }
    
    private func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.text = "커스텀2"
        label.textAlignment = .center
        return label
    }
    
    
    
}

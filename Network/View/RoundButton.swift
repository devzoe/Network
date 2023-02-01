//
//  RoundButton.swift
//  Network
//
//  Created by 남경민 on 2022/12/21.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        commonInit()
        
    }
    private func commonInit() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.size.height / 2
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}

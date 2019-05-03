//
//  RoundedButton.swift
//  TesteSantander
//
//  Created by Rodrigo Martins on 02/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

 @IBDesignable class StyledButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
        
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func refreshShadowRadius(value: CGFloat){
        layer.shadowRadius = value
    }
    
    func refreshShadowOpacity(value: Float){
        layer.shadowOpacity = value
    }
    
    @IBInspectable var cornerRadius: CGFloat = 8 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 8 {
        didSet {
            refreshShadowRadius(value: shadowRadius)
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.3 {
        didSet {
            refreshShadowOpacity(value: shadowOpacity)
        }
    }
        
    func sharedInit() {
        refreshCorners(value: cornerRadius)
        refreshShadowRadius(value: shadowRadius)
        refreshShadowOpacity(value: shadowOpacity)
    }
}



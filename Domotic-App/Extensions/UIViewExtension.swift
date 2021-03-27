//
//  UIViewExtension.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 26/3/21.
//

import UIKit

extension UIView {
    func setContentViewDesign(){
        self.layer.cornerRadius = 8
        self.layer.backgroundColor = UIColor.systemGray4.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
}

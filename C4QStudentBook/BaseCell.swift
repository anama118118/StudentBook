//
//  BaseCell.swift
//  C4QStudentBook
//
//  Created by Ana Ma on 11/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

///BaseCell is the template cell
class BaseCell: UICollectionViewCell {
    
    //init frame will always be called
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(Coder:) had not been implemented")
    }
    
    ///function to put code for image, labels, button
    func setupCell() {
//        backgroundColor = .red
    }
}

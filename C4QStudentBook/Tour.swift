//
//  Tour.swift
//  C4QStudentBook
//
//  Created by Ana Ma on 11/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class Tour{
    
    //image should can be casted in string, because of mvc
    let imageString: String
    let title: String
    let description: String
    
    init(imageString: String, titleString: String, descriptionString: String) {
        self.imageString = imageString
        self.title = titleString
        self.description = descriptionString
    }
    
}

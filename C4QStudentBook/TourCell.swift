//
//  TourCell.swift
//  C4QStudentBook
//
//  Created by Ana Ma on 11/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class TourCell: BaseCell {
    static let identifier = "TourCellID"

    //we need 1) imageView, 2) textView
    
    //Making the image object
    let imageView: UIImageView = {
        let image = UIImage(named: "c4q_logo")
        let iv = UIImageView(image:image)
        iv.contentMode = .scaleAspectFill
        
        //fix the buggy issue
        iv.clipsToBounds = true
        
        //We want to use autolayout, so set the following into false
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }() //need to be executed with ()
    
    //Make the text view
    let textView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .white
        
        tv.text = "Sample text!!!"
        
        //Set the user experience
        tv.isSelectable = false
        tv.isEditable = false
        
        //We want to use autolayout, so set the following into false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var tour: Tour? {
        //        get{}set{}willSet{}
        didSet{
            //after you set the value, what you want to happen
            guard let tourData = tour else {return}
            setup(tour: tourData)
        }
    }
    
    override func setupCell() {
        super.setupCell()
        
        //Add subview image to self because collection view cell is actually a view
        addSubview(imageView)
        addSubview(textView)
        
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(0.6)).isActive = true
    
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(0.25)).isActive = true
    }
    
    fileprivate func setup(tour: Tour){
        imageView.image = UIImage(named: tour.imageString)
        //textView.text = tour.title + "\n\n" + tour.description
        
        //You can format the text with attributedText, do manipulation
        //You can use command click to get some more of the library
        let attributedString = NSMutableAttributedString(string: tour.title, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium)])
        let descriptionAttribute = NSMutableAttributedString(string: "\n\n" + tour.description, attributes: [NSForegroundColorAttributeName:UIColor.lightGray, NSFontAttributeName:UIFont.systemFont(ofSize: 15, weight: UIFontWeightThin)])
        attributedString.append(descriptionAttribute)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let textLength = attributedString.string.characters.count
        let range = NSRange(location: 0, length: textLength)
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        textView.attributedText = attributedString
        
    }
}

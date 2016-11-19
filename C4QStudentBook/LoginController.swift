//
//  LoginController.swift
//  C4QStudentBook
//
//  Created by Ana Ma on 11/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit
//https://github.com/anama118118/StudentBook

class LoginController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //lazy var let you access the view controller, only execute once
    lazy var collectionView: UICollectionView = {
        //Inside here define collectionView, by default the layout is vertical
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        //Fix the problem with the spacing
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //Set the style of the user experience with the cell
        cv.bounces = false
        cv.isPagingEnabled = true
        
        //Set the delegate
        cv.delegate = self
        cv.dataSource = self
        
        //CollectionView is default to black color
        cv.backgroundColor = .white
        
        //If want to use auto layout, set the following to be false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var tourData = [Tour]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTourData()
    }
    
    func setupTourData() {
        let tour1 = Tour(imageString: "c4q1", titleString: "ABOUT US", descriptionString: "We foster the Queens tech ecosystem to increase economic opportunity and transform the world's most diverse community into a leading hub for innovation and entrepreneurship.")
        let tour2 = Tour(imageString: "c4q2", titleString: "Our Mission", descriptionString: "Coalition for Queens (C4Q) increases economic opportunity through technology and transforms the world's most diverse community into a leading hub for innovation and entrepreneurship.")
        let tour3 = Tour(imageString: "c4q3", titleString: "What is Access Code?", descriptionString: "Access Code is a 10-month software development program that trains talented adults from underserved populations to become industry ready programmers and helps get them tech jobs at leading companies.")
        tourData = [tour1, tour2, tour3]
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        //Register Cell Class to connect to Collection View, when in storyboard, it gives you a cell already
        //Register the Cell before dequeueReusableCell is preferred
        collectionView.register(TourCell.self, forCellWithReuseIdentifier: TourCell.identifier)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: LoginCell.identifier)
        
        //Contraint to view
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tourData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == tourData.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: LoginCell.identifier, for: indexPath) as! LoginCell
            return loginCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TourCell.identifier, for: indexPath) as! TourCell
//        cell.imageView.image = UIImage(named: tour.imageString)
//        cell.textView.text = tour.title + "\n\n" + tour.description
        cell.tour = tourData[indexPath.item]
        return cell
    }
    
    //This method is from the flow layout, know certain method to controll the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height)
    }
    
}

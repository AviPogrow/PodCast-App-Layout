//
//  TopCollectionViewController.swift
//  HorizontalScrollViews
//
//  Created by user on 6/15/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class TopCollectionViewController: UICollectionViewController {

    private let dataSource = DataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up a 3-column Collection View
		let width = view.frame.size.width - 50
		let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width:width, height:width)
        // Do any additional setup after loading the view.
    }
}
extension TopCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
        
        return dataSource.numberOfParksInSection(section)
	}
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
		cell.park = dataSource.parkForItemAtIndexPath(indexPath)
        
        return cell
    }
}














//
//  TableCollectionCell.swift
//  HorizontalScrollViews
//
//  Created by user on 6/14/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class TableCollectionCell: UITableViewCell {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
}

extension TableCollectionCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}

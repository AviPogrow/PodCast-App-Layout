//
//  CollectionCell.swift
//  HorizontalScrollViews
//
//  Created by user on 6/14/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
   
    
    @IBOutlet weak var largeImage: UIImageView!
    
    var park: Park? {
		didSet {
			if let park = park {
				largeImage.image = UIImage(named: park.photo)
            }
        }
    }
    override func prepareForReuse() {
		largeImage.image = nil
	}
}

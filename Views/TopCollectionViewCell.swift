//
//  TopCollectionViewCell.swift
//  HorizontalScrollViews
//
//  Created by user on 6/15/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
  
    
    @IBOutlet weak var largeMainImage: UIImageView!
    
    var park: Park? {
		didSet {
			if let park = park {
				largeMainImage.image = UIImage(named: park.photo)
				
			}
		}
	}
    
    override func prepareForReuse() {
		largeMainImage.image = nil
	}
}

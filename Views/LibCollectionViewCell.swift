//
//  LibCollectionViewCell.swift
//  HorizontalScrollViews
//
//  Created by user on 6/15/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class LibCollectionViewCell: UICollectionViewCell {
    
   
    
    @IBOutlet weak var mainImage: UIImageView!
    
    var park: Park? {
		didSet {
			if let park = park {
				mainImage.image = UIImage(named: park.photo)
				
			}
		}
	}
    
    override func prepareForReuse() {
		mainImage.image = nil
	}
}

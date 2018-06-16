//
//  LibViewController.swift
//  HorizontalScrollViews
//
//  Created by user on 6/15/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class LibViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
 
    private let dataSource = DataSource()
    
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

  

}
extension LibViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                          titleForHeaderInSection section: Int) -> String? {
    
      var title = ""
      if section == 0 {
         title = "Listen Now"
        
      } else if section == 1 {
        
        title = "CollectionView Grid Here"
        }
        return title
    }
        func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch (indexPath.section, indexPath.row) {
        case (0, _):
      return 68
        case (1, _):
        return 422
    default:
        return 24
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTableViewCell", for: indexPath)
        
        return cell
     
    } else {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableCollectionCell",
            for: indexPath) as! TableCollectionCell
        
            cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            return cell
        }
    }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            
        
        
        guard let tableViewCell = cell as? TableCollectionCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        }
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {

        guard let tableViewCell = cell as? TableCollectionCell else { return }

        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        }
    }
    
    
}
extension LibViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return dataSource.numberOfParksInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibCollectionViewCell", for: indexPath) as! LibCollectionViewCell
        
        cell.park = dataSource.parkForItemAtIndexPath(indexPath)
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
    
    
}











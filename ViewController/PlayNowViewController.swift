//
//  PlayNowViewController.swift
//  HorizontalScrollViews
//
//  Created by user on 6/14/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class PlayNowViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = DataSource()
    
    struct TableViewCellIdentifiers {
    static let tableCollectionCell = "TableCollectionCell"
    
    static let downloadTableViewCell = "DownloadTableViewCell"
  }
    
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("The data source count is \(dataSource.count)")
        
    //tableView.contentInset = UIEdgeInsets(top: 108, left: 0, bottom: 0, right: 0)
     tableView.sectionHeaderHeight = 60
     
    }
    
}
extension PlayNowViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                          titleForHeaderInSection section: Int) -> String? {
    
      var title = ""
      if section == 0 {
         title = "Listen Now"
        
      } else if section == 1 {
       
        title = "Shows You Might Like"
      } else if section == 2 {
        title = "Recently Played"
        }
     
     return title
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
      return 3
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 2
        } else {
        
        return 1
      }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let park = dataSource.parkForItemAtIndexPath(indexPath)
        print("the park is \(String(describing: park))")
        
        if indexPath.section == 0 {
       
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCellIdentifiers.downloadTableViewCell,
            for: indexPath) as! DownloadTableViewCell
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
    
    func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch (indexPath.section, indexPath.row) {
        case (0, _):
      return 70
        case (1, _):
        return 140
    default:
        return 140
        }
    }
}
//our view controller will also serve as the datasoure and delegate for the
//nested collectionView
extension PlayNowViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.numberOfParksInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        
        cell.park = dataSource.parkForItemAtIndexPath(indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}





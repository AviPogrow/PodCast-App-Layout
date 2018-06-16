//
//  BrowseViewController.swift
//  HorizontalScrollViews
//
//  Created by user on 6/14/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = DataSource()
    var storedOffsets = [Int: CGFloat]()
    
    struct TableViewCellIdentifiers {
      static let tableCollectionCell = "TableCollectionCell"
      static let downloadTableViewCell = "DownloadTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("The data source count is \(dataSource.count)")
        //tableView.rowHeight = 88
        
    }
}
extension BrowseViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                          titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        return title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
      return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
        
        return 4
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let park = dataSource.parkForItemAtIndexPath(indexPath)
        print("the park is \(String(describing: park))")
        
        if indexPath.section == 0 {
       
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCellIdentifiers.tableCollectionCell,
            for: indexPath) as! TableCollectionCell
            
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            
        return cell
        
        } else {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TableViewCellIdentifiers.downloadTableViewCell,
            for: indexPath) as! DownloadTableViewCell
        
        return cell
        }
    }
     
      func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            
        guard let tableViewCell = cell as? TableCollectionCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {

        guard let tableViewCell = cell as? TableCollectionCell else { return }

        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        }
    }
    
    func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch (indexPath.section, indexPath.row) {
        case (0, _):
      return 88
        case (1, _):
        return 44
    default:
        return 44
        }
    }
    }
    

extension BrowseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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








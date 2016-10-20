//
//  CategoryCollectionViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 10/19/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit


class CategoryCollectionViewController: UICollectionViewController
{
    
    // data source
    let categories = NewsCategories()
    
    private let leftAnDRightPaddings: CGFloat = 32.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heightAdjustment: CGFloat = 10.0
    
    // MARK: View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = ((collectionView?.frame)!.width - leftAnDRightPaddings) / numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: (width + heightAdjustment))
    }
    
    //MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.numberOfCategories
    }
    
    private struct Storyboard
    {
        static let CellIdentifier = "CategoryCell"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath as IndexPath) as! CategoryCollectionViewCell
        
        cell.category = categories.categoryForItemAtIndexPath(indexPath: indexPath as NSIndexPath)
        
        return cell
    }

}





















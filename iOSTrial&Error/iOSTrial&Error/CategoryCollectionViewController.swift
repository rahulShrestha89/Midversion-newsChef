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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath as IndexPath) as UICollectionViewCell
        
        return cell
    }

}





















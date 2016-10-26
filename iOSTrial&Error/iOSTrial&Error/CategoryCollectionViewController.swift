//
//  CategoryCollectionViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 10/19/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit
import DigitsKit
import FirebaseDatabase

class CategoryCollectionViewController: UICollectionViewController
{
    var ref: FIRDatabaseReference!
    
    let button = UIButton()
    
    let screenSize: CGRect = UIScreen.main.bounds
    let digitsRef = Digits.sharedInstance().session()
    
    var topicsArray = [String]()
    
    // data source
    let categories = NewsCategories()
    
    private let leftAnDRightPaddings: CGFloat = 32.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heightAdjustment: CGFloat = 10.0
    
    // MARK: View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "user-chosen-topics")
    
        
        let width = ((collectionView?.frame)!.width - leftAnDRightPaddings) / numberOfItemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: (width + heightAdjustment))
        
        createButton()
        
    }

    func createButton () {
        
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: screenSize.width/3,y: screenSize.height/1.1, width: 150,height: 50)
        
        button.addTarget(self, action: #selector(nextButtonPressed(sender:)), for: UIControlEvents.touchUpInside)

        decorateButton(button,color: UIColor.newsChefRedColor())
        self.view.addSubview(button)
        
        button.isHidden = true
    }
    
    //MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.numberOfCategories
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        //1
        switch kind {
        //2
        case UICollectionElementKindSectionHeader:
            //3
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "CategoryCollectionHeaderView",
                for: indexPath) as! CategoryCollectionHeaderView
            return headerView
        default:
            //4
            assert(false, "Unexpected element kind")
        }
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
    
    // MARK: UICOllectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let category = categories.categoryForItemAtIndexPath(indexPath: indexPath as NSIndexPath)
        
        topicsArray.append((category?.title)!)
        
        deletePublisher(category!)
        
        button.alpha = 0
        if(topicsArray.count > 4)
        {
            button.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.button.alpha = 1
            }
        }
        
    }
    
    func deletePublisher(_ category: Category)
    {
        // 1. delete publisher from the data source
        let indexPath = categories.indexPathForCategory(category: category)
        categories.deleteItemsAtIndexPaths(indexPaths: [indexPath])
        
        // 2. collectionView.deleteItemsAtIndexPaths([indexPath])
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: UIViewAnimationOptions(), animations: { () -> Void in
            (self.collectionView?.deleteItems(at: [indexPath as IndexPath]))!
        }) { (finished) -> Void in
            
        }
    }

    private func decorateButton(_ button: UIButton, color: UIColor) {
        // Draw the border around a button.
        button.layer.masksToBounds = false
        button.layer.borderColor = color.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 6
        button.backgroundColor = color
    }
    
    
    func nextButtonPressed(sender:UIButton!) {
        // create an action to call a next segues
        // while performing that segue pass all the info from the array
        // with topic to the firebase
        
        // get users phone number and store the category every time user presses on a
        // particular category
        
        let topicList = topicsArray.joined(separator: ",")
        
        let userInfoModelData = UserCategorySelection(phoneNumber: ("+19859564513"),sessionToken: ("hvajhsvdjhv"),topics: topicList)
  
        // send it to firebase
        let userInfo = ref.child("+19859564513")
        userInfo.setValue(userInfoModelData.toAnyObject())
        
        self.performSegue(withIdentifier: "showTabViewForFirstTime", sender: self)

        
    }
    
    
    


}





















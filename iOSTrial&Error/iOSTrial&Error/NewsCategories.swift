//
//  NewsCategories.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 10/18/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//
import UIKit

class NewsCategories
{

    fileprivate var categories = [Category]()
    fileprivate var immutableCategories = [Category]()
    fileprivate var sections = [String]()
    
    // MARK: - Public
    
    var numberOfCategories: Int {
        return categories.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init()
    {
        categories = createCategories()
        immutableCategories = categories
        sections = ["CombinedTopics"]
    }
    
    func deleteItemsAtIndexPaths(indexPaths: [NSIndexPath])
    {
        var indexes = [Int]()
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath: indexPath))
        }
        var newCategories = [Category]()
        for (index, category) in categories.enumerated() {
            if !indexes.contains(index) {
                newCategories.append(category)
            }
        }
        categories = newCategories
    }
    
    func moveCategoryFromIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        if indexPath != newIndexPath {
            let index = absoluteIndexForIndexPath(indexPath: indexPath)
            let publisher = categories[index]
            publisher.section = sections[newIndexPath.section]
            let newIndex = absoluteIndexForIndexPath(indexPath: newIndexPath)
            categories.remove(at: index)
            categories.insert(publisher, at: newIndex)
        }
    }
    
    func indexPathForNewRandomPublisher() -> NSIndexPath
    {
        let index = Int(arc4random_uniform(UInt32(immutableCategories.count)))
        let categoryToCopy = immutableCategories[index]
        let newCategory = Category(copies: categoryToCopy)
        categories.append(newCategory)
        categories.sort { $0.section < $1.section }
        return indexPathForCategory(category: newCategory) as NSIndexPath
    }
    
    func indexPathForCategory(category: Category) -> NSIndexPath
    {
        let section = sections.index(of: category.section)
        var item = 0
        for (index, currentCategory) in categoriesForSection(index: section!).enumerated() {
            if currentCategory === category {
                item = index
                break
            }
        }
        return NSIndexPath(item: item, section: section!)
    }
    
    func numberOfCategoriesInSection(index: Int) -> Int {
        let categories = categoriesForSection(index: index)
        return categories.count
    }
    
    func categoryForItemAtIndexPath(indexPath: NSIndexPath) -> Category? {
        if indexPath.section > 0 {
            let categories = categoriesForSection(index: indexPath.section)
            return categories[indexPath.item]
        } else {
            return categories[indexPath.item]
        }
    }

    func titleForSectionAtIndexPath(indexPath: NSIndexPath) -> String?
    {
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    // MARK: - Private
    
    private func createCategories() -> [Category]
    {
        var newsCategories = [Category]()
        
        newsCategories += CombinedTopics.categories()

        
        return newsCategories
    }
    
    private func absoluteIndexForIndexPath(indexPath: NSIndexPath) -> Int
    {
        var index = 0
        for i in 0..<indexPath.section {
            index += numberOfCategoriesInSection(index: i)
        }
        index += indexPath.item
        return index
    }
    
    private func categoriesForSection(index: Int) -> [Category] {
        let section = sections[index]
        let categoriesInSection = categories.filter {
            (category: Category) -> Bool in return category.section == section
        }
        return categoriesInSection
    }
}

    class CombinedTopics
    {
        class func categories() -> [Category]
        {
            var categories = [Category]()
            categories.append(Category(title: "The Atlantic", image: UIImage(named: "The Atlantic")!, section: "CombinedTopics"))
            categories.append(Category(title: "The Hill", image: UIImage(named: "The Hill")!, section: "CombinedTopics"))
            categories.append(Category(title: "Intelligence", image: UIImage(named: "Daily Intelligencer")!, section: "CombinedTopics"))
            categories.append(Category(title: "Vanity Fair", image: UIImage(named: "Vanity Fair")!, section: "CombinedTopics"))
            categories.append(Category(title: "TIME", image: UIImage(named: "TIME")!, section: "CombinedTopics"))
            categories.append(Category(title: "Huffington",image: UIImage(named: "The Huffington Post")!, section: "CombinedTopics"))
            
            categories.append(Category(title: "AFAR", image: UIImage(named: "AFAR")!, section: "CombinedTopics"))
            categories.append(Category(title: "The NY Times",image: UIImage(named: "The New York Times")!, section: "CombinedTopics"))
            categories.append(Category(title: "Men’s Journal",  image: UIImage(named: "Men’s Journal")!, section: "CombinedTopics"))
            categories.append(Category(title: "Smithsonian", image: UIImage(named: "Smithsonian")!, section: "CombinedTopics"))
            categories.append(Category(title: "Wallpaper",image: UIImage(named: "Wallpaper")!,   section: "CombinedTopics"))
            categories.append(Category(title: "Sunset",image: UIImage(named: "Sunset")!, section: "CombinedTopics"))
            
            categories.append(Category(title: "WIRED", image: UIImage(named: "WIRED")!, section: "CombinedTopics"))
            categories.append(Category(title: "Re/code",image: UIImage(named: "Recode")!, section: "CombinedTopics"))
            categories.append(Category(title: "Quartz",image: UIImage(named: "Quartz")!, section: "CombinedTopics"))
            categories.append(Category(title: "Daring Fireball", image: UIImage(named: "Daring Fireball")!, section: "CombinedTopics"))
            
            categories.append(Category(title: "ESPN", image: UIImage(named: "ESPN")!, section: "CombinedTopics"))
            categories.append(Category(title: "Soccer",image: UIImage(named: "Soccer")!, section: "CombinedTopics"))
            categories.append(Category(title: "Boston Red Sox",image: UIImage(named: "Boston Red Sox")!, section: "CombinedTopics"))
            categories.append(Category(title: "Knicks", image: UIImage(named: "Knicks")!, section: "CombinedTopics"))
            categories.append(Category(title: "Liverpool FC", image: UIImage(named: "Liverpool FC")!, section: "CombinedTopics"))
            
            return categories
        }
    }
    

    
    


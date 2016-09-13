//
//  LookAroundPageViewController.swift
//  iOSTrial&Error
//
//  Created by Rahul Shrestha on 9/12/16.
//  Copyright © 2016 Trial&Error. All rights reserved.
//

import UIKit

class LookAroundPageViewController: UIPageViewController , UIPageViewControllerDataSource {
    
    var arrPageTitle: NSArray = NSArray()
    var arrPagePhoto: NSArray = NSArray()
    var arrPageMainTitle: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrPageTitle = ["Follow News that spark your interests.","Search for News.","News based on you reading habit.","Pass anything you want!"];
        arrPagePhoto = ["topic.png","search.png","news.png","share.png"];
        arrPageMainTitle = ["Track","LookOut","Customized","Share"];
        
        self.dataSource = self
        
    }
    
    override func viewDidAppear (animated: Bool) {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.setViewControllers([self.getViewControllerAtIndex(0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let subViews: NSArray = view.subviews
        var scrollView: UIScrollView? = nil
        var pageControl: UIPageControl? = nil
        
        for view in subViews {
            if view.isKindOfClass(UIScrollView) {
                scrollView = view as? UIScrollView
            }
            else if view.isKindOfClass(UIPageControl) {
                pageControl = view as? UIPageControl
            }
        }
        
        if (scrollView != nil && pageControl != nil) {
            scrollView?.frame = view.bounds
            view.bringSubviewToFront(pageControl!)
        }
    }
    
    // MARK:- UIPageViewControllerDataSource Methods
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: LookUpChildViewController = viewController as! LookUpChildViewController
        
        var index = pageContent.pageIndex
        
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        
        index -= 1;
        return getViewControllerAtIndex(index)
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return arrPageTitle.count
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let pageContent: LookUpChildViewController = viewController as! LookUpChildViewController
        
        var index = pageContent.pageIndex
        
        if (index == NSNotFound)
        {
            return nil;
        }
        
        index += 1;
        if (index == arrPageTitle.count)
        {
            return nil;
        }
        return getViewControllerAtIndex(index)
    }
    
    // MARK:- Other Methods
    func getViewControllerAtIndex(index: NSInteger) -> LookUpChildViewController
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LookUpChildViewController") as! LookUpChildViewController
        
        pageContentViewController.strTitle = "\(arrPageTitle[index])"
        pageContentViewController.strPhotoName = "\(arrPagePhoto[index])"
        pageContentViewController.strMainTitle = "\(arrPageMainTitle[index])"
        pageContentViewController.pageIndex = index
        
        pageContentViewController.view.backgroundColor = UIColor.newsChefBeigeColor()
        
        return pageContentViewController
    }
    
}

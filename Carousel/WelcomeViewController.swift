//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Jesse Fornear on 9/22/14.
//  Copyright (c) 2014 Jesse Fornear. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController,
    UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var welcomeImageView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var pageControlButton: UIButton!
    
    var page : Int = 0
    let pages = 4

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self

        
    }

    @IBAction func onPageControlTap(sender: AnyObject) {
        page = Int(round(scrollView.contentOffset.x / 320))
        
        var offsetX: CGFloat
        
        offsetX = CGFloat(320 + (page * 320))
        
        if (page < pages) {
            self.scrollView.setContentOffset(CGPointMake(offsetX, 0), animated: true)
            page = Int(round(offsetX / 320))

        }
        
        self.nextPage(page)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        page = Int(round(scrollView.contentOffset.x / 320))

        self.nextPage(page)
    }
    
    func nextPage(currentPage: Int) {
        self.pageControl.currentPage = currentPage
        
        if (currentPage == 3) {
            UIView.animateWithDuration(0.5, animations: {
                self.buttonView.alpha = 1.0
                self.pageControl.alpha = 0.0
                self.scrollView.sendSubviewToBack(self.pageControlButton)
            })
        }
        else {
            pageControl.alpha = 1.0
            buttonView.alpha = 0.0
        }
        println(page)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

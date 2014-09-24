//
//  IntroViewController.swift
//  Carousel
//
//  Created by Jesse Fornear on 9/20/14.
//  Copyright (c) 2014 Jesse Fornear. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate, UIActionSheetDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var introTile1ImageView: UIImageView!
    @IBOutlet weak var introTile2ImageView: UIImageView!
    @IBOutlet weak var introTile3ImageView: UIImageView!
    @IBOutlet weak var introTile4ImageView: UIImageView!
    @IBOutlet weak var introTile5ImageView: UIImageView!
    @IBOutlet weak var introTile6ImageView: UIImageView!
    
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        introScrollView.sendSubviewToBack(introImageView)
        

        transformIntroTiles()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(introScrollView: UIScrollView!) {
        transformIntroTiles()
        
    }
    
    func transformIntroTiles() {
        var offset = Float(introScrollView.contentOffset.y)

        var tx1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
        var ty1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var scale1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        var tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 75, r2Max: 0)
        var ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        var scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        var tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -66, r2Max: 0)
        var ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        var scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        var tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        var ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        var scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        var rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        var tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -200, r2Max: 0)
        var ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -480, r2Max: 0)
        var scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        var tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -15, r2Max: 0)
        var ty6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        var scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        
        introTile1ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation1) * M_PI / 180))
        introTile1ImageView.transform = CGAffineTransformTranslate(introTile1ImageView.transform, CGFloat(tx1), CGFloat(ty1))
        introTile1ImageView.transform = CGAffineTransformScale(introTile1ImageView.transform, CGFloat(scale1), CGFloat(scale1))
        
        introTile2ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation2) * M_PI / 180))
        introTile2ImageView.transform = CGAffineTransformTranslate(introTile2ImageView.transform, CGFloat(tx2), CGFloat(ty2))
        introTile2ImageView.transform = CGAffineTransformScale(introTile2ImageView.transform, CGFloat(scale2), CGFloat(scale2))
        
        introTile3ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation3) * M_PI / 180))
        introTile3ImageView.transform = CGAffineTransformTranslate(introTile3ImageView.transform, CGFloat(tx3), CGFloat(ty3))
        introTile3ImageView.transform = CGAffineTransformScale(introTile3ImageView.transform, CGFloat(scale3), CGFloat(scale3))
        
        introTile4ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation4) * M_PI / 180))
        introTile4ImageView.transform = CGAffineTransformTranslate(introTile4ImageView.transform, CGFloat(tx4), CGFloat(ty4))
        introTile4ImageView.transform = CGAffineTransformScale(introTile4ImageView.transform, CGFloat(scale4), CGFloat(scale4))
        
        introTile5ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation5) * M_PI / 180))
        introTile5ImageView.transform = CGAffineTransformTranslate(introTile5ImageView.transform, CGFloat(tx5), CGFloat(ty5))
        introTile5ImageView.transform = CGAffineTransformScale(introTile5ImageView.transform, CGFloat(scale5), CGFloat(scale5))
        
        introTile6ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation6) * M_PI / 180))
        introTile6ImageView.transform = CGAffineTransformTranslate(introTile6ImageView.transform, CGFloat(tx6), CGFloat(ty6))
        introTile6ImageView.transform = CGAffineTransformScale(introTile6ImageView.transform, CGFloat(scale6), CGFloat(scale6))
        
        
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

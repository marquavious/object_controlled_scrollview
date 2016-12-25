//
//  ViewController.swift
//  swipe_to_show_new_page
//
//  Created by Marquavious on 12/25/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var arrayOfSampleObjects = [
        SampleObject(sampleText: "Scrolling"),
        SampleObject(sampleText: "Page"),
        SampleObject(sampleText: "Example"),
        ]
    
    var images = [UIView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var contentWidth: CGFloat = 0.0
        
        //Gets the width of the scroll view
        let scrollviewWidth = scrollView.frame.size.width
        
        //Loops through and add images to the images array
        for x in 0...2{

            
            //Adds an image vire to a scroll view
            let viewToShowInformation = UIView()
            viewToShowInformation.backgroundColor = .orange
            images.append(viewToShowInformation)
            
            var newX: CGFloat = 0.0
            
            newX = scrollviewWidth / 2 + scrollviewWidth * CGFloat(x)
            
            //Bruhhh......WHAT IS GOING ON
            contentWidth += newX
            scrollView.addSubview(viewToShowInformation)
            
            viewToShowInformation.frame = CGRect(x: newX - 75, y:( scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        scrollView.clipsToBounds = false
    }
    
}


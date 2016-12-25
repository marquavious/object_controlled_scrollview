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
        let scrollviewHeight = scrollView.frame.size.height
        
        //Loops through and add images to the images array
        for x in 0...4{
            let viewToShowInformation = UIView()
            if x % 2 == 1{
                viewToShowInformation.backgroundColor = .orange
            } else{
                viewToShowInformation.backgroundColor = .green
            }

            images.append(viewToShowInformation)
            
            var newX: CGFloat = 0.0
            
            newX = scrollviewWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(viewToShowInformation)
            
            viewToShowInformation.frame = CGRect(x: newX, y:0, width: scrollviewWidth, height: scrollviewHeight)
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height:scrollviewHeight)
        scrollView.clipsToBounds = false
    }
    
}


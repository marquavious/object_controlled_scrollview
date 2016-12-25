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
            let textToShowInformation = UILabel()
            let viewToShowInformation = UIView()
            
            if x % 2 == 1{
                viewToShowInformation.backgroundColor = .orange
            } else {
                viewToShowInformation.backgroundColor = .green
            }

            images.append(viewToShowInformation)
            
            var newX: CGFloat = 0.0
            
            newX = scrollviewWidth * CGFloat(x)
            
            contentWidth += newX
            
            textToShowInformation.text = "IT IS LIT"
            textToShowInformation.backgroundColor = .yellow
            textToShowInformation.translatesAutoresizingMaskIntoConstraints = false
            textToShowInformation.textAlignment = .center
            scrollView.addSubview(viewToShowInformation)
            viewToShowInformation.addSubview(textToShowInformation)
      
            
            viewToShowInformation.frame = CGRect(x: newX, y:0, width: scrollviewWidth, height: scrollviewHeight)
            
            textToShowInformation.centerXAnchor.constraint(equalTo: viewToShowInformation.centerXAnchor).isActive = true
            textToShowInformation.centerYAnchor.constraint(equalTo: viewToShowInformation.centerYAnchor).isActive = true
            textToShowInformation.heightAnchor.constraint(equalToConstant: 31).isActive = true
//            textToShowInformation.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height:scrollviewHeight)
        scrollView.clipsToBounds = false
    }
    
}


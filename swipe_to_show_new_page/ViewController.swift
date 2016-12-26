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
        SampleObject(sampleText: "Page 1"),
        SampleObject(sampleText: "Page 2"),
        SampleObject(sampleText: "Page 3"),
        SampleObject(sampleText: "Page 4"),
        SampleObject(sampleText: "Page 5"),
        SampleObject(sampleText: "Page 6"),
        SampleObject(sampleText: "Page 7"),
        SampleObject(sampleText: "Page 8"),
        SampleObject(sampleText: "Page 9"),
        SampleObject(sampleText: "Page 10")
    ]
    
    var mainViews = [UIView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var contentWidth: CGFloat = 0.0
        
        //Gets the width of the scroll view
        let scrollviewWidth = scrollView.frame.size.width
        let scrollviewHeight = scrollView.frame.size.height
        
        for x in 0..<arrayOfSampleObjects.count{
            let textToShowInformation = UILabel()
            let viewToShowInformation = UIView()
            
            if x % 2 == 1{
                viewToShowInformation.backgroundColor = .red
            } else {
                viewToShowInformation.backgroundColor = .green
            }
            
            mainViews.append(viewToShowInformation)
            
            var newX: CGFloat = 0.0
            
            newX = scrollviewWidth * CGFloat(x)
            
            //come back to this
            contentWidth += newX - scrollviewWidth/3
            
            textToShowInformation.text = arrayOfSampleObjects[x].sampleText
            textToShowInformation.backgroundColor = .yellow
            textToShowInformation.translatesAutoresizingMaskIntoConstraints = false
            textToShowInformation.textAlignment = .center
            scrollView.addSubview(viewToShowInformation)
            viewToShowInformation.addSubview(textToShowInformation)
            
            
            viewToShowInformation.frame = CGRect(x: newX, y:0, width: scrollviewWidth, height: scrollviewHeight)
            
            textToShowInformation.centerXAnchor.constraint(equalTo: viewToShowInformation.centerXAnchor).isActive = true
            textToShowInformation.centerYAnchor.constraint(equalTo: viewToShowInformation.centerYAnchor).isActive = true
            textToShowInformation.heightAnchor.constraint(equalToConstant: 31).isActive = true
        }
        scrollView.bounces = false
        //        scrollView.contentSize = CGSize(width: CGFloat(Int(contentWidth)*arrayOfSampleObjects.count/2) - view.frame.width, height:scrollviewHeight)
        
        //        scrollView.contentSize = CGSize(width: CGFloat(contentWidth) - scrollView.frame.width * 1/3, height:scrollviewHeight)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(arrayOfSampleObjects.count), height:scrollviewHeight)
        scrollView.clipsToBounds = false
    }
    
}


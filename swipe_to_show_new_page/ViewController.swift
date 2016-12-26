//
//  ViewController.swift
//  swipe_to_show_new_page
//
//  Created by Marquavious on 12/25/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Create your connection from your storyboard
    @IBOutlet weak var scrollView: UIScrollView!
    
    // This is and array of views that will be appended to the scroll view later.
    // These can be images or whatever want
    var mainViews = [UIView]()
    
    // This is an array of objects that are modeled off the SampleObjcet class we created earlier.
    // They all contain diffrent strings to display. We will add the text as they are created
    var arrayOfSampleObjects = [
        SampleObject(sampleText: "Page 1"),SampleObject(sampleText: "Page 2"),
        SampleObject(sampleText: "Page 3"),SampleObject(sampleText: "Page 4"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // contentWidth is a varible that controlls the width of the scroll view
        // This variabel grows each time a view is added
        var contentWidth: CGFloat = 0.0
        
        // scrollviewWidth & scrollviewHeight hold the sizes so we can use them to 
        // calculate the diffrent views later
        let scrollviewWidth = scrollView.frame.size.width
        let scrollviewHeight = scrollView.frame.size.height
        
        // This is where the magic happens. 
        // This for loop goes through the array of objects and create views for each object.
        for object in 0..<arrayOfSampleObjects.count {
            
            // textToShowInformation is a label made to show the text from the diffrent objects.
            // Sets up text properties
            let textToShowInformation = UILabel()
            textToShowInformation.text = arrayOfSampleObjects[object].sampleText // Goes through the arrayOfSampleObjects infromation
            textToShowInformation.translatesAutoresizingMaskIntoConstraints = false
            textToShowInformation.textAlignment = .center
            
            // viewToShowInformation is the view that wil be created for each object
            // for example, if there are 50 objects, there will be 50 views.
            let viewToShowInformation = UIView()
            
            // This adds the diffrent views to the mainViews array to be displayed
            mainViews.append(viewToShowInformation)
            
            // Uncomment this if you want the views to have different colors
            // if object % 2 == 1{
            // viewToShowInformation.backgroundColor = .red
            // } else {
            // viewToShowInformation.backgroundColor = .green
            // }
            
            // ERROR
            // come back to this.... the calculations only work for 6s -_-
            var newX: CGFloat = 0.0
            
            //object in an index so if its object 4,
            //it will be 4x' s as wide...i think...
            newX = scrollviewWidth * CGFloat(object)
            
            // Fix this later...
            contentWidth += newX - scrollviewWidth
            scrollView.addSubview(viewToShowInformation)
            viewToShowInformation.addSubview(textToShowInformation)
            viewToShowInformation.frame = CGRect(x: newX, y:0, width: scrollviewWidth, height: scrollviewHeight)
            
            // Constraints for the text fields. Center Everything...
            textToShowInformation.centerXAnchor.constraint(equalTo: viewToShowInformation.centerXAnchor).isActive = true
            textToShowInformation.centerYAnchor.constraint(equalTo: viewToShowInformation.centerYAnchor).isActive = true
        }
        
        // Sets up the scroll view properties
        scrollView.bounces = true // allows views to bounce past the scrollview width. change to personal preferance
        // Below controlls the width size of the scrollview,I think the problem could lie here too
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(arrayOfSampleObjects.count), height:scrollviewHeight)
        scrollView.clipsToBounds = false // important
    }
}



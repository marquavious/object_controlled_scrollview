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
    
    // This is an array of views that will be appended to the scroll view later.
    // These can be images or whatever want
    var mainViews = [UIView]()
    
    // This is an array of objects that are based off the SampleObjcet class we created earlier.
    // They all contain different strings to display. We will add the text as they are created
    var arrayOfSampleObjects = [
        SampleObject(sampleText: "Page 1"),SampleObject(sampleText: "Page 2"),
        SampleObject(sampleText: "Page 3"),SampleObject(sampleText: "Page 4"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This line is really important. Long story short, since we created this on a 7 layout in storyboards, the scrollView size only knows that size
        // Test it out to learn more.Comment it out and run it on an SE and you will see what happens
        // Check out the link
        // http://stackoverflow.com/questions/41326554/uiscrollview-width-does-not-scale-equally-to-iphone-size/41327330?noredirect=1#comment69869695_41327330
        view.layoutIfNeeded()
        
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
            textToShowInformation.text = arrayOfSampleObjects[object].sampleText // Goes through the arrayOfSampleObjects infromation. (remember that object is just an index)
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
            
            // A new variable to give to the views a centerX anchor that is being added
            var newX: CGFloat = 0.0
            
            // newX changes by index so if its on object (index 4), newX will be offset 4x's.
            newX = scrollviewWidth * CGFloat(object)
            
            // Adds the view to the scrollView
            scrollView.addSubview(viewToShowInformation)
            
            // Adds the text to the views on the scroll views
            viewToShowInformation.addSubview(textToShowInformation)
            
            // This controlls where the viewToShowInformation shows up on the scrollView.
            // Its diffrent for each object
            // See how newX plays a role here?
            viewToShowInformation.frame = CGRect(x: newX, y:0, width: scrollviewWidth, height: scrollviewHeight)
            
            // Constraints for the text fields. Centers the text in the middle of the views
            textToShowInformation.centerXAnchor.constraint(equalTo: viewToShowInformation.centerXAnchor).isActive = true
            textToShowInformation.centerYAnchor.constraint(equalTo: viewToShowInformation.centerYAnchor).isActive = true
        }
        
        // Sets up the scroll view properties
        scrollView.bounces = true // allows views to bounce past the scrollview width. change to personal preference
        
        // scrollView.contentSize is going to get bigger each time there is a object added to the array.
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(arrayOfSampleObjects.count), height:scrollviewHeight)
    }
}



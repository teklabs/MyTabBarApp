//
//  ItemDetailsViewController.swift
//  MyTabBarApp
//
//  Created by teklabsco on 11/17/15.
//  Copyright © 2015 Teklabs, LLC. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController,UITextViewDelegate {
    
    //var item:Item?
    //let moodArray = [  "Health", "Job", "Wisdom", "Faith", "Family", "Natural Disaster"]

    
    //@IBOutlet weak var titleTextField: UITextField!
    //@IBOutlet weak var categoryPicker: UIPickerView!
    //@IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var detailDescriptionLabel: UITextView!
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if itemObjects.count == 0 {
            return
        }
        if let label = self.detailDescriptionLabel {
            label.text = itemObjects[currentIndex]
            if label.text == BLANK_ITEM_NOTE {
                label.text = ""
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemDetailsViewController = self
        detailDescriptionLabel.becomeFirstResponder()
        detailDescriptionLabel.delegate = self
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if itemObjects.count == 0 {
            return
        }
        itemObjects[currentIndex] = detailDescriptionLabel.text
        if detailDescriptionLabel.text == "" {
            itemObjects[currentIndex] = BLANK_ITEM_NOTE
        }
        saveAndUpdate()
    }
    
    func saveAndUpdate() {
        masterItemView?.save()
        masterItemView?.tableView.reloadData()
    }
    
    func textViewDidChange(textView: UITextView) {
        itemObjects[currentIndex] = detailDescriptionLabel.text
        saveAndUpdate()
    }
    
}

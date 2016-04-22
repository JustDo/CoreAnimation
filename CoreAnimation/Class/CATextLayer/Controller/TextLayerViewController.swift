//
//  TextLayerViewController.swift
//  CoreAnimation
//
//  Created by 张鹏 on 16/4/13.
//  Copyright © 2016年 张鹏. All rights reserved.
//

import UIKit

class TextLayerViewController: UIViewController {

    var textEffectLabel: TextAnimationLabel!
    
    private var textArray = ["Core Animation?",
                             "Code By Swift",
                             "iOS App Amily",
                             "what it looks like",
                             "and feels like."];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        let frame = CGRectMake(50, 100, 300, 100)
        self.textEffectLabel = TextAnimationLabel(frame: frame)
        
        self.textEffectLabel.font = UIFont.systemFontOfSize(38.0)
        self.textEffectLabel.numberOfLines = 0
        self.textEffectLabel.textAlignment = NSTextAlignment.Center
        self.textEffectLabel.text = "Yes,Hello World"
        self.textEffectLabel.textColor = UIColor.yellowColor()
//        self.textEffectLabel.backgroundColor = UIColor.blueColor()
        self.view.addSubview(self.textEffectLabel)

        
    }

    @IBAction func changeText(sender: AnyObject)
    {
        let index = Int(arc4random_uniform(5))
        
        if index < textArray.count
        {
            let text:String = textArray[index]
            self.textEffectLabel.text = text
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

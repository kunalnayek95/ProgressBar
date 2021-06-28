//
//  ViewController.swift
//  DempProgress
//
//  Created by Kunal's Macbook on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var solidProgress: NSLayoutConstraint!
    @IBOutlet weak var stripedProgressView: Ruled!
    @IBOutlet weak var solidProgressView: UIView!
    @IBOutlet weak var stripedProgress: NSLayoutConstraint!
    
    @IBOutlet weak var mainProgressView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        mainProgressView.layer.cornerRadius = self.mainProgressView.frame.height/2
        mainProgressView.layer.borderWidth = 1
        mainProgressView.layer.borderColor = UIColor(red: 53/255.0, green: 126/255.0, blue: 148/255.0, alpha: 1).cgColor
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.solidProgress.constant = (self.mainProgressView.frame.size.width/100)*50
        self.stripedProgress.constant = (self.mainProgressView.frame.size.width/100)*10
        
        
    }


}

class Ruled: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let T: CGFloat = 2     // desired thickness of lines
        let G: CGFloat = 6     // desired gap between lines
        let W = rect.size.width
        let H = rect.size.height
        
        guard let c = UIGraphicsGetCurrentContext() else { return }
        c.setStrokeColor(UIColor(red: 53/255.0, green: 126/255.0, blue: 148/255.0, alpha: 1).cgColor)
        c.setLineWidth(T)
        
        var p = -(W > H ? W : H) - T
        while p <= W {
            
            c.move( to: CGPoint(x: p-T, y: -T) )
            c.addLine( to: CGPoint(x: p+T+H, y: T+H) )
            c.strokePath()
            p += G + T + T
        }
    }
}


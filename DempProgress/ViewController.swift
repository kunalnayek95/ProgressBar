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
    
    var width = 70
    var id = 1
    
    var strippedViewArray = [Ruled]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        mainProgressView.layer.cornerRadius = self.mainProgressView.frame.height/2
        mainProgressView.layer.borderWidth = 1
        mainProgressView.layer.borderColor = UIColor(red: 53/255.0, green: 126/255.0, blue: 148/255.0, alpha: 1).cgColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.strippedViewArray.append(stripedProgressView)
        self.solidProgress.constant = (self.mainProgressView.frame.size.width/100)*30
        self.stripedProgress.constant = (self.mainProgressView.frame.size.width/100)*CGFloat(width)
    }
    
//    func draw(_ rect: CGRect) {
//
//        let T: CGFloat = 3     // desired thickness of lines
//        let G: CGFloat = 6     // desired gap between lines
//        let W = rect.size.width
//        let H = rect.size.height
//
//        guard let c = UIGraphicsGetCurrentContext() else { return }
//        c.setStrokeColor(UIColor(red: 53/255.0, green: 126/255.0, blue: 148/255.0, alpha: 1).cgColor)
//        c.setLineWidth(T)
//
//        var p = -(W > H ? W : H) - T
//        while p <= W {
//
//            c.move( to: CGPoint(x: (p-T), y: (-T)) )
//            c.addLine( to: CGPoint(x: (p+T+H), y: (T+H)) )
//            c.strokePath()
//            p += G + T + T
//        }
//        //self.transform = CGAffineTransform(rotationAngle: CGFloat(-180 * Double.pi / 180))
//        self.stripedProgressView.layer.transform = CATransform3DMakeScale(1, -1, 1)
//
//    }

    @IBAction func ButtonAction(_ sender: UIButton) {
        width = width - 5
        
        if self.strippedViewArray.count > 0{
            self.strippedViewArray[0].removeFromSuperview()
            self.strippedViewArray.remove(at: 0)
        }
        stripedProgressView.isHidden = true
        
        let tempView = Ruled()
        self.strippedViewArray.append(tempView)
        tempView.translatesAutoresizingMaskIntoConstraints = false
        self.stripedProgress.constant = (self.mainProgressView.frame.size.width/100)*CGFloat(width)
        tempView.backgroundColor = UIColor.clear
        view.addSubview(tempView)
        NSLayoutConstraint.activate([
            tempView.leadingAnchor.constraint(equalTo: stripedProgressView.leadingAnchor),
            tempView.topAnchor.constraint(equalTo: stripedProgressView.topAnchor),
            tempView.bottomAnchor.constraint(equalTo: stripedProgressView.bottomAnchor),tempView.widthAnchor.constraint(equalTo: stripedProgressView.widthAnchor)
        ])
        
    }
    
}

class Ruled: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let T: CGFloat = 3     // desired thickness of lines
        let G: CGFloat = 6     // desired gap between lines
        let W = rect.size.width
        let H = rect.size.height
        
        guard let c = UIGraphicsGetCurrentContext() else { return }
        c.setStrokeColor(UIColor(red: 53/255.0, green: 126/255.0, blue: 148/255.0, alpha: 1).cgColor)
        c.setLineWidth(T)
        
        var p = -(W > H ? W : H) - T
        while p <= W {
            
            c.move( to: CGPoint(x: (p-T), y: (-T)) )
            c.addLine( to: CGPoint(x: (p+T+H), y: (T+H)) )
            c.strokePath()
            p += G + T + T
        }
        //self.transform = CGAffineTransform(rotationAngle: CGFloat(-180 * Double.pi / 180))
        self.layer.transform = CATransform3DMakeScale(1, -1, 1)
        
    }
}


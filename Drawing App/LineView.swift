//
//  LineView.swift
//  Drawing App
//
//  Created by Julia Li on 7/9/18.
//  Copyright © 2018 Julia Li. All rights reserved.
//

import Foundation
import UIKit

class LineView: UIView {
    
    var theLine:Line? {
    didSet {
    setNeedsDisplay()
    }
    }
    
    var lines:[Line] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    func updateCircle(center: CGPoint, radius: CGFloat) {
    //        arcCenter = center
    //        arcRadius = radius
    //
    //        print("updating center: \(center) and radius :\(radius)")
    //
    //        setNeedsDisplay()
    //    }
    //
    
    
    func drawLine(_ line: Line) {
        UIColor.green.setFill()
        
        let path = UIBezierPath()
        
//        path.addArc(withCenter: circle.center, radius: circle.radius, startAngle: 0, endAngle: CGFloat(Float.pi*2), clockwise: true)
        
//        path.addArc(withCenter: <#T##CGPoint#>, radius: <#T##CGFloat#>, startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)
//        
        //path.addLine(to: line.location)
//        path.move(to: CGPoint(x:0.0, y:0.0))
//        path.addLine(to: CGPoint(x:0.0, y:20.0))
        path.fill()
        UIColor.black.setStroke()
        path.stroke()
        
        
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        for line in lines {
            drawLine(line)
        }
        
        if(theLine != nil) {
            drawLine(theLine!)
        }
    }
    
    
}

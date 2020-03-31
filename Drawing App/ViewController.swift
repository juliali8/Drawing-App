//
//  ViewController.swift
//  Drawing App
//
//  Created by Julia Li on 7/9/18.
//  Copyright © 2018 Julia Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentCircleCenter = CGPoint.zero
    var currentLine: Line?
    var lineCanvas: LineView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lineCanvas = LineView(frame: self.view.frame)
        view.addSubview(lineCanvas)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        print("point is \(touchPoint)")
        
        currentCircleCenter = touchPoint
        
//        currentLine = Line(
        
        //   let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        //        currentCircle = CircleView(frame: frame)
        //        view.addSubview(currentCircle!)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        print("ended at \(touchPoint)")
        
        if let newLine = currentLine {
            lineCanvas.lines.append(newLine)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        print("moved to \(touchPoint)")
        
        //        let distance = sqrt(pow(touchPoint.y - currentCircleCenter.y,2.0) + pow(touchPoint.x - currentCircleCenter.x,2.0))
        
//        let distance = Functions.distance(a: touchPoint, b: (currentLine?.location)!)
        
//        currentCircle?.radius = distance
        lineCanvas.theLine = currentLine
        
//
//                currentCircle?.updateCircle(center: currentCircleCenter, radius: distance)
    }

//    guard; let touchPoint = touches.first?.location(in: view); else { return }
    
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let x = (first.x + second.x)/2
        let y = (first.y + second.y)/2
        return CGPoint(x: x, y: y)
    }
    
    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = midpoint(first: currentPoint, second: nextPoint)
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        return path
    }


}


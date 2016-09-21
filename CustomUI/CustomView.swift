//
//  CustomView.swift
//  CustomUI
//
//  Created by 片桐奏羽 on 2015/09/08.
//  Copyright (c) 2015年 SoKatagiri. All rights reserved.
//

import UIKit

class CustomView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        
        let points:Array<CGPoint> = [
            CGPointMake(50, 250),
            CGPointMake(180, 190),
            CGPointMake(150, 120),
            CGPointMake(130, 50),
            CGPointMake(40, 40),
            CGPointMake(50, 80),
        ];
        
        
        
        let line = UIBezierPath(points: points)
        
        UIColor.whiteColor().setStroke()
        line.lineWidth = 5

        line.stroke()

        
    }
    
}

func midPoint(point1:CGPoint, point2:CGPoint) -> CGPoint {
    return CGPointMake((point1.x + point2.x)/2, (point1.y + point2.y)/2)
}

extension UIBezierPath
{
    convenience init(points:Array<CGPoint>)
    {
        self.init()
        
        UIColor.whiteColor().setStroke()
        
        self.moveToPoint(points[0])
        self.addLineToPoint(midPoint(points[0], point2: points[1]))
        
        // 曲線描画
        for (var i = 2 ; i < points.count ; i++) {
            let preprePoint = points[i - 2]
            let prePoint = points[i - 1]
            
            let currentPoint   = points[i]
            let prepreMid           = midPoint(prePoint, point2: preprePoint)
            let preMid           = midPoint(currentPoint, point2: prePoint)
            self.moveToPoint(prepreMid)
            self.addQuadCurveToPoint(preMid, controlPoint: prePoint)
        }
        
        self.moveToPoint(midPoint(points[points.count-2], point2: points.last!))
        self.addLineToPoint(points.last!)
        
    }
}



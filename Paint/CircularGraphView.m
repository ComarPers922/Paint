//
//  CircularGraphView.m
//  Paint
//
//  Created by ComarPers 922 on 2017/6/3.
//  Copyright © 2017年 ComarPers 922. All rights reserved.
//

#import "CircularGraphView.h"
#import <math.h>

@implementation CircularGraphView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //绘制环形图
    UIBezierPath* path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2) radius:100 startAngle:0*M_PI*2 endAngle:.2*M_PI*2 clockwise:true];
    path1.lineWidth = 50;
    [[UIColor blackColor] set];
    [path1 stroke];
   
    UIBezierPath* path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2) radius:100 startAngle:.2*M_PI*2 endAngle:.4*M_PI*2 clockwise:true];
    path2.lineWidth = 50;
    [[UIColor greenColor] set];
    [path2 stroke];
    
    UIBezierPath* path3 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2) radius:100 startAngle:.4*M_PI*2 endAngle:.6*M_PI*2 clockwise:true];
    path3.lineWidth = 50;
    [[UIColor greenColor] set];
    [path3 stroke];
    
    UIBezierPath* path4 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2) radius:100 startAngle:.6*M_PI*2 endAngle:.7*M_PI*2 clockwise:true];
    path4.lineWidth = 50;
    [[UIColor redColor] set];
    [path4 stroke];
    
    UIBezierPath* path5 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2) radius:100 startAngle:.7*M_PI*2 endAngle:1*M_PI*2 clockwise:true];
    path5.lineWidth = 50;
    [[UIColor orangeColor] set];
    [path5 stroke];
}

@end

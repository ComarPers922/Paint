//
//  MyNode.m
//  Paint
//
//  Created by ComarPers 922 on 2017/5/25.
//  Copyright © 2017年 ComarPers 922. All rights reserved.
//

#import "MyNode.h"

@implementation MyNode
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        
    }
    return self;
}
-(void) setSelected:(BOOL)selected
{
    if(selected)
    {
        self.backgroundColor = [UIColor blueColor];
    }
    else
    {
        self.backgroundColor = [UIColor greenColor];
    }
    _selected = selected;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

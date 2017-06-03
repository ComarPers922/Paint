//
//  LockView.m
//  Paint
//
//  Created by ComarPers 922 on 2017/5/25.
//  Copyright © 2017年 ComarPers 922. All rights reserved.
//

#import "LockView.h"
#import "MyNode.h"
#import "ViewController.h"

#define originX self.bounds.size.width/2 - 100 - 15
#define originY self.bounds.size.height/2 - 100 - 15
#define nodeSize 50

@interface LockView()

@property (nonatomic,assign) CGMutablePathRef path;
@property (nonatomic,strong) NSMutableArray<MyNode*>* buttons;
@property (nonatomic,strong) NSMutableArray<MyNode*>* selectedButtons;

@end

@implementation LockView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        //用作提示密码
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
        [label setText:@"密码为：0125"];
        label.textColor = [UIColor blackColor];
        
        self.buttons = [NSMutableArray array];
        self.selectedButtons = [NSMutableArray array];
        for(int i = 0; i < 9; i ++)
        {
            MyNode* button = [[MyNode alloc]initWithFrame:CGRectMake(originX + i%3*100, originY + i/3*100, nodeSize, nodeSize)];
            button.backgroundColor = [UIColor greenColor];
            button.layer.cornerRadius = button.frame.size.width/2;
            button.ID = i;
            [self.buttons addObject:button];
            [self addSubview:button];
        }
        [self addSubview:label];
    }
    return self;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //点击开始
    self.selectedButtons = [NSMutableArray array];
    self.path = CGPathCreateMutable();
    UITouch* touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    [self.buttons enumerateObjectsUsingBlock:^(MyNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(obj.frame, point) && ![self.selectedButtons containsObject:obj])
        {
            obj.selected = true;
            [self.selectedButtons addObject:obj];
            CGPathMoveToPoint(self.path, nil, obj.frame.origin.x+nodeSize/2, obj.frame.origin.y+nodeSize/2);
            *stop = true;
        }
    }];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //移动
    UITouch* touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    [self.buttons enumerateObjectsUsingBlock:^(MyNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(obj.frame, point) && ![self.selectedButtons containsObject:obj])
        {
            obj.selected = true;
            [self.selectedButtons addObject:obj];
            CGPathAddLineToPoint(self.path, nil, obj.frame.origin.x+nodeSize/2, obj.frame.origin.y+nodeSize/2);
            *stop = true;
        }
    }];
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //点击结束
    if(self.selectedButtons.count == 0)
    {
        return;//没有选择任何点的话直接返回
    }
    NSMutableString* password = [NSMutableString string];
    for(MyNode* item in self.selectedButtons)
    {
        [password appendFormat:@"%d",item.ID];
    }
    //先写好密码
    if([password isEqualToString:@"0125"])
    {
        [self.superViewController presentViewController:((ViewController*)self.superViewController).graph animated:true completion:nil];
    }
    else
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"临时内容" preferredStyle:UIAlertControllerStyleAlert];
        alert.message = @"密码错误";
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self.superViewController presentViewController:alert animated:true completion:nil];
        CGPathRelease(self.path);
        self.path = nil;
        [self setNeedsDisplay];
        for(MyNode* item in self.selectedButtons)
        {
            item.selected = false;
        }
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //绘制当前路径
    if(!self.path)
    {
        return;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, self.path);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 5.0);
    CGContextDrawPath(context, kCGPathStroke);
}

@end

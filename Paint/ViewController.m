//
//  ViewController.m
//  Paint
//
//  Created by ComarPers 922 on 2017/5/25.
//  Copyright © 2017年 ComarPers 922. All rights reserved.
//

#import "ViewController.h"
#import "LockView.h"


@interface ViewController ()

@property (nonatomic,strong) LockView* lockView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.lockView = [[LockView alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, self.view.bounds.size.height-30)];
    self.lockView.backgroundColor = [UIColor whiteColor];
    self.lockView.superViewController = self;
    [self.view addSubview:self.lockView];
    self.graph = [[CircularGraph alloc]init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

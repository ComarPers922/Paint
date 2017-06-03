//
//  CircularGraph.m
//  Paint
//
//  Created by ComarPers 922 on 2017/6/3.
//  Copyright © 2017年 ComarPers 922. All rights reserved.
//

#import "CircularGraph.h"
#import "CircularGraphView.h"

@interface CircularGraph ()
@property (nonatomic,strong) CircularGraphView * graph;
@end

@implementation CircularGraph

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.graph = [[CircularGraphView alloc]initWithFrame:self.view.frame];
    self.graph.backgroundColor = [UIColor whiteColor];
    [self.graph setNeedsDisplay];
    [self.view addSubview:self.graph];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

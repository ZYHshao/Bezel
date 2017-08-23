//
//  DisplayViewController.m
//  Bezel
//
//  Created by jaki on 2017/8/22.
//  Copyright © 2017年 jaki. All rights reserved.
//

#import "DisplayViewController.h"
#import "DisplayView.h"


@interface DisplayViewController ()

@property(nonatomic,strong)DisplayView * displayView;

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.displayView = [[DisplayView alloc]initWithFrame:self.view.frame];
    self.displayView.p1 = self.p1;
    self.displayView.p2 = self.p2;
    self.displayView.p3 = self.p3;
    self.displayView.p4 = self.p4;
    self.displayView.p5 = self.p5;
    self.displayView.steps = self.steps;
    self.displayView.reed = self.reed;
    [self.view addSubview:self.displayView];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.displayView startAnimation];
}

-(void)dealloc{
    [self.displayView clearAnimation];
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

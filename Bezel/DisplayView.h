//
//  DisplayView.h
//  Bezel
//
//  Created by jaki on 2017/8/22.
//  Copyright © 2017年 jaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayView : UIView

@property(nonatomic,assign)CGPoint p1;

@property(nonatomic,assign)CGPoint p2;

@property(nonatomic,assign)CGPoint p3;

@property(nonatomic,assign)CGPoint p4;

@property(nonatomic,assign)CGPoint p5;

@property(nonatomic,assign)int steps;

@property(nonatomic,assign)float reed;

-(void)startAnimation;

-(void)clearAnimation;


@end

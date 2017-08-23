//
//  DisplayView.m
//  Bezel
//
//  Created by jaki on 2017/8/22.
//  Copyright © 2017年 jaki. All rights reserved.
//

#import "DisplayView.h"

@interface DisplayView()

@property(nonatomic,assign)CGFloat time;

@property(nonatomic,strong)NSTimer * timer;

@property(nonatomic,strong)NSMutableArray * pointsArray;

@end

@implementation DisplayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.time = 0;
        self.pointsArray = [NSMutableArray array];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)startAnimation{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1/self.reed target:self selector:@selector(updateView) userInfo:nil repeats:YES];
    self.timer.fireDate = [NSDate distantPast];
}

-(void)clearAnimation{
    self.timer.fireDate = [NSDate distantFuture];
    [self.timer invalidate];
    self.timer = nil;
}

-(void)updateView{
    self.time+=0.025;
    if (self.time<1.5) {
        [self setNeedsDisplayInRect:self.bounds];
    }
    else{
        self.time=0;
        [self.pointsArray removeAllObjects];
    }
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    switch (self.steps) {
        case 1:
        {
            [self drawBezel1:context];
        }
            break;
        case 2:
        {
            [self drawBezel2:context];
        }
            break;
        case 3:
        {
            [self drawBezel3:context];
        }
            break;
        case 4:
        {
            [self drawBezel4:context];
        }
            break;
        default:
            break;
    }
}

-(void)drawBezel1:(CGContextRef)context{
    if (self.time>1) {
        int count = (int)self.pointsArray.count;
        CGPoint points[count];
        for (int i=0; i<count; i++) {
            points[i]=[self.pointsArray[i] CGPointValue];
        }
        CGContextAddLines(context, points, count);
        CGContextStrokePath(context);
        return;
    }
    float x = (self.p2.x-self.p1.x)*self.time+self.p1.x;
    float y = (self.p2.y-self.p1.y)*self.time+self.p1.y;
    CGContextMoveToPoint(context, self.p1.x, self.p1.y);
    [self.pointsArray addObject: [NSValue valueWithCGPoint:CGPointMake(x, y)]];
    
    int count = (int)self.pointsArray.count;
    CGPoint points[count];
    for (int i=0; i<count; i++) {
        points[i]=[self.pointsArray[i] CGPointValue];
    }
    CGContextAddLines(context, points, count);
    CGContextStrokePath(context);
}

-(void)drawBezel2:(CGContextRef)context{
    if (self.time>1) {
        int count = (int)self.pointsArray.count;
        CGPoint points[count];
        for (int i=0; i<count; i++) {
            points[i]=[self.pointsArray[i] CGPointValue];
        }
        CGContextAddLines(context, points, count);
        CGContextStrokePath(context);
        return;
    }
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextMoveToPoint(context, self.p1.x, self.p1.y);
    CGContextAddLineToPoint(context, self.p2.x, self.p2.y);
    CGContextAddLineToPoint(context, self.p3.x, self.p3.y);
    CGContextStrokePath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    float __x1 = (self.p2.x-self.p1.x)*self.time+self.p1.x;
    float __y1 = (self.p2.y-self.p1.y)*self.time+self.p1.y;
    CGPoint __p1 = CGPointMake(__x1, __y1);
    float __x2 = (self.p3.x-self.p2.x)*self.time+self.p2.x;
    float __y2 = (self.p3.y-self.p2.y)*self.time+self.p2.y;
    CGPoint __p2 = CGPointMake(__x2, __y2);
    CGContextMoveToPoint(context, __p1.x, __p1.y);
    CGContextAddLineToPoint(context, __p2.x, __p2.y);
    CGContextStrokePath(context);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, self.p1.x, self.p1.y);
    float __x = (__p2.x-__p1.x)*self.time+__p1.x;
    float __y = (__p2.y-__p1.y)*self.time+__p1.y;
    [self.pointsArray addObject:[NSValue valueWithCGPoint:CGPointMake(__x, __y)]];
    int count = (int)self.pointsArray.count;
    CGPoint points[count];
    for (int i=0; i<count; i++) {
        points[i]=[self.pointsArray[i] CGPointValue];
    }
    CGContextAddLines(context, points, count);
    CGContextStrokePath(context);
}


-(void)drawBezel3:(CGContextRef)context{
    if (self.time>1) {
        int count = (int)self.pointsArray.count;
        CGPoint points[count];
        for (int i=0; i<count; i++) {
            points[i]=[self.pointsArray[i] CGPointValue];
        }
        CGContextAddLines(context, points, count);
        CGContextStrokePath(context);
        return;
    }
    
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextMoveToPoint(context, self.p1.x, self.p1.y);
    CGContextAddLineToPoint(context, self.p2.x, self.p2.y);
    CGContextAddLineToPoint(context, self.p3.x, self.p3.y);
    CGContextAddLineToPoint(context, self.p4.x, self.p4.y);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    float __x1 = (self.p2.x-self.p1.x)*self.time+self.p1.x;
    float __y1 = (self.p2.y-self.p1.y)*self.time+self.p1.y;
    CGPoint __p1 = CGPointMake(__x1, __y1);
    float __x2 = (self.p3.x-self.p2.x)*self.time+self.p2.x;
    float __y2 = (self.p3.y-self.p2.y)*self.time+self.p2.y;
    CGPoint __p2 = CGPointMake(__x2, __y2);
    float __x3 = (self.p4.x-self.p3.x)*self.time+self.p3.x;
    float __y3 = (self.p4.y-self.p3.y)*self.time+self.p3.y;
    CGPoint __p3 = CGPointMake(__x3, __y3);
    CGContextMoveToPoint(context, __p1.x, __p1.y);
    CGContextAddLineToPoint(context, __p2.x, __p2.y);
    CGContextAddLineToPoint(context, __p3.x, __p3.y);
    CGContextStrokePath(context);

    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    float ___x1 = (__p2.x-__p1.x)*self.time+__p1.x;
    float ___y1 = (__p2.y-__p1.y)*self.time+__p1.y;
    float ___x2 = (__p3.x-__p2.x)*self.time+__p2.x;
    float ___y2 = (__p3.y-__p2.y)*self.time+__p2.y;
    CGContextMoveToPoint(context, ___x1, ___y1);
    CGContextAddLineToPoint(context, ___x2, ___y2);
    CGContextStrokePath(context);
    float ___x = (___x2-___x1)*self.time+___x1;
    float ___y = (___y2-___y1)*self.time+___y1;
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, self.p1.x, self.p1.y);
    [self.pointsArray addObject:[NSValue valueWithCGPoint:CGPointMake(___x, ___y)]];
    int count = (int)self.pointsArray.count;
    CGPoint points[count];
    for (int i=0; i<count; i++) {
        points[i]=[self.pointsArray[i] CGPointValue];
    }
    CGContextAddLines(context, points, count);
    CGContextStrokePath(context);
}


-(void)drawBezel4:(CGContextRef)context{
    if (self.time>1) {
        int count = (int)self.pointsArray.count;
        CGPoint points[count];
        for (int i=0; i<count; i++) {
            points[i]=[self.pointsArray[i] CGPointValue];
        }
        CGContextAddLines(context, points, count);
        CGContextStrokePath(context);
        return;
    }
    
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(context, self.p1.x, self.p1.y);
    CGContextAddLineToPoint(context, self.p2.x, self.p2.y);
    CGContextAddLineToPoint(context, self.p3.x, self.p3.y);
    CGContextAddLineToPoint(context, self.p4.x, self.p4.y);
    CGContextAddLineToPoint(context, self.p5.x, self.p5.y);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    float __x1 = (self.p2.x-self.p1.x)*self.time+self.p1.x;
    float __y1 = (self.p2.y-self.p1.y)*self.time+self.p1.y;
    CGPoint __p1 = CGPointMake(__x1, __y1);
    float __x2 = (self.p3.x-self.p2.x)*self.time+self.p2.x;
    float __y2 = (self.p3.y-self.p2.y)*self.time+self.p2.y;
    CGPoint __p2 = CGPointMake(__x2, __y2);
    float __x3 = (self.p4.x-self.p3.x)*self.time+self.p3.x;
    float __y3 = (self.p4.y-self.p3.y)*self.time+self.p3.y;
    CGPoint __p3 = CGPointMake(__x3, __y3);
    float __x4 = (self.p5.x-self.p4.x)*self.time+self.p4.x;
    float __y4 = (self.p5.y-self.p4.y)*self.time+self.p4.y;
    CGPoint __p4 = CGPointMake(__x4, __y4);
    CGContextMoveToPoint(context, __p1.x, __p1.y);
    CGContextAddLineToPoint(context, __p2.x, __p2.y);
    CGContextAddLineToPoint(context, __p3.x, __p3.y);
    CGContextAddLineToPoint(context, __p4.x, __p4.y);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    float ___x1 = (__p2.x-__p1.x)*self.time+__p1.x;
    float ___y1 = (__p2.y-__p1.y)*self.time+__p1.y;
    float ___x2 = (__p3.x-__p2.x)*self.time+__p2.x;
    float ___y2 = (__p3.y-__p2.y)*self.time+__p2.y;
    float ___x3 = (__p4.x-__p3.x)*self.time+__p3.x;
    float ___y3 = (__p4.y-__p3.y)*self.time+__p3.y;
    CGContextMoveToPoint(context, ___x1, ___y1);
    CGContextAddLineToPoint(context, ___x2, ___y2);
    CGContextAddLineToPoint(context, ___x3, ___y3);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    float ____x1 = (___x2-___x1)*self.time+___x1;
    float ____y1 = (___y2-___y1)*self.time+___y1;
    float ____x2 = (___x3-___x2)*self.time+___x2;
    float ____y2 = (___y3-___y2)*self.time+___y2;
    CGContextMoveToPoint(context, ____x1, ____y1);
    CGContextAddLineToPoint(context, ____x2, ____y2);
    CGContextStrokePath(context);
    
    float ____x = (____x2-____x1)*self.time+____x1;
    float ____y = (____y2-____y1)*self.time+____y1;
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, self.p1.x, self.p1.y);
    [self.pointsArray addObject:[NSValue valueWithCGPoint:CGPointMake(____x, ____y)]];
    int count = (int)self.pointsArray.count;
    CGPoint points[count];
    for (int i=0; i<count; i++) {
        points[i]=[self.pointsArray[i] CGPointValue];
    }
    CGContextAddLines(context, points, count);
    CGContextStrokePath(context);
}

@end

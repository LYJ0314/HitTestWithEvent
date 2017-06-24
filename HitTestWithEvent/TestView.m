//
//  TestView.m
//  HitTestWithEvent
//
//  Created by lyj on 17/6/23.
//  Copyright © 2017年 lyj. All rights reserved.
//

#import "TestView.h"
@interface TestView()
@property (nonatomic, strong) UIView *littleView;

@end
@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
     self = [super initWithFrame:frame];
    
    UIView *littleView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 100)];
    littleView.backgroundColor = [UIColor greenColor];
    self.littleView = littleView;
    [self addSubview:littleView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(littleViewClick:)];
    [littleView addGestureRecognizer:tap];
    
    return self;
}
- (void)littleViewClick:(UITapGestureRecognizer *)tap
{
    NSLog(@"littleView被点击了---------");
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint hitPoint = [self.littleView convertPoint:point fromView:self];
    if ([self.littleView pointInside:hitPoint withEvent:event])
    {
        return self.littleView;
    }
    return  [super hitTest:point withEvent:event];
}

@end

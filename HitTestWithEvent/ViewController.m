//
//  ViewController.m
//  HitTestWithEvent
//
//  Created by lyj on 17/6/23.
//  Copyright © 2017年 lyj. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *blackView;
@property (strong, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(blackViewClick:)];
    [self.blackView addGestureRecognizer:tap];
    
    
    TestView *testView = [[TestView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (void)blackViewClick:(UITapGestureRecognizer *)tap
{
    NSLog(@"label手势被点击了");
}

- (IBAction)btnClicked:(id)sender {
    
    NSLog(@"按钮被点击了。。。。");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    [self hitTest:point withEvent:event];
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 把当前控件上的坐标系换成子空间上的坐标系
    CGPoint hitPoint1 = [_btn convertPoint:point fromView:self.view];
    if ([_btn pointInside:hitPoint1 withEvent:event])
    {
        [self btnClicked:_btn];
        return _btn;
    }
    
    CGPoint hitPoint = [_blackView convertPoint:point fromView:self.view];
    if ([_blackView pointInside:hitPoint withEvent:event])
    {
        [self blackViewClick:nil];
        return _blackView;
    }
    return [self.view hitTest:point withEvent:event];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

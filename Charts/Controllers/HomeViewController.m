//
//  HomeViewController.m
//  Charts
//
//  Created by chengxun on 16/5/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HomeViewController.h"
#import <PureLayout.h>
@interface HomeViewController ()
@property (nonatomic,strong)UIImageView * backImageView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DDLogInfo(@"12123123");
    [self setUpIndicator];
    //[self setUpUI];
    // Do any additional setup after loading the view.
}
- (UIImageView*)backImageView{
    if(!_backImageView){
        _backImageView = [[UIImageView alloc]init];
        _backImageView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_backImageView];
    }
    return _backImageView;
}

/**  活动指示器  */
- (void)setUpIndicator{
    self.backImageView.frame =CGRectMake(100, 200, 200, 200);

    CAReplicatorLayer * repl = [CAReplicatorLayer layer];

    repl.frame = self.backImageView.bounds;
    [self.backImageView.layer addSublayer:repl];

    CALayer * layer = [CALayer layer];
    layer.position = CGPointMake(100, 20);
    layer.bounds = CGRectMake(0, 0, 10, 10);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.transform = CATransform3DMakeScale(0, 0, 0);
    [repl addSublayer:layer];

    CABasicAnimation * ani = [CABasicAnimation animation];
    ani.keyPath = @"transform.scale";
    ani.fromValue = @1;
    ani.toValue = @0;
    CGFloat kDuration = 1;
    ani.duration = kDuration;
    ani.repeatCount = MAXFLOAT;
    [layer addAnimation:ani forKey:@"scaleAnimiation"];


    NSInteger count = 30;
    CGFloat angle = 2*M_PI/count;

    repl.instanceCount = count;
    repl.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    repl.instanceDelay = kDuration/count;

}

/**  音量震动条  */
- (void)setUpUI{
    [self.backImageView autoSetDimensionsToSize:CGSizeMake(200, 200)];
    [self.backImageView autoCenterInSuperview];

    CAReplicatorLayer * repl = [CAReplicatorLayer layer];
    repl.frame = self.backImageView.frame;
    [self.backImageView.layer addSublayer:repl];

    CALayer * layer = [CALayer layer];
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(15, 200);
    layer.bounds = CGRectMake(0, 0, 30, 150);
    layer.backgroundColor = [UIColor redColor].CGColor;
    CABasicAnimation * animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale.y";
    animation.toValue = @0.1;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    animation.duration = 0.5;
    [layer addAnimation:animation forKey:@"scaleAnimation"];
    [repl addSublayer:layer];
    repl.instanceCount = 5;
    repl.instanceTransform = CATransform3DMakeTranslation(40, 0, 0 );
    repl.instanceDelay = 0.1;
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

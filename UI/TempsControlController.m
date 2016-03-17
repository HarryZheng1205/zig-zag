//
//  TempsControlController.m
//  zig
//
//  Created by ZQQ on 16/3/17.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "TempsControlController.h"
#import "STDotCircleLayer.h"

@interface TempsControlController ()
{
    STDotCircleLayer * dotCircle;
    float temp;
    UILabel * tmplabel;
}
@end

@implementation TempsControlController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:CGRectMake(15*deviceScreenFacter, 30*deviceScreenFacter, 153*deviceScreenFacter, 50*deviceScreenFacter)];
    logoView.image = [UIImage imageNamed:@"zigStrIcon"];
    [self.view addSubview:logoView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, logoView.frame.origin.y+logoView.frame.size.height+30, deviceScreenWidth, 0.5)];
    line.backgroundColor = UIColorRGB(220, 220, 220);
    [self.view addSubview:line];
    
    float slidey = line.frame.origin.y+line.frame.size.height+5;
    UIImageView * arrowIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, slidey+5, 20, 20)];
    arrowIcon.image = [[UIImage imageNamed:@"zigArrowL"] imageWithTintColor:UIColorRGB(60, 60, 60)];
    [self.view addSubview:arrowIcon];
    
    UILabel *backLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, slidey, 100, 30)];
    backLabel.text = @"My Temps";
    backLabel.textColor = [UIColor lightGrayColor];
    backLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:backLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, slidey, deviceScreenWidth-30, 30)];
    titleLabel.text = @"";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    
    UIView * gestureView = [[UIView alloc] initWithFrame:CGRectMake(0, slidey, 100, 30)];
    [self.view addSubview:gestureView];
    UITapGestureRecognizer *gesture =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)];
    [gestureView addGestureRecognizer:gesture];
    
    
    
    
    dotCircle = [[STDotCircleLayer alloc] init];
    dotCircle.radius = 130;
    dotCircle.color = UIColorRGBA(255, 20, 10, 1);
    dotCircle.center = CGPointMake(deviceScreenWidth/2, slidey+(deviceScreenHeight-slidey)/2-40);
    dotCircle.shapeLayer.lineWidth =15;
    [self.view addSubview:dotCircle];
    dotCircle.progress = 0.8;
    dotCircle.layer.transform =  CATransform3DRotate(CATransform3DIdentity, M_PI*1.5, 0, 0, 1);
    
    UIImageView * iconView = [[UIImageView alloc] initWithFrame:CGRectMake(30, slidey+70, 120, 120)];
    iconView.image = [UIImage imageNamed:@"zigYe"];
    [self.view addSubview:iconView];
    
    tmplabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100*deviceScreenFacter)];
    tmplabel.textColor = UIColorRGBA(255, 20, 10, 1);
    tmplabel.font = [UIFont boldSystemFontOfSize:70];
    tmplabel.text =  @"356°f";
    tmplabel.textAlignment = NSTextAlignmentCenter;
    tmplabel.center = dotCircle.center;
    [self.view addSubview:tmplabel];
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, deviceScreenHeight-120, 50, 50)];
    [addBtn setImage:[[UIImage imageNamed:@"zigHomeAdd"] imageWithTintColor:[UIColor redColor]]  forState:UIControlStateNormal];
    [self.view addSubview:addBtn];
    [addBtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    CALayer *viewFinderLayer = [addBtn layer];
    [viewFinderLayer setMasksToBounds:YES];
    viewFinderLayer.cornerRadius = 10;
    viewFinderLayer.borderWidth=1;
    viewFinderLayer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIButton *deBtn = [[UIButton alloc] initWithFrame:CGRectMake(30+90, deviceScreenHeight-120, 50, 50)];
    [deBtn setImage:[[UIImage imageNamed:@"zigHomeDecrese"] imageWithTintColor:SCAppTintBlue]  forState:UIControlStateNormal];
    [self.view addSubview:deBtn];
    [deBtn addTarget:self action:@selector(janAction) forControlEvents:UIControlEventTouchUpInside];
    viewFinderLayer = [deBtn layer];
    [viewFinderLayer setMasksToBounds:YES];
    viewFinderLayer.cornerRadius = 10;
    viewFinderLayer.borderWidth=1;
    viewFinderLayer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [self createDefalutView];
    
    temp = 356;
   
}

-(void)onTapGesture:(UITapGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addAction
{
    temp+=10;
    if (temp>400) {
        temp = 100;
    }
    
    dotCircle.progress = temp/400;
    tmplabel.text = [NSString stringWithFormat:@"%.0f %@",temp,@"°f"];
}

-(void)janAction
{
    temp-=10;
    if (temp<10) {
        temp = 10;
    }
    
    dotCircle.progress = temp/400;
    tmplabel.text = [NSString stringWithFormat:@"%.0f %@",temp,@"°f"];
}


-(void)createDefalutView
{
    UIView *defaultView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    CALayer *viewFinderLayer = [defaultView layer];
    [viewFinderLayer setMasksToBounds:YES];
    viewFinderLayer.cornerRadius = defaultView.frame.size.width/2;
    viewFinderLayer.borderWidth=1;
    viewFinderLayer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(0,30, 120, 30)];
    namelabel.textColor = [UIColor lightGrayColor];
    namelabel.font = [UIFont boldSystemFontOfSize:30];
    namelabel.text =  @"356°f";
    namelabel.textAlignment = NSTextAlignmentCenter;
    [defaultView addSubview:namelabel];
    
    UILabel * sublabel = [[UILabel alloc] initWithFrame:CGRectMake(0,60, 120, 20)];
    sublabel.textColor = [UIColor lightGrayColor];
    sublabel.font = [UIFont boldSystemFontOfSize:16];
    sublabel.text =  @"default";
    sublabel.textAlignment = NSTextAlignmentCenter;
    [defaultView addSubview:sublabel];
    
    [self.view addSubview:defaultView];
    defaultView.center = CGPointMake(deviceScreenWidth-80, dotCircle.frame.origin.y+dotCircle.frame.size.height+50);
}

@end


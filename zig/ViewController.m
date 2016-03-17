//
//  ViewController.m
//  zig
//
//  Created by ZQQ on 16/3/3.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:CGRectMake(15*deviceScreenFacter, 30*deviceScreenFacter, 153*deviceScreenFacter, 50*deviceScreenFacter)];
    logoView.image = [UIImage imageNamed:@"zigStrIcon"];
    [self.view addSubview:logoView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, logoView.frame.origin.y+logoView.frame.size.height+30, deviceScreenWidth, 0.5)];
    line.backgroundColor = UIColorRGB(220, 220, 220);
    [self.view addSubview:line];
    
    float slidey = line.frame.origin.y+line.frame.size.height+15*deviceScreenFacter;
    
    UISlider *progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, slidey, deviceScreenWidth-100, 20)];
    [self.view addSubview:progressSlider];
    progressSlider.minimumTrackTintColor = SCAppTintBlue;
    progressSlider.value = 0.5;
    
    UIImageView * darkIcon = [[UIImageView alloc] initWithFrame:CGRectMake(25, slidey, 20, 20)];
    darkIcon.image = [[UIImage imageNamed:@"SCStoryVoiceSliderThumb"] imageWithTintColor:UIColorRGB(0, 0, 0)];
     [self.view addSubview:darkIcon];
    
    UIImageView * lightIcon = [[UIImageView alloc] initWithFrame:CGRectMake(deviceScreenWidth-45, slidey, 20, 20)];
    lightIcon.image = [[UIImage imageNamed:@"zigBrightlight"] imageWithTintColor:UIColorRGB(0, 0, 0)];
    [self.view addSubview:lightIcon];
    
    [self createControlBtn];
    [self createBottomBar];
    [self createAddView];
}


-(void)createControlBtn
{
    UIButton * batteryBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 104, 104)];
    [batteryBtn setImage:[UIImage imageNamed:@"zigBatteryFull"] forState:UIControlStateNormal];
    batteryBtn.center = CGPointMake(deviceScreenWidth/6*5, deviceScreenHeight/2-30-52);
    [self.view addSubview:batteryBtn];
    
    UIButton * mokeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 104, 104)];
    [mokeBtn setImage:[UIImage imageNamed:@"zigMoke"] forState:UIControlStateNormal];
    mokeBtn.center = CGPointMake(deviceScreenWidth/2,deviceScreenHeight/2-30-52);
    [self.view addSubview:mokeBtn];
    
    UIButton * lockBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 104, 104)];
    [lockBtn setImage:[UIImage imageNamed:@"zigLock"] forState:UIControlStateNormal];
    lockBtn.center = CGPointMake(deviceScreenWidth/6,deviceScreenHeight/2-30-52);
    [self.view addSubview:lockBtn];
    
    UILabel *batterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, deviceScreenWidth/3, 30)];
    batterLabel.text = @"BATTERY";
    batterLabel.textAlignment = NSTextAlignmentCenter;
    batterLabel.center = CGPointMake(deviceScreenWidth/6*5, deviceScreenHeight/2-15);
    [self.view addSubview:batterLabel];
    
    UILabel *mokeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, deviceScreenWidth/3, 30)];
    mokeLabel.text = @"ON";
    mokeLabel.textAlignment = NSTextAlignmentCenter;
    mokeLabel.center = CGPointMake(deviceScreenWidth/2, deviceScreenHeight/2-15);
    [self.view addSubview:mokeLabel];
    
    UILabel *lockLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, deviceScreenWidth/3, 30)];
    lockLabel.text = @"LOCK";
    lockLabel.textAlignment = NSTextAlignmentCenter;
    lockLabel.center = CGPointMake(deviceScreenWidth/6, deviceScreenHeight/2-15);
    [self.view addSubview:lockLabel];
}

-(void)createBottomBar
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(15, deviceScreenHeight-50, deviceScreenWidth-30, 0.5)];
    line.backgroundColor = UIColorRGB(220, 220, 220);
    [self.view addSubview:line];
    
    UILabel *settingsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, deviceScreenHeight-50, 100, 50)];
    settingsLabel.text = @"Settings";
    settingsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:settingsLabel];
    
    UIImageView * arrowIcon = [[UIImageView alloc] initWithFrame:CGRectMake(deviceScreenWidth-15-20, deviceScreenHeight-35, 20, 20)];
    arrowIcon.image = [[UIImage imageNamed:@"zigArrow"] imageWithTintColor:UIColorRGB(60, 60, 60)];
    [self.view addSubview:arrowIcon];
    
    UIView * gestureView = [[UIView alloc] initWithFrame:CGRectMake(0, deviceScreenHeight-50, deviceScreenWidth, 50)];
    [self.view addSubview:gestureView];
    UITapGestureRecognizer *gesture =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)];
    [gestureView addGestureRecognizer:gesture];
}

-(void)createAddView
{
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, deviceScreenHeight/2, deviceScreenWidth/4*3-15, deviceScreenHeight/2-50)];
    tempLabel.text = @"375°f";
    tempLabel.font = [UIFont systemFontOfSize:100];
    tempLabel.textAlignment = NSTextAlignmentCenter;
    tempLabel.textColor = [UIColor redColor];
    [self.view addSubview:tempLabel];
    
    float height = deviceScreenHeight/2-50;
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(deviceScreenWidth-75, deviceScreenHeight/2+height/4, 50, 50)];
    [addBtn setImage:[[UIImage imageNamed:@"zigHomeAdd"] imageWithTintColor:[UIColor redColor]]  forState:UIControlStateNormal];
    [self.view addSubview:addBtn];
    [addBtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    CALayer *viewFinderLayer = [addBtn layer];
    [viewFinderLayer setMasksToBounds:YES];
    viewFinderLayer.cornerRadius = 10;
    viewFinderLayer.borderWidth=1;
    viewFinderLayer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIButton *deBtn = [[UIButton alloc] initWithFrame:CGRectMake(deviceScreenWidth-75, deviceScreenHeight/2+height/4*3-50, 50, 50)];
    [deBtn setImage:[[UIImage imageNamed:@"zigHomeDecrese"] imageWithTintColor:SCAppTintBlue]  forState:UIControlStateNormal];
    [self.view addSubview:deBtn];
    [deBtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    viewFinderLayer = [deBtn layer];
    [viewFinderLayer setMasksToBounds:YES];
    viewFinderLayer.cornerRadius = 10;
    viewFinderLayer.borderWidth=1;
    viewFinderLayer.borderColor = [UIColor lightGrayColor].CGColor;
}

-(void)onTapGesture:(UITapGestureRecognizer *)recognizer
{

}


-(void)addAction
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

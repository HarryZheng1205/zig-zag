//
//  ZIGHomeController.m
//  zig
//
//  Created by ZQQ on 16/3/17.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ZIGHomeController.h"
#import "ZIGSettingsController.h"

@interface ZIGHomeController ()
{
    float temp;
    UILabel * tmplabel;
    
    BOOL isLock;
    BOOL isOn;
    
    UIButton * lockBtn;
    UIButton * mokeBtn;
}
@end

@implementation ZIGHomeController

- (void)viewDidLoad {
    [self.navigationController.navigationBar setHidden:YES];
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
    
    temp = 375;
    isLock = YES;
    isOn = YES;
}

-(void)lockAction
{
    isLock = !isLock;
    if (isLock) {
          [lockBtn setImage:[UIImage imageNamed:@"zigLock"] forState:UIControlStateNormal];
    }
    else
    {
    [lockBtn setImage:[UIImage imageNamed:@"zigUnLock"] forState:UIControlStateNormal];
    }
}

-(void)onAction
{
    isOn = !isOn;
    if (isOn) {
        [mokeBtn setImage:[UIImage imageNamed:@"zigMoke"]  forState:UIControlStateNormal];
    }
    else
    {
        [mokeBtn setImage:[[UIImage imageNamed:@"zigMoke"] imageWithTintColor:[UIColor blackColor]] forState:UIControlStateNormal];
    }
}


-(void)createControlBtn
{
    UIButton * batteryBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 104, 104)];
    [batteryBtn setImage:[UIImage imageNamed:@"zigBatteryFull"] forState:UIControlStateNormal];
    batteryBtn.center = CGPointMake(deviceScreenWidth/6*5, deviceScreenHeight/2-30-52);
    [self.view addSubview:batteryBtn];
    
    mokeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 104, 104)];
    [mokeBtn setImage:[UIImage imageNamed:@"zigMoke"] forState:UIControlStateNormal];
    mokeBtn.center = CGPointMake(deviceScreenWidth/2,deviceScreenHeight/2-30-52);
    [self.view addSubview:mokeBtn];
    [mokeBtn addTarget:self action:@selector(onAction) forControlEvents:UIControlEventTouchUpInside];
    
    lockBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 104, 104)];
    [lockBtn setImage:[UIImage imageNamed:@"zigLock"] forState:UIControlStateNormal];
    lockBtn.center = CGPointMake(deviceScreenWidth/6,deviceScreenHeight/2-30-52);
    [self.view addSubview:lockBtn];
    [lockBtn addTarget:self action:@selector(lockAction) forControlEvents:UIControlEventTouchUpInside];
    
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
    tmplabel = [[UILabel alloc] initWithFrame:CGRectMake(15, deviceScreenHeight/2, deviceScreenWidth/4*3-15, deviceScreenHeight/2-50)];
    tmplabel.text = @"375°f";
    tmplabel.font = [UIFont systemFontOfSize:100];
    tmplabel.textAlignment = NSTextAlignmentCenter;
    tmplabel.textColor = [UIColor redColor];
    [self.view addSubview:tmplabel];
    
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
    [deBtn addTarget:self action:@selector(janAction) forControlEvents:UIControlEventTouchUpInside];
    viewFinderLayer = [deBtn layer];
    [viewFinderLayer setMasksToBounds:YES];
    viewFinderLayer.cornerRadius = 10;
    viewFinderLayer.borderWidth=1;
    viewFinderLayer.borderColor = [UIColor lightGrayColor].CGColor;
}

-(void)onTapGesture:(UITapGestureRecognizer *)recognizer
{
    ZIGSettingsController * controller = [[ZIGSettingsController alloc] initWithNibName:@"ZIGSettingsController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)addAction
{
    temp+=1;
    if (temp>400) {
        temp = 100;
    }
    
    tmplabel.text = [NSString stringWithFormat:@"%.0f %@",temp,@"°f"];
}

-(void)janAction
{
    temp-=1;
    if (temp<10) {
        temp = 10;
    }
    
    tmplabel.text = [NSString stringWithFormat:@"%.0f %@",temp,@"°f"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

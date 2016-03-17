//
//  ZIGWarrantyController.m
//  zig
//
//  Created by ZQQ on 16/3/17.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ZIGWarrantyController.h"

@interface ZIGWarrantyController ()

@end

@implementation ZIGWarrantyController

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
    backLabel.text = @"Legal";
    backLabel.textColor = [UIColor lightGrayColor];
    backLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:backLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, slidey, deviceScreenWidth-30, 30)];
    titleLabel.text = @"Warranty";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    
    UIView * gestureView = [[UIView alloc] initWithFrame:CGRectMake(0, slidey, 100, 30)];
    [self.view addSubview:gestureView];
    UITapGestureRecognizer *gesture =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)];
    [gestureView addGestureRecognizer:gesture];
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(15, slidey+30, deviceScreenWidth-30, deviceScreenHeight-slidey-30)];
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [UIColor darkGrayColor];
    textView.text=@"Welcome to Zig-Zag’s ecommerce site zigzag.com . This Site is owned by National Tobacco Company, L.P. (NTC) and operated by NTC and/or its affiliates or contractors. We are committed to protecting the privacy of Internet users who visit our Site. This “Privacy Policy” explains the ways in which we collect, use and protect any personal information you may choose to provide through this Site. This Privacy Policy applies to NTC, as well as our subsidiaries and affiliates.If you do not agree with this Privacy Policy, please do not use this Site. Likewise, if you do not want us to communicate with you regarding our products or product promotions, please let us know here. You may also let us know your preferences through creating and updating a password protected account with us, or from time to time through selections where we ask you to either opt-in or opt-out of a communication, or the collection, use, or maintenance of any personally identifiable information about you. We endeavor to promptly comply with your requests regarding your preferences and your personally identifiable information Welcome to Zig-Zag’s ecommerce site zigzag.com . This Site is owned by National Tobacco Company, L.P. (NTC) and operated by NTC and/or its affiliates or contractors. We are committed to protecting the privacy of Internet users who visit our Site. This “Privacy Policy” explains the ways in which we collect, use and protect any personal information you may choose to provide through this Site. This Privacy Policy applies to NTC, as well as our subsidiaries and affiliates.If you do not agree with this Privacy Policy, please do not use this Site. Likewise, if you do not want us to communicate with you regarding our products or product promotions, please let us know here. You may also let us know your preferences through creating and updating a password protected account with us, or from time to time through selections where we ask you to either opt-in or opt-out of a communication, or the collection, use, or maintenance of any personally identifiable information about you. We endeavor to promptly comply with your requests regarding your preferences and your personally identifiable information";
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onTapGesture:(UITapGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

//
//  ZIGTemperatureController.m
//  zig
//
//  Created by ZQQ on 16/3/17.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ZIGTemperatureController.h"
#import "TempsControlController.h"

@interface ZIGTemperatureController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * mTableView;
}
@end

@implementation ZIGTemperatureController

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
    backLabel.text = @"Settings";
    backLabel.textColor = [UIColor lightGrayColor];
    backLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:backLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, slidey, deviceScreenWidth-30, 30)];
    titleLabel.text = @"My Temperature";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    
    UIView * gestureView = [[UIView alloc] initWithFrame:CGRectMake(0, slidey, 100, 30)];
    [self.view addSubview:gestureView];
    UITapGestureRecognizer *gesture =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)];
    [gestureView addGestureRecognizer:gesture];
    
    mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, slidey+30, deviceScreenWidth, deviceScreenHeight-slidey-30)style:UITableViewStyleGrouped] ;
    mTableView.backgroundColor = [UIColor whiteColor];
    mTableView.delegate = self;
    mTableView.dataSource = self;
    [self.view addSubview:mTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)onTapGesture:(UITapGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 100*deviceScreenFacter;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int row = 1;
    switch (section) {
        case 0:
            row =3;
            break;
        default:
            break;
    }
    return row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"AboutCell";
    UITableViewCell *cell = nil;
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.backgroundColor = [UIColor whiteColor];
    
    UIImageView * iconView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 100*deviceScreenFacter-40, 100*deviceScreenFacter-40)];
    [cell.contentView addSubview:iconView];
    
    UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(deviceScreenWidth-200, 0, 150, 100*deviceScreenFacter)];
    namelabel.textColor = [UIColor blackColor];
    namelabel.font = [UIFont boldSystemFontOfSize:40];
    namelabel.text =  @"Highest speed";
    namelabel.textAlignment = NSTextAlignmentRight;
    [cell.contentView addSubview:namelabel];
    
    
    UIImageView * arrowIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    arrowIcon.image = [[UIImage imageNamed:@"zigArrow"] imageWithTintColor:UIColorRGB(100, 100, 100)];
    cell.accessoryView = arrowIcon;
    
    
    switch (indexPath.row) {
        case 0:
        {
            namelabel.text =  @"325°f";
            iconView.image = [UIImage imageNamed:@"zigYe"];
        }
            break;
        case 1:
        {
            namelabel.text =  @"356°f";
            iconView.image = [UIImage imageNamed:@"zigFlower"];
        }
            break;
        case 2:
        {
            namelabel.text =  @"356°f";
            iconView.image = [UIImage imageNamed:@"zigWaterDot"];
        }
            break;
        default:
            break;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TempsControlController * controller = [[TempsControlController alloc] initWithNibName:@"TempsControlController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

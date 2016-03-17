//
//  ZIGSettingsController.m
//  zig
//
//  Created by ZQQ on 16/3/17.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ZIGSettingsController.h"
#import "ZIGSoundsController.h"
#import "SIGLedController.h"
#import "ZIGScreenColorController.h"
#import "ZIGGeneralController.h"
#import "ZIGTemperatureController.h"
@interface ZIGSettingsController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * mTableView;
}
@end

@implementation ZIGSettingsController

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
    backLabel.text = @"Home";
    backLabel.textColor = [UIColor lightGrayColor];
    backLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:backLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, slidey, deviceScreenWidth-30, 30)];
    titleLabel.text = @"Settings";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    
    UIView * gestureView = [[UIView alloc] initWithFrame:CGRectMake(0, slidey, 100, 50)];
    [self.view addSubview:gestureView];
    UITapGestureRecognizer *gesture =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)];
    [gestureView addGestureRecognizer:gesture];
    
    mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, slidey+40, deviceScreenWidth, deviceScreenHeight-slidey-40)style:UITableViewStyleGrouped] ;
    mTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
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


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    v.backgroundColor = [UIColor clearColor];
    
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    return 44*deviceScreenFacter;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int row = 1;
    switch (section) {
        case 0:
            row = 4;
            break;
        case 1:
            row = 3;
            break;
        case 2:
            row = 1;
            break;
        default:
            break;
    }
    return row;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger numberOfSections=3;
    return numberOfSections;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    float headerHeight = 20;
    
    return headerHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"SettingsCell";
    UITableViewCell *cell = nil;
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.backgroundColor = [UIColor whiteColor];
    
    UILabel * namelabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 150,  44*deviceScreenFacter)];
    namelabel.textColor = [UIColor blackColor];
    namelabel.font = [UIFont boldSystemFontOfSize:17];
    namelabel.text =  @"Highest speed";
    namelabel.textAlignment = NSTextAlignmentLeft;
    [cell.contentView addSubview:namelabel];
    
    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(deviceScreenWidth-200, 0, 150, 44*deviceScreenFacter)];
    subTitleLabel.font = [UIFont systemFontOfSize:16];
    subTitleLabel.textAlignment = NSTextAlignmentRight;
    subTitleLabel.textColor = [UIColor darkGrayColor];
    [cell.contentView addSubview:subTitleLabel];
    
    switch (indexPath.section) {
        case 0:
        {
            subTitleLabel.text = @"";
            switch (indexPath.row) {
                case 0:
                {
                    namelabel.text =  @"Power Mode";
                      UISwitch *switchBtn  = [[UISwitch alloc] init];
                     cell.accessoryView = switchBtn;
                }
                    break;
                case 1:
                {
                    namelabel.text =  @"Vibration";
                    cell.accessoryView = nil;
                }
                    break;
                case 2:
                {
                    namelabel.text =  @"Sounds";
                    UISwitch *switchBtn  = [[UISwitch alloc] init];
                    cell.accessoryView = switchBtn;
                }
                    break;
                case 3:
                {
                    namelabel.text =  @"Sounds Selections";
                    UIImageView * arrowIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
                    arrowIcon.image = [[UIImage imageNamed:@"zigArrow"] imageWithTintColor:UIColorRGB(100, 100, 100)];
                     cell.accessoryView = arrowIcon;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            UIImageView * arrowIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            arrowIcon.image = [[UIImage imageNamed:@"zigArrow"] imageWithTintColor:UIColorRGB(100, 100, 100)];
            cell.accessoryView = arrowIcon;
            switch (indexPath.row) {
                case 0:
                {
                    namelabel.text =  @"LedLight";
                     subTitleLabel.text = @"Puple";
                }
                    break;
                case 1:
                {
                    namelabel.text =  @"Screen Colors";
                    subTitleLabel.text = @"Silvery White";
                }
                    break;
                case 2:
                {
                    namelabel.text =  @"My Temperature";
                    subTitleLabel.text = @"";
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            UIImageView * arrowIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            arrowIcon.image = [[UIImage imageNamed:@"zigArrow"] imageWithTintColor:UIColorRGB(100, 100, 100)];
            cell.accessoryView = arrowIcon;
            
            namelabel.text =  @"General";
            subTitleLabel.text = @"";
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
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                
                }
                    break;
                case 1:
                {
                    
                }
                    break;
                case 3:
                {
                    [self gotoSoundsController];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [self gotoLedController];
                }
                    break;
                case 1:
                {
                     [self gotoScreenColorController];
                }
                    break;
                case 2:
                {
                     [self gotoTempController];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            [self gotoGeneralController];
        }
            break;
        default:
            break;
    }
    
}


-(void)gotoSoundsController
{
    ZIGSoundsController * controller = [[ZIGSoundsController alloc] initWithNibName:@"ZIGSoundsController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)gotoLedController
{
    SIGLedController * controller = [[SIGLedController alloc] initWithNibName:@"SIGLedController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)gotoScreenColorController
{
    ZIGScreenColorController * controller = [[ZIGScreenColorController alloc] initWithNibName:@"ZIGScreenColorController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)gotoGeneralController
{
    ZIGGeneralController * controller = [[ZIGGeneralController alloc] initWithNibName:@"ZIGGeneralController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)gotoTempController
{
    ZIGTemperatureController * controller = [[ZIGTemperatureController alloc] initWithNibName:@"ZIGTemperatureController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

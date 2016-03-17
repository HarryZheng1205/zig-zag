//
//  ZIGSoundsController.m
//  zig
//
//  Created by ZQQ on 16/3/17.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ZIGSoundsController.h"

@interface ZIGSoundsController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * mTableView;
}
@end

@implementation ZIGSoundsController

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
    titleLabel.text = @"Sounds";
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


-(void)onTapGesture:(UITapGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section !=0) {
        return 30*deviceScreenFacter;
    }
    return 0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 && indexPath.row ==0) {
         return 60;
    }
    return 44*deviceScreenFacter;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int row = 1;
    switch (section) {
        case 0:
            row = 1;
            break;
        case 1:
            row =5;
            break;
        case 2:
            row = 5;
            break;
        default:
            break;
    }
    return row;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30*deviceScreenFacter)];
    view.backgroundColor = [UIColor clearColor];
    
    if(section == 0)
        return view;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, deviceScreenWidth, 30*deviceScreenFacter)];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:17];
    switch (section) {
        case 1:
            label.text = @"At Temperature";
            break;
        case 2:
            label.text = @"Heat Cycle Ends";
            break;
        default:
            break;
    }
    
    [view addSubview:label];
    
    return view;
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
    
    switch (indexPath.section) {
            case 0:
        {
            namelabel.hidden = YES;
            float slidey = 20;
            
            UISlider *progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, slidey, deviceScreenWidth-100, 20)];
            [cell.contentView addSubview:progressSlider];
            progressSlider.minimumTrackTintColor = SCAppTintBlue;
            progressSlider.value = 0.5;
            
            UIImageView * darkIcon = [[UIImageView alloc] initWithFrame:CGRectMake(25, slidey, 20, 20)];
            darkIcon.image = [[UIImage imageNamed:@"sigSoundsMute"] imageWithTintColor:UIColorRGB(0, 0, 0)];
            [cell.contentView addSubview:darkIcon];
            
            UIImageView * lightIcon = [[UIImageView alloc] initWithFrame:CGRectMake(deviceScreenWidth-45, slidey, 20, 20)];
            lightIcon.image = [[UIImage imageNamed:@"sigSoundsBig"] imageWithTintColor:UIColorRGB(0, 0, 0)];
            [cell.contentView addSubview:lightIcon];
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    namelabel.text =  @"Clapping";
                }
                    break;
                case 1:
                {
                    namelabel.text =  @"Rocket Blast";
                }
                    break;
                case 2:
                {
                    namelabel.text =  @"And They're Off";
                }
                    break;
                case 3:
                {
                    namelabel.text =  @"Wind Chimes";
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                }
                    break;
                case 4:
                {
                    namelabel.text =  @"Choo Choo";
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {

            switch (indexPath.row) {
                case 0:
                {
                    namelabel.text =  @"Booing";
                }
                    break;
                case 1:
                {
                    namelabel.text =  @"Deflated Ballon";
                }
                    break;
                case 2:
                {
                    namelabel.text =  @"Wind Chimes";
                }
                    break;
                case 3:
                {
                    namelabel.text =  @"Lullabye";
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                }
                    break;
                case 4:
                {
                    namelabel.text =  @"Car Brake";
                }
                    break;

                default:
                    break;
            }
        }
            break;

        default:
            break;
    }

    
    return cell;
}

@end

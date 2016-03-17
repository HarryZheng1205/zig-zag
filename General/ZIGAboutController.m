//
//  ZIGAboutController.m
//  zig
//
//  Created by ZQQ on 16/3/17.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ZIGAboutController.h"
#import "ZIGLegalController.h"

@interface ZIGAboutController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * mTableView;
}
@end

@implementation ZIGAboutController

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
    backLabel.text = @"General";
    backLabel.textColor = [UIColor lightGrayColor];
    backLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:backLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, slidey, deviceScreenWidth-30, 30)];
    titleLabel.text = @"About";
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
    // Dispose of any resources that can be recreated.
}


-(void)onTapGesture:(UITapGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:YES];
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
    return 1;
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
            row =4;
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
    
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"AboutCell";
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
    
    
    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(deviceScreenWidth-170, 0, 150, 44*deviceScreenFacter)];
    subTitleLabel.font = [UIFont systemFontOfSize:16];
    subTitleLabel.textAlignment = NSTextAlignmentRight;
    subTitleLabel.textColor = [UIColor darkGrayColor];
    [cell.contentView addSubview:subTitleLabel];
    
    switch (indexPath.row) {
        case 0:
        {
            namelabel.text =  @"Serial Number";
            subTitleLabel.text =  @"ZZ1234560345";
        }
            break;
        case 1:
        {
            namelabel.text =  @"Mode";
            subTitleLabel.text =  @"trdrp-350";
        }
            break;
        case 2:
        {
            namelabel.text =  @"Bluetooth";
            subTitleLabel.text =  @"teardrop1";
        }
            break;
        case 3:
        {
            namelabel.text =  @"legal";
            subTitleLabel.text =  @"";
            UIImageView * arrowIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            arrowIcon.image = [[UIImage imageNamed:@"zigArrow"] imageWithTintColor:UIColorRGB(100, 100, 100)];
            cell.accessoryView = arrowIcon;
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
            [self gotoLegalController];
        }
            break;
        default:
            break;
    }
}


-(void)gotoLegalController
{
    ZIGLegalController * controller = [[ZIGLegalController alloc] initWithNibName:@"ZIGLegalController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}


@end

//
//  ZMLotteryVCViewController.m
//  Chapper
//
//  Created by liyongfei on 2017/11/7.
//  Copyright © 2017年 liyongfei. All rights reserved.
//

#import "ZMLotteryVCViewController.h"
#import <MJRefresh.h>
#import "ZMTreatureCollectionViewCell.h"
#import "ZMGoodsVC.h"
@interface ZMLotteryVCViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ZMLotteryVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
//    self.view.frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight);
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0.5;
    layout.minimumLineSpacing = 0.5;
    [layout setSectionInset:UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5)];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight - self.tabBarController.tabBar.bounds.size.height) collectionViewLayout:layout];
    layout.minimumInteritemSpacing = 0.5;
    layout.minimumLineSpacing = 0.5;
    [layout setSectionInset:UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5)];
    
    [collectionView setBackgroundColor:kSmallGray];
    [self.view addSubview:collectionView];
    [collectionView setDelegate:self];
    [collectionView setDataSource:self];
    
    //    _dataArr = [[NSMutableArray alloc]init];
    collectionView.height = kDeviceHeight;
    
    //    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    MJRefreshAutoNormalFooter* footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(poseHttpData)];
    
    [footer setTitle:@"点击或者上拉刷新" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"---没有更多数据---" forState:MJRefreshStateNoMoreData];
    [footer setTitle:@"松开开始加载" forState:MJRefreshStatePulling];
    collectionView.mj_footer.hidden = YES;
    collectionView.mj_footer = footer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((float)(kDeviceWidth) * 0.5 - 1, kDeviceWidth * 0.5 * 1.2) ;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifi = @"TreatureCollectionCell";
    
    UINib *nib = [UINib nibWithNibName:@"ZMTreatureCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:cellIndentifi];
    
    ZMTreatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifi forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.5;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.5;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZMGoodsVC *goodVC = [[ZMGoodsVC alloc] init];
    NSLog(@"<测试>按钮点击");
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:goodVC];
    
    [self presentViewController:nav animated:NO completion:nil];
    //    [self.owner.navigationController pushViewController:goodVC animated:NO];
}

@end

//
//  ViewController.m
//  WXJCollectionView
//
//  Created by MrWXJ on 2018/6/11.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

#import "ViewController.h"
#import "WXJCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WXJCollectionView *collectionView = [[WXJCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) scrollDirection:ScrollDirectionVertical numberOfSections:nil numberOfItemsInSection:^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
        return 10;
    } sizeForItemAtIndexPath:^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull collectionViewLayout, NSIndexPath * _Nonnull indexPath) {
        return CGSizeMake(100, 60);
    } insetForSectionAtIndex:^UIEdgeInsets(UICollectionView * _Nullable collectionView, UICollectionViewLayout * _Nullable collectionViewLayout, NSInteger section) {
        return UIEdgeInsetsMake(5, 5, 5, 5);
    } minimunInteritemSpacing:^CGFloat(UICollectionView * _Nullable collectionView, UICollectionViewLayout * _Nullable collectionViewLayout, NSInteger section) {
        return 5;
    } minimumLineSpacing:^CGFloat(UICollectionView * _Nullable collectionView, UICollectionViewLayout * _Nullable collectionViewLayout, NSInteger section) {
        return 5;
    } supplementrayElementOfKind:nil cellForItemAtIndexPath:^UICollectionViewCell * _Nonnull(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        return cell;
    } didSelectItemAtIndexPath:^(UICollectionView * _Nullable collectionView, NSIndexPath * _Nullable indexPath) {
        NSLog(@"点击了第%ld个cell",indexPath.row + 1);
    }];
    [collectionView showInView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

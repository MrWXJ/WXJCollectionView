//
//  WXJCollectionView.h
//  WXJ_All_Code
//
//  Created by WXJ on 2018/5/14.
//  Copyright © 2018年 WXJ. All rights reserved.
//

/**
 UICollectionView的封装
 */

#import <UIKit/UIKit.h>

#pragma 设置个数

/**
 设置collectionView的分区数

 @param collectionView collectionView
 @return 返回分区数
 */
typedef NSInteger(^NumberOfSections)(UICollectionView * _Nullable collectionView);

/**
 设置每个分区的item的个数

 @param collectionView collectionView
 @param section section 分区
 @return 返回item个数
 */
typedef NSInteger(^NumberOfItemsInSection)(UICollectionView * _Nonnull collectionView,NSInteger section);

#pragma 设置尺寸

/**
 设置item的宽高

 @param collectionView collectionView
 @param collectionViewLayout collectionViewLayout
 @param indexPath indexPath
 @return 返回item的宽高
 */
typedef CGSize(^SizeForItemAtIndexPath)(UICollectionView * _Nonnull collectionView,UICollectionViewLayout * _Nonnull collectionViewLayout,NSIndexPath * _Nonnull indexPath);

/**
 设置上左下右边距

 @param collectionView collectionView
 @param collectionViewLayout layout
 @param section 分区
 @return 返回上、左、下、右的值
 */
typedef UIEdgeInsets(^InsetForSectionAtIndex)(UICollectionView * _Nullable collectionView,UICollectionViewLayout * _Nullable collectionViewLayout,NSInteger section);

#pragma 设置间距

/**
 设置列间距

 @param collectionView collectionView
 @param collectionViewLayout collectionViewLayout
 @param section 分区
 @return 返回列间距的尺寸
 */
typedef CGFloat(^MinimunInteritemSpacing)(UICollectionView * _Nullable collectionView,UICollectionViewLayout * _Nullable collectionViewLayout,NSInteger section);

/**
 设置行间距

 @param collectionView collectionView
 @param collectionViewLayout collectionViewLayout
 @param section 分区
 @return 返回行间距的尺寸
 */
typedef CGFloat(^MinimumLineSpacing)(UICollectionView * _Nullable collectionView,UICollectionViewLayout * _Nullable collectionViewLayout,NSInteger section);

#pragma 设置辅助视图

/**
 设置头/尾部视图

 @param collectionView collectionView
 @param kind kind
 @param indexPath indexPath值
 @return 返回头/尾部视图
 */
typedef UICollectionReusableView *_Nullable(^SupplementrayElementOfKind)(UICollectionView * _Nullable collectionView,NSString * _Nullable kind,NSIndexPath * _Nullable indexPath);

#pragma 主视图Cell

/**
 设置UICollectionViewCell视图

 @param collectionView collectionView
 @param indexPath indexPath
 @return UICollectionViewCell
 */
typedef UICollectionViewCell *_Nonnull(^CellForItemAtIndexPath)(UICollectionView * _Nonnull collectionView,NSIndexPath * _Nonnull indexPath);

#pragma 点击cell

/**
 点击cell的操作

 @param collectionView collectionView
 @param indexPath indexPath
 */
typedef void(^DidSelectItemAtIndexPath)(UICollectionView * _Nullable collectionView,NSIndexPath * _Nullable indexPath);


enum ScrollDirection {
    ScrollDirectionVertical = 1,
    ScrollDirectionHorizontal = 2
};

@interface WXJCollectionView : UIView

/**
 初始化WXJCollectionView
 
 @param frame 尺寸
 @param scrollDirection 滑动方法
 @param numberOfSections 分区
 @param numberOfItemsInSection 个数
 @param sizeForItemAtIndexPath item尺寸
 @param insetForSectionAtIndex 边距
 @param minimunInteritemSpacing 纵向间距
 @param minimumLineSpacing 行间距
 @param supplementrayElementOfKind 头/尾部视图
 @param cellForItemAtIndexPath cell
 @param didSelectItemAtIndexPath 点击事件
 @return WXJCollectionView
 */
- (instancetype _Nonnull )initWithFrame:(CGRect)frame
              scrollDirection:(enum ScrollDirection)scrollDirection
                       numberOfSections:(NumberOfSections _Nullable )numberOfSections
                 numberOfItemsInSection:(NumberOfItemsInSection _Nonnull )numberOfItemsInSection
                 sizeForItemAtIndexPath:(SizeForItemAtIndexPath _Nonnull )sizeForItemAtIndexPath
                 insetForSectionAtIndex:(InsetForSectionAtIndex _Nullable )insetForSectionAtIndex
                minimunInteritemSpacing:(MinimunInteritemSpacing _Nullable )minimunInteritemSpacing
                     minimumLineSpacing:(MinimumLineSpacing _Nullable )minimumLineSpacing
             supplementrayElementOfKind:(SupplementrayElementOfKind _Nullable )supplementrayElementOfKind
                 cellForItemAtIndexPath:(CellForItemAtIndexPath _Nonnull )cellForItemAtIndexPath
               didSelectItemAtIndexPath:(DidSelectItemAtIndexPath _Nullable )didSelectItemAtIndexPath;

/**
 注册头部或尾部
 
 @param cellClass cellClass
 @param kind kind
 @param identifier identifier
 */
- (void)registerClass:(nullable Class)cellClass forSupplementaryViewOfKind:(nonnull NSString *)kind
  withReuseIdentifier:(nonnull NSString *)identifier;

/**
 注册cell
 
 @param cellClass cellClass
 @param identifier identifier
 */
- (void)registerClass:(nullable Class)cellClass
forCellWithReuseIdentifier:(nonnull NSString *)identifier;

/**
 设置头部视图的规格
 
 @param width width
 @param height height
 */
- (void)addHeaderReferenceSize:(CGFloat)width
                        height:(CGFloat)height;

/**
 设置尾部视图的规格
 
 @param width width
 @param height height
 */
- (void)addFooterReferenceSize:(CGFloat)width
                        height:(CGFloat)height;

@property(nonatomic) BOOL showsVerticalScrollIndicator;
@property(nonatomic) BOOL showsHorizontalScrollIndicator;

@property (nonatomic,strong) UIColor * _Nullable backgroundColor;
@property (nonatomic,strong) UICollectionViewFlowLayout * _Nullable layout;
@property (nonatomic,strong) UICollectionView * _Nullable collectionView;

/**
 显示CollectionView
 
 @param view 要显示在的view
 */
- (void)showInView:(UIView *_Nonnull)view;

/**
 刷新
 */
- (void)reloadData;


@end

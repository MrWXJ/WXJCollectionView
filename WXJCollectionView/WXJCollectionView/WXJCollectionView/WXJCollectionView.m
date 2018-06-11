//
//  WXJCollectionView.m
//  WXJ_All_Code
//
//  Created by WXJ on 2018/5/14.
//  Copyright © 2018年 WXJ. All rights reserved.
//

#import "WXJCollectionView.h"

@interface WXJCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) NumberOfSections numberOfSections;
@property (nonatomic,strong) NumberOfItemsInSection
numberOfItemsInSection;
@property (nonatomic,strong) SizeForItemAtIndexPath
sizeForItemAtIndexPath;
@property (nonatomic,strong) InsetForSectionAtIndex
insetForSectionAtIndex;
@property (nonatomic,strong) MinimunInteritemSpacing
minimunInteritemSpacing;
@property (nonatomic,strong) MinimumLineSpacing
minimumLineSpacing;
@property (nonatomic,strong) SupplementrayElementOfKind
supplementrayElementOfKind;
@property (nonatomic,strong)CellForItemAtIndexPath
cellForItemAtIndexPath;
@property (nonatomic,strong)DidSelectItemAtIndexPath
didSelectItemAtIndexPath;

@property (nonatomic,assign) float scrollDirection;

@end

@implementation WXJCollectionView

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
               didSelectItemAtIndexPath:(DidSelectItemAtIndexPath _Nullable )didSelectItemAtIndexPath {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor orangeColor];
    if (self) {
        self.numberOfSections = numberOfSections;
        self.numberOfItemsInSection = numberOfItemsInSection;
        self.sizeForItemAtIndexPath = sizeForItemAtIndexPath;
        self.insetForSectionAtIndex = insetForSectionAtIndex;
        self.minimunInteritemSpacing = minimunInteritemSpacing;
        self.minimumLineSpacing = minimumLineSpacing;
        self.supplementrayElementOfKind = supplementrayElementOfKind;
        self.cellForItemAtIndexPath = cellForItemAtIndexPath;
        self.didSelectItemAtIndexPath = didSelectItemAtIndexPath;
        
        self.scrollDirection = scrollDirection;
        
        [self buildCollectionView];
    }
    return self;
}

- (void)buildCollectionView {
    //设置方向
    _layout = [[UICollectionViewFlowLayout alloc] init];
    if (self.scrollDirection == 1) {
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    } else {
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    //创建
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //永远允许滑动
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.backgroundColor = [UIColor yellowColor];
    //隐藏滚动条
    _collectionView.showsVerticalScrollIndicator = NO;
    [self addSubview:_collectionView];
}

#pragma 代理方法

//分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.numberOfSections) {
        return self.numberOfSections(collectionView);
    } else {
        return 1;
    }
}

//个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.numberOfItemsInSection) {
        return self.numberOfItemsInSection(collectionView, section);
    } else {
        return 0;
    }
}

//设置尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sizeForItemAtIndexPath) {
        return self.sizeForItemAtIndexPath(collectionView, collectionViewLayout, indexPath);
    } else {
        return CGSizeMake(0, 0);
    }
}

//设置上左下右
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (self.insetForSectionAtIndex) {
        return self.insetForSectionAtIndex(collectionView, collectionViewLayout, section);
    } else {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

//纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (self.minimunInteritemSpacing) {
        return self.minimunInteritemSpacing(collectionView, collectionViewLayout, section);
    } else {
        return 5;
    }
}

//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (self.minimumLineSpacing) {
        return self.minimumLineSpacing(collectionView, collectionViewLayout, section);
    } else {
        return 5;
    }
}

//头/尾部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (self.supplementrayElementOfKind) {
        return self.supplementrayElementOfKind(collectionView, kind, indexPath);
    } else {
        return nil;
    }
}

//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellForItemAtIndexPath) {
        return self.cellForItemAtIndexPath(collectionView, indexPath);
    } else {
        return nil;
    }
}

//点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectItemAtIndexPath) {
        self.didSelectItemAtIndexPath(collectionView, indexPath);
    }
}

//UICollectionElementKindSectionFooter
//UICollectionElementKindSectionHeader
/**
 注册头部或尾部

 @param cellClass cellClass
 @param kind kind
 @param identifier identifier
 */
- (void)registerClass:(nullable Class)cellClass forSupplementaryViewOfKind:(nonnull NSString *)kind
     withReuseIdentifier:(nonnull NSString *)identifier {
    [_collectionView registerClass:cellClass forSupplementaryViewOfKind:kind withReuseIdentifier:identifier];
}

/**
 注册cell

 @param cellClass cellClass
 @param identifier identifier
 */
- (void)registerClass:(nullable Class)cellClass
forCellWithReuseIdentifier:(nonnull NSString *)identifier {
    [_collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

/**
 显示CollectionView

 @param view 要显示在的view
 */
- (void)showInView:(UIView *)view {
    dispatch_async(dispatch_get_main_queue(), ^{
        [view addSubview:_collectionView];
    });
}

/**
 刷新
 */
- (void)reloadData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [_collectionView reloadData];
    });
}

/**
 设置头部视图的规格

 @param width width
 @param height height
 */
- (void)addHeaderReferenceSize:(CGFloat)width
                        height:(CGFloat)height {
    _layout.headerReferenceSize = CGSizeMake(width, height);
}

/**
 设置尾部视图的规格
 
 @param width width
 @param height height
 */
- (void)addFooterReferenceSize:(CGFloat)width
                        height:(CGFloat)height {
    _layout.footerReferenceSize = CGSizeMake(width, height);
}

/**
 设置背景颜色

 @param backgroundColor 即将要设的背景色
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _collectionView.backgroundColor = backgroundColor;
}

/**
 setShowsVerticalScrollIndicator

 @param showsVerticalScrollIndicator showsVerticalScrollIndicator
 */
- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator {
    _collectionView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
}

/**
 setShowsHorizontalScrollIndicator

 @param showsHorizontalScrollIndicator showsHorizontalScrollIndicator
 */
- (void)setShowsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator {
    _collectionView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
}


@end

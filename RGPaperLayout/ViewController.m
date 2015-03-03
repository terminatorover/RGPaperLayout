//
//  ViewController.m
//  RGPaperLayout
//
//  Created by ROBERA GELETA on 2/25/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//
#define REUSE_ID @"reuse"

#import "ViewController.h"
#import "RGCollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray *listOfData;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *mainImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.listOfData = [@[@"climb",@"ice",@"lake",@"shark",@"whale",@"climb",@"ice",@"lake",@"shark",@"whale",@"climb",@"ice",@"lake",@"shark",@"whale"]mutableCopy];
    
    [self setupEffectImage:[UIImage imageNamed:@"climb"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Blur Effect Helper Method

- (void)setupEffectImage:(UIImage *)effectImage {
    //---> setting up the look of the collection View + the main View
    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    effectView.frame = self.collectionView.bounds;
    
    self.imageView = [[UIImageView alloc]initWithFrame:self.collectionView.bounds];
    self.imageView.image = effectImage;
    
    UIView *viewFrame = [[UIView alloc]initWithFrame:self.collectionView.bounds];
    [viewFrame addSubview:self.imageView];
    [viewFrame addSubview:effectView];
    
    self.collectionView.backgroundView = viewFrame;
    
    UIVisualEffectView *mainEffectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    mainEffectView.frame = self.view.bounds;
    
    self.mainImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    self.mainImageView.image = effectImage;
    
    UIView *mainViewFrame = [[UIView alloc] initWithFrame:self.view.bounds];
    [mainViewFrame addSubview:self.mainImageView];
    [mainViewFrame addSubview:mainEffectView];
    
    [self.view insertSubview:mainViewFrame belowSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  self.listOfData.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RGCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:REUSE_ID forIndexPath:indexPath];
    
    [self configureCell:cell forItemAtIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self selectedItemAtIndexPath:indexPath];
}

- (void)selectedItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *nameOfImage = self.listOfData[indexPath.section];
    self.imageView.image = [UIImage imageNamed:nameOfImage];
    self.mainImageView.image = [UIImage imageNamed:nameOfImage];
}

- (void)configureCell:(RGCollectionViewCell *)cell
   forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *nameOfImage = self.listOfData[indexPath.section];
    cell.imageView.image = [UIImage imageNamed:nameOfImage];
    cell.label.text = nameOfImage;
}

@end

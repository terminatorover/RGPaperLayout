//
//  RGPapersLayout.m
//  RGPapersLayout
//
//  Created by ROBERA GELETA on 2/23/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//



#import "RGPaperLayout.h"

@implementation RGPaperLayout
{
    CGFloat previousOffset;
    CGFloat _visibleRectWidth;
    
}
@synthesize maxAngle = _maxAngle;

- (void)prepareLayout {
    [super prepareLayout];
    [self setupLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}


- (void)setupLayout
{
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.width /2.7, self.collectionView.bounds.size.height/1.5);
    _visibleRectWidth = self.collectionView.bounds.size.width;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled  = NO;
}



- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attribs = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    CGFloat collectionViewHeight = self.collectionView.bounds.size.height/1.9;
    
    for (UICollectionViewLayoutAttributes *attributes in attribs) {
        if (CGRectIntersectsRect(attributes.frame, rect))
        {
            CGFloat cardX = attributes.center.x;
            CGFloat distance =  self.collectionView.contentOffset.x + (1/2.0 * _visibleRectWidth);
            CGFloat computedOffset = cardX  - distance;
            
            CGFloat fractionComputedOffset = computedOffset /(attributes.bounds.size.width /17.0);
            CGFloat fraction = computedOffset/ attributes.bounds.size.width;
            
            fraction = [self allowedRadian:fraction];
            CGFloat offset = fabsf((fractionComputedOffset)* (1 - fabsf(cosf(fraction))));
            CGFloat yComputedOffset = collectionViewHeight + offset;
            attributes.center = CGPointMake(attributes.center.x, yComputedOffset + 0.4*(collectionViewHeight));
            
            //transform
            attributes.transform3D  = [self transformFromFraction:fraction];
            
            
            
        }
    }
    
    return attribs;
}

- (CGFloat)allowedRadian:(CGFloat)angle
{
    if(angle > M_PI/2)
    {
        angle = M_PI/2;
    }else if (angle < (-1 *M_PI/2))
    {
        angle = -1 * M_PI /2;
    }
    return angle;
    
}


- (CATransform3D)transformFromFraction:(CGFloat)fraction
{
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/-500;
    CGFloat radianFraction = fraction * self.maxAngle;
    t = CATransform3DRotate(t, radianFraction, 0, 0, 1);
    return t;
}

- (CGRect)newYCenterFromFraction:(CGFloat)fraction
{
    CGRect newY;
    
    return newY;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}



#pragma mark - Lazy Loading
- (void)setMaxAngle:(CGFloat)maxAngle
{
    _maxAngle = maxAngle;
    [self invalidateLayout];
}


- (CGFloat)maxAngle
{
    if(_maxAngle == 0)
    {
        _maxAngle = 0.15;
    }
    return _maxAngle;
}


@end

//
//  RGCollectionViewCell.m
//  RGPaperLayout
//
//  Created by ROBERA GELETA on 2/25/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import "RGCollectionViewCell.h"

@implementation RGCollectionViewCell
- (void)awakeFromNib
{
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.layer.cornerRadius = 10;

}
@end

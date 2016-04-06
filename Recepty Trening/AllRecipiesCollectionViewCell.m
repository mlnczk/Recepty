//
//  AllRecipiesCollectionViewCell.m
//  Recepty Trening
//
//  Created by Rafal Kampa on 06.04.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "AllRecipiesCollectionViewCell.h"


@interface AllRecipiesCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end
@implementation AllRecipiesCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
-(void)customizeWithTitle:(NSString *)title name:(NSString *)name{
    self.labelTitle.text = name;
    self.imageView.image = [UIImage imageNamed:title];
}


@end

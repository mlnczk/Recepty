//
//  RecipiesListCell.m
//  Recepty Trening
//
//  Created by Rafal Kampa on 06.04.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "RecipiesListCell.h"
@interface RecipiesListCell()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageRecipe;


@end
@implementation RecipiesListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)customizeWithTitle:(NSString *)title name:(NSString *)name{
    self.labelTitle.text = name;
    self.imageRecipe.image = [UIImage imageNamed:title];
}
@end

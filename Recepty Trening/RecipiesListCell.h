//
//  RecipiesListCell.h
//  Recepty Trening
//
//  Created by Rafal Kampa on 06.04.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cellDelegate <NSObject>

-(void)sendLabelText;


@end

@interface RecipiesListCell : UITableViewCell
@property (nonatomic, weak)id<cellDelegate>delegate;

-(void)customizeWithTitle:(NSString *)title name:(NSString *)name;


@end

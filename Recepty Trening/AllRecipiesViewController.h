//
//  AllRecipiesViewController.h
//  Recepty Trening
//
//  Created by Rafal Kampa on 06.04.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllRecipiesViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)NSArray *nameArray;
@property (nonatomic, strong)NSArray *titleArray;


@end

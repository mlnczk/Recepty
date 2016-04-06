//
//  AllRecipiesViewController.m
//  Recepty Trening
//
//  Created by Rafal Kampa on 06.04.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "AllRecipiesViewController.h"
#import "AllRecipiesCollectionViewCell.h"

@interface AllRecipiesViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation AllRecipiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //REJESTROWANIE XIB
     [self.collectionView registerNib:[UINib nibWithNibName:[[AllRecipiesCollectionViewCell class] description] bundle:nil] forCellWithReuseIdentifier:[[AllRecipiesCollectionViewCell class] description]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.nameArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AllRecipiesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[[AllRecipiesCollectionViewCell class]description] forIndexPath:indexPath];
    [cell customizeWithTitle:self.titleArray[indexPath.item] name:self.nameArray[indexPath.item]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.frame.size.width , self.collectionView.frame.size.height );
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

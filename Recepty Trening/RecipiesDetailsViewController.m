//
//  RecipiesDetailsViewController.m
//  Recepty Trening
//
//  Created by Rafal Kampa on 06.04.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "RecipiesDetailsViewController.h"

@interface RecipiesDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end

@implementation RecipiesDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelTitle.text = self.selectedName;
    self.imageView.image = [UIImage imageNamed:self.selectedTitle];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

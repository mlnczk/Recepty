//
//  RecipiesListViewController.m
//  Recepty Trening
//
//  Created by Rafal Kampa on 06.04.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "RecipiesListViewController.h"
#import "RecipiesListCell.h"

@interface RecipiesListViewController ()
@property (nonatomic, strong)NSArray *recipesArray;
@property (weak, nonatomic) IBOutlet UILabel *recipesTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *namesArray;


@end

@implementation RecipiesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // ***WAZNE*** REJESTROWANIE XIBA
    
    [self.tableView registerNib:[UINib nibWithNibName:[[RecipiesListCell class] description] bundle:nil] forCellReuseIdentifier:[[RecipiesListCell class]description]];

    self.recipesArray = [[NSArray alloc] initWithObjects:@"recipe1", @"recipe2", @"recipe3", @"recipe4", @"recipe5", nil];
    
    self.namesArray = [[NSArray alloc] initWithObjects:@"Burger", @"HotDog", @"Dziwne cos", @"Muffin", @"ciastko?", nil];
    
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecipiesListCell *cell = [tableView dequeueReusableCellWithIdentifier:[[RecipiesListCell class] description]];
    //TWORZENIE RZEDOW ODWOLUJESZ SIE DO XIB
    [cell customizeWithTitle: self.recipesArray[indexPath.row] name: self.namesArray[indexPath.row]];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.recipesArray.count;
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

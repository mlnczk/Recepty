//
//  RecipiesListViewController.m
//  Recepty Trening
//
//  Created by Rafal Kampa on 06.04.2016.
//  Copyright © 2016 Rafal Kampa. All rights reserved.
//

#import "RecipiesListViewController.h"
#import "RecipiesListCell.h"
#import "RecipiesDetailsViewController.h"
#import "AllRecipiesViewController.h"

@interface RecipiesListViewController ()
@property (nonatomic, strong)NSArray *recipesArray;
@property (weak, nonatomic) IBOutlet UILabel *recipesTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *namesArray;
@property (nonatomic, strong)NSString *selectedTitle;
@property (nonatomic, strong)NSString *selectedName;



@end

@implementation RecipiesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // ***WAZNE*** REJESTROWANIE XIBA
    
    [self.tableView registerNib:[UINib nibWithNibName:[[RecipiesListCell class] description] bundle:nil] forCellReuseIdentifier:[[RecipiesListCell class]description]];

    self.recipesArray = [[NSArray alloc] initWithObjects:@"recipe1", @"recipe2", @"recipe3", @"recipe4", @"recipe5", nil];
    
    self.namesArray = [[NSArray alloc] initWithObjects:@"Burger", @"HotDog", @"Spaghetti", @"Muffin", @"ciastko?", nil];
 
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //USTAWIANIE OBIEKTU DO PRZESLANIA
    self.selectedName = self.namesArray[indexPath.row];
    self.selectedTitle = self.recipesArray[indexPath.row];
    
    
    //ROBISZ PRZEJSCIE
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

- (IBAction)buttonClicked:(id)sender {
    [self performSegueWithIdentifier:@"showAllRecipies" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //MAGIC VOODOO!
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        RecipiesListViewController *vc = [segue destinationViewController];
        vc.selectedTitle = self.selectedTitle;
        vc.selectedName = self.selectedName;
        
    }else if ([segue.identifier isEqualToString:@"showAllRecipies"]){
        AllRecipiesViewController *vc = [segue destinationViewController];
        vc.nameArray = self.namesArray;
        vc.titleArray = self.recipesArray;
    }
    
   
}




@end

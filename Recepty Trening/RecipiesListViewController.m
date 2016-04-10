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
@property (weak, nonatomic) IBOutlet UILabel *labelText;




@end

@implementation RecipiesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // ***WAZNE*** REJESTROWANIE XIBA
    
    [self.tableView registerNib:[UINib nibWithNibName:[[RecipiesListCell class] description] bundle:nil] forCellReuseIdentifier:[[RecipiesListCell class]description]];

    self.recipesArray = [[NSArray alloc] initWithObjects:@"recipe1", @"recipe2", @"recipe3", @"recipe4", @"recipe5", nil];
    
    self.namesArray = [[NSArray alloc] initWithObjects:@"Burger", @"HotDog", @"Spaghetti", @"Muffin", @"ciastko?", nil];
    
    
    // userdefault, tworzenie dictionary i klucze!
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults ];
    NSMutableDictionary *dict = [defaults objectForKey:@"KLUCZ"];
    
    if (!dict) {
        dict = [NSMutableDictionary new];
        [dict setObject:@"dupa dupa" forKey:@"zapisanaNazwa"];
        [defaults setObject:dict forKey:@"KLUCZ"];
        [defaults synchronize];
        
    }else{
        self.labelText.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"zapisanaNazwa"]];
        
    }
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecipiesListCell *cell = [tableView dequeueReusableCellWithIdentifier:[[RecipiesListCell class] description]];
    //TWORZENIE RZEDOW ODWOLUJESZ SIE DO XIB
    [cell customizeWithTitle: self.recipesArray[indexPath.row] name: self.namesArray[indexPath.row] index:indexPath];
    cell.delegate = self;
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
-(void)sendIndexPath:(NSIndexPath *)indexPath{
    self.labelText.text = [NSString stringWithFormat:@"%li", indexPath.row];
    if (indexPath.row == 4){
        
//        [self allertPop];
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"alertTitle"
                                              message:@"alertMessage"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           NSLog(@"Cancel action");
                                       }];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                       self.labelText.text = @"asdada";
                                   }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}



//-(void)allertPop{
//    
//    UIAlertView *alertView = [[UIAlertView alloc]
//                              initWithTitle:@"DefaultStyle"
//                              message:@"the default alert view style"
//                              delegate:self
//                              cancelButtonTitle:@"Cancel"
//                              otherButtonTitles:@"OK", nil];
//    
//    [alertView show];
//    
//}
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if(buttonIndex == 1){
//        self.labelText.text = @"hfgcfggv";
//    }
//}


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

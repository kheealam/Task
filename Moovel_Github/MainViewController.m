//
//  ViewController.m
//  Moovel_Github
//
//  Created by Khizar Alam on 7/13/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end
GitAPIService * apiService;

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.users=[[NSMutableArray alloc] init];
    apiService=[[GitAPIService alloc] init];
    self.pageCount=1;
    self.tableView.tableFooterView=[[UIView alloc] init];
    __weak MainViewController * self_=self;
    self.success=^(NSArray *users, int totalPages) {
        self_.totalPages=totalPages;
        [self_.users addObjectsFromArray:users];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self_.tableView reloadData];
        });
        self_.pageCount++;
        
        [self_.activityIndicator stopAnimating];
    };
    self.failure = ^(NSError *error) {
        [self_.activityIndicator stopAnimating];
    };
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    [self.activityIndicator startAnimating];
    [apiService getDevsWithLanguage:@"Java" andPageNo:self.pageCount success:self.success withFailure:self.failure];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.users.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    User * user=self.users[[self.tableView indexPathForSelectedRow].row];
    DetailsViewController * dest=segue.destinationViewController;
    dest.user=user;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"toDetails" sender:self];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UserTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    User * user=self.users[indexPath.row];
    NSString *url=[NSString stringWithFormat:@"%@",user.avatarUrl];
    
    [cell initialize:self.users[indexPath.row]];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:url]
                  placeholderImage:[UIImage imageNamed:@"placeholder"]];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row>=self.users.count-1)
    {
        if(self.pageCount<self.totalPages){
            [self.activityIndicator startAnimating];
        
            [apiService getDevsWithLanguage:@"Java" andPageNo:self.pageCount success:self.success withFailure:self.failure];
        }
    }
}

@end

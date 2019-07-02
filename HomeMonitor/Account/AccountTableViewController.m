//
//  accountTableViewController.m
//  HomeMonitor
//
//  Created by zhj on 2019/6/28.
//  Copyright © 2019 zhj. All rights reserved.
//

#import "AccountTableViewController.h"
#import "CellColor.h"
#import "AccountTableViewCell.h"

@interface AccountTableViewController ()

@property (nonatomic, copy) NSArray<UIColor *> *contentSummerData;

@property (nonatomic, copy) NSArray<UIColor *> *contentWinterData;

@property (nonatomic, assign) AccountType accountType;

@end

@implementation AccountTableViewController

- (instancetype)initWithAccountType:(AccountType)accountType {
    if (self = [super init]) {
        self.accountType = accountType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)initView {
    self.tableView.backgroundColor = CellColor.whiteColor;
    self.tableView.separatorColor = CellColor.borderColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self initContentData];
    
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:[UINib nibWithNibName:@"AccountTableViewCell" bundle:nil] forCellReuseIdentifier:AccountTableViewCellIdentifier];
}

- (void)initContentData {
    self.contentSummerData = @[
                         CellColor.blueColor,
                         CellColor.orangeColor,
                         CellColor.tabbarTintColor,
                         ];
    
    self.contentWinterData = @[
                               CellColor.textColor,
                               CellColor.grayColor,
                               CellColor.blueColor,
                               ];
}
    

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.contentSummerData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AccountTableViewCellIdentifier forIndexPath:indexPath];
    
    if(cell && self.accountType == AccountTypeSummer) {
        [(AccountTableViewCell *)cell setupCellItem:self.contentSummerData[indexPath.section]];
        return cell;
    } else if(cell && self.accountType == AccountTypeWinter) {
        [(AccountTableViewCell *)cell setupCellItem:self.contentWinterData[indexPath.section]];
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

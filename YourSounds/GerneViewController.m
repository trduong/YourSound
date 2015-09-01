//
//  GerneViewController.m
//  YourSounds
//
//  Created by Duong Nguyen on 8/21/15.
//  Copyright (c) 2015 Duong Nguyen. All rights reserved.
//

#import "GerneViewController.h"
#import "Gerne.h"
#import "DetailsGerneViewController.h"
@interface GerneViewController (){

    RLMResults *gernes;
}

@end

@implementation GerneViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *jsonPath =[[NSBundle mainBundle] pathForResource:@"gerne" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSString *j = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSData *jdata =[j dataUsingEncoding:NSUTF8StringEncoding];//utf_8
    NSDictionary *json =[NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingMutableContainers error:nil];
    RLMRealm *realm = [RLMRealm defaultRealm];
    NSArray *gerneArray = [json objectForKey:@"categories"];
    for (int i = 0; i< [gerneArray count];i++) {
        Gerne * gerne = [Gerne gerneFromDict:[gerneArray objectAtIndex:i]];
        gerne.index = i+1;
        [realm beginWriteTransaction];
        [Gerne createOrUpdateInRealm:realm withValue:gerne];
        [realm commitWriteTransaction];
    }
    [self arrayGerneFromRealm];
}
-(RLMResults *)arrayGerneFromRealm{
    
    gernes = [Gerne allObjects];
    return gernes;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [gernes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GerneCell" forIndexPath:indexPath];
    Gerne *gerne = [gernes objectAtIndex:indexPath.row];
    cell.textLabel.text =gerne.gerneName;
    return cell;
}

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //[self performSegueWithIdentifier:@"SEGUE_TWO" sender:indexPath];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"SEGUE_TWO"]) {

    DetailsGerneViewController *vc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Gerne *currentGerne = [gernes objectAtIndex:indexPath.row];
        vc.gerneId = currentGerne.gerneID;
    }
}


@end

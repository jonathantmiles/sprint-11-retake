//
//  JTMLyricListTableViewController.m
//  LyricFinder
//
//  Created by Jonathan T. Miles on 10/24/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMLyricListTableViewController.h"
#import "JTMLyricController.h"
#import "JTMLyricDetailViewController.h"

@interface JTMLyricListTableViewController ()



@end

@implementation JTMLyricListTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _lyricController = [[JTMLyricController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _lyricController = [[JTMLyricController alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lyricController.lyrics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LyricCell" forIndexPath:indexPath];
 
    JTMSong *lyric = self.lyricController.lyrics[indexPath.row];
    cell.textLabel.text = lyric.title;
    cell.detailTextLabel.text = lyric.artist;
 
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JTMLyricDetailViewController *destVC = [segue destinationViewController];
    if ([destVC isKindOfClass: [JTMLyricDetailViewController class]]) {
        [destVC setLyricController: self.lyricController];
        if ([segue.identifier  isEqual: @"ShowDetail"]) {
            NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
            JTMSong *song = [self.lyricController.lyrics objectAtIndex:indexPath.row];
            [destVC setLyric: song];
        }
        
    }
}




@end

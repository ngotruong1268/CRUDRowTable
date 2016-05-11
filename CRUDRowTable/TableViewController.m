//
//  TableViewController.m
//  CRUDRowTable
//
//  Created by Ngô Sỹ Trường on 5/10/16.
//  Copyright © 2016 ngotruong. All rights reserved.
//

#import "TableViewController.h"
#import "Person.h"
#import "AddViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = [[NSMutableArray alloc]initWithCapacity:5 ];
    for (int i = 0; i < 5; i++) {
        Person *personData = [Person new];
        [self.arrayData addObject:personData];
    }
    
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(onAdd)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onEdit) ];
}

#pragma mark - Table view data source
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(void) onAdd {
  //  Person *personData = [Person new];
    AddViewController *addView = [AddViewController new];
    addView.arrayData = self.arrayData;
//    personData.name = addView.name ;
//    personData.age = addView.age;
    [self.navigationController pushViewController:addView animated:true];
   // [arrayData addObject:personData];
    [self.tableView reloadData];
    
    [self.tableView setEditing:false animated:YES];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onEdit) ];
}

-(void) onEdit {
    if (self.tableView.editing) {
        [self.tableView setEditing:false animated:YES];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                               target:self
                                                                                               action:@selector(onAdd)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self
                                                                                action:@selector(onEdit) ];
    } else {
        [self.tableView setEditing:true animated:YES];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Delete"
                                                                                  style:UIBarButtonItemStylePlain
                                                                                 target:self
                                                                                 action:@selector(onDelete)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self
                                                                                action:@selector(onEdit) ];
    }
}

-(void) onDelete{
    NSArray *selectedRows;
    selectedRows = self.tableView.indexPathsForSelectedRows;
    if (selectedRows.count > 0) {
        NSMutableIndexSet *indicesOfItemsToDelete = [NSMutableIndexSet new];
        for (NSIndexPath *selectedIndex in selectedRows) {
            [indicesOfItemsToDelete addIndex:selectedIndex.row];
        }
        [self.arrayData removeObjectsAtIndexes:indicesOfItemsToDelete];
        [self.tableView deleteRowsAtIndexPaths:selectedRows
                              withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    if (self.arrayData.count == 0) {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                               target:self
                                                                                               action:@selector(onAdd)];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrayData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Person *personData = [Person new];
    personData = self.arrayData[indexPath.row];
    cell.textLabel.text = personData.name;
    cell.detailTextLabel.text = personData.age;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayData removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

-(void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Person *person = [Person new];
    person = self.arrayData[sourceIndexPath.row];
    [self.arrayData removeObjectAtIndex:sourceIndexPath.row];
    [self.arrayData insertObject:person atIndex:destinationIndexPath.row];
}
@end

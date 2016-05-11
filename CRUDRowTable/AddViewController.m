//
//  AddViewController.m
//  CRUDRowTable
//
//  Created by Ngô Sỹ Trường on 5/11/16.
//  Copyright © 2016 ngotruong. All rights reserved.
//

#import "AddViewController.h"
#import "TableViewController.h"
#import "Person.h"
@interface AddViewController ()

@end

@implementation AddViewController
{
    UITextField *names;
    UITextField *ages;
    UILabel *lblName;
    UILabel *lblAge;
    UILabel *message;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Add Person";
    lblName = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, 100, 20)];
    names = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 180, 20)];
    lblAge = [[UILabel alloc] initWithFrame:CGRectMake(50, 120, 100, 20)];
    ages = [[UITextField alloc] initWithFrame:CGRectMake(50, 140, 100, 20)];
    
    names.borderStyle = 1;
    ages.borderStyle = 1;
    lblName.text = @"Name";
    lblAge.text = @"Age";
    
    [self.view addSubview:names];
    [self.view addSubview:ages];
    [self.view addSubview:lblName];
    [self.view addSubview:lblAge];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onSave) ];
    
}

-(void) onSave {
    Person *personData = [Person new];
    if (![names.text  isEqual: @""] || ![ages.text  isEqual: @""]) {
        personData.name = names.text;
        personData.age = ages.text;
        [self.arrayData addObject:personData];
        //NSLog(@"%@ - %@",personData.name,personData.age);
    }
}

@end

//
//  AddViewController.h
//  CRUDRowTable
//
//  Created by Ngô Sỹ Trường on 5/11/16.
//  Copyright © 2016 ngotruong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
@property(weak,nonatomic) NSString *name;
@property(weak,nonatomic) NSString *age;
@property(weak,nonatomic)  NSMutableArray *arrayData;
@end

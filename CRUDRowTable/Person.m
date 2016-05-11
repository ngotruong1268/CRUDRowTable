//
//  Person.m
//  CRUDRowTable
//
//  Created by Ngô Sỹ Trường on 5/10/16.
//  Copyright © 2016 ngotruong. All rights reserved.
//

#import "Person.h"

@implementation Person

NSArray *firstName;
NSArray *lastName;

-(instancetype) init {
    static dispatch_once_t dispatch_Once;
    dispatch_once (&dispatch_Once, ^ {
        firstName = @[@"Ngo",@"Nguyen",@"Pham",@"Tran",@"Le",@"Dinh"];
        lastName = @[@"Truong",@"Sung",@"Hung",@"Tien",@"Loi",@"Liet"];
    });
    if (self = [super init]) {
        _name = [NSString stringWithFormat:@"%@  %@",
                 firstName[arc4random_uniform((int)firstName.count)],
                 lastName[arc4random_uniform((int)lastName.count)]
                 ];
        _age =  [NSString stringWithFormat:@"%d",arc4random_uniform(80) + 1];
    }
    return self;
}
@end

//
//  ViewController.m
//  LayoutBug
//
//  Created by James Watmuff on 13/01/2015.
//  Copyright (c) 2015 James Watmuff. All rights reserved.
//

#import "ViewController.h"
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JVFloatLabeledTextField *field = [[JVFloatLabeledTextField alloc] init];
    [field setPlaceholder:@"foo" floatingTitle:@"bar"];
    field.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:field];
    
    id top = self.topLayoutGuide;
    NSDictionary *views = NSDictionaryOfVariableBindings(field, top);

    for(NSString *constraint in @[@"H:|[field]|",
                                  @"V:[top][field]"]) {
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraint
                                                                          options:0
                                                                          metrics:nil
                                                                            views:views]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
